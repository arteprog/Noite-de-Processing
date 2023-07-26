# This code is made for py5 https://p5coding.org using "imported mode"
# (either use the CLI sketch runner or Thonny + thonny-py5mode plugin)
# Thonny + py5 install instructions: https://abav.lugaralgum.com/como-instalar-py5
# You'll also need to install pymunk https://pymunk.org

import pymunk as pm   # importa lib de simulação
from random import choice

space = pm.Space()  # objeto espaço de simulação
shapes = []
constraints = []
pontos = 0
ACC = False

LEFT_CONTROL = 'a'
RIGHT_CONTROL = 'l'
PLUNGER_CONTROL = ' '

keys = {
    LEFT_CONTROL: False,
    RIGHT_CONTROL: False,
    PLUNGER_CONTROL: False,
        }  # key: state (held)

def settings():
    size(800, 750)  # área de desenho (width, height)
    
def setup():   # configs iniciais (para o py5)
    space.gravity = (0, 600) # (x, y) tupla vetor da acel.
    
    assemble_ring( 300, 200, 300, -PI, 0, 100 )
    
    build_box( 0, 200, 100, 850, True )
    build_box( 500, 200, 100, 850, True )
    
    build_box( 100, 850, 400, 100, True )
    shapes[-1].collision_type = 99
    
    build_line( 467, 300, 467, 850, 1 )
    build_line( 171, 579, 101, 546, 1 )
    build_line( 400, 581, 465, 553, 1 )
    

    # OBSTACULOS
    obst_pos = ( ( 292, 139 ), ) 
    obst_verts = ( ( 0, -20 ), ( 10, 0 ), ( 0, 20 ), ( -10, 0 ) )        
    for pos in obst_pos:
        build_poly( pos, obst_verts, False, 1.2, 0.75, 0.66, color(255, 180, 40) )
        pvj = pm.PivotJoint( space.static_body, shapes[-1].body, pos )
        space.add( pvj )
    
    #assemble_bouncy_pad((231, 398), (148, 452))
    
    
    global plunger  
    build_box(468, 620, 32, 30, static=False)
    plunger = shapes[-1].body
    shapes[-1].friction = 0
    shapes[-1].elasticity = 0 
    plunger_spring = pm.DampedSpring(plunger, space.static_body, (0, 0), (484, 635),
                                     0, stiffness=90000, damping=5000)
    space.add(plunger_spring)
    for x, y in ((300, 328), (208, 327), (392, 327)):
        build_ball(x, y, 20, static=True)
        shapes[-1].collision_type = 60
    
    global ball
    build_ball( 486, 610, 15 )
    shapes[-1].density = 0.02
    shapes[-1].collision_type = 1
    ball = shapes[-1].body #.apply_impulse_at_local_point( (0, -117000), (0,0) )
    try:
        ball_img = load_image('sphere.png')
        shapes[-1].img = ball_img
    except RuntimeError:
        print('could not load image')
        
    # When the ball falls out    
    handler = space.add_collision_handler( 99, 1 )
    handler.post_solve = lose_ball
    # Points!
    handler = space.add_collision_handler( 98, 1 )
    handler.separate = ponto
    
    #Paddle Comprimentos e Grossuras
    PC = 80       # "size"
    PG = Pc = 20  # larger radius
    Pg = 10       # smaller radius
    
    #Left Paddle shape & body
    global LPb, RPb
    LPpts = var_bar_pts(0, 0, PC, 0, PG, Pg ) # older simpler poly: ( (-Pc, -PG), (-Pc, PG), (PC, Pg), (PC, -Pg) )
    build_poly( ( 180, 600 ), LPpts, False, 0.1, 0.3, 0.5, color(127) )
    LPb = shapes[-1].body
    LPp = pm.PivotJoint( space.static_body, LPb, (180, 600) )
    LPrl = pm.RotaryLimitJoint( space.static_body, LPb,
                                -PI / 12, PI / 10 )
    constraints.append( LPp )
    space.add( LPp, LPrl )
    
    #Right Paddle shape & body
    RPpts = var_bar_pts(0, 0, -PC, 0, PG, Pg ) #( (-PC, -Pg), (-PC, Pg), (Pc, PG), (Pc, -PG) )
    build_poly( ( 467-80, 600 ), RPpts, False, 0.1, 0.3, 0.5, color(127) )
    RPb = shapes[-1].body
    RPp = pm.PivotJoint( space.static_body, RPb, (467-80, 600) )
    RPrl = pm.RotaryLimitJoint( space.static_body, RPb,
                                -PI / 12, PI / 6 )
    constraints.append( RPp )  # only for drawing
    space.add( RPp, RPrl )
    
    build_box( 102, 204, 60, 300, static=True )
    shapes[-1].sensor = True
    shapes[-1].collision_type = 70
    shapes[-1].cor = color(255,0,0,100)
    build_line( 162, 204, 162, 504, 1 )
    
    global ACC
    handler = space.add_collision_handler( 70, 1 )
    handler.begin = begin_acc
    handler.separate = stop_acc
    
    build_ball( 201, 457, 35, static=True )
    shapes[-1].collision_type = 60
    shapes[-1].cor = color(255,255,0)
    handler = space.add_collision_handler( 60, 1 )
    handler.post_solve = bump
    handler.separate = ponto
    

def draw():   # loop de animação
    background(222)   # fundo cinza, limpa frame
    #print(f"esquerda: {keys['a']}\ndireita: {keys['l']}") # "a: " + str(keys['a'])
    text_size(30)
    fill(0)
    text(pontos, width - 50 - text_width(str(pontos)), 50)
    #rect( 100, 0, 400, 650 );
    for ctt in constraints:
        if isinstance(ctt, pm.GrooveJoint):
            line(ctt.groove_a.x, ctt.groove_a.y, ctt.groove_b.x, ctt.groove_b.y)
        if isinstance(ctt, pm.DampedSpring):
            line(ctt.anchor_a.x, ctt.anchor_a.y, ctt.anchor_b.x, ctt.anchor_b.y)
    # desenhar os shapes
    for shp in shapes:
        
        if shp.collision_type == 70:
            no_stroke()
        else:
            stroke(0)
            stroke_weight(1)
        
        if isinstance(shp, pm.Segment):  # se for um segmento
            stroke_weight(shp.radius * 2)  # espessura do traço
            line(shp.a.x, shp.a.y, shp.b.x, shp.b.y)
            
        elif isinstance(shp, pm.Circle):            
            x, y = shp.body.position + shp.offset
            if hasattr(shp, 'img'):
                image_mode(CENTER)
                image(shp.img, x, y, shp.radius * 2, shp.radius * 2)
            else:
                stroke_weight(1)
                if hasattr(shp, 'cor'):
                    fill(shp.cor)
                else:
                    fill(255)
                circle(x, y, shp.radius * 2)
                
        elif isinstance(shp, pm.Poly):
            fill(shp.cor)
            begin_shape()
            for v in shp.get_vertices():
                a = shp.body.angle
                xt, yt = v.rotated(a) + shp.body.position
                vertex(xt, yt)
            end_shape(CLOSE)
    
    # paddle control
    if keys[LEFT_CONTROL]:
        LPb.torque = -175_000_000
    if keys[RIGHT_CONTROL]:
        RPb.torque = 175_000_000
    if keys[PLUNGER_CONTROL]: 
        plunger.position = ( plunger.position.x, lerp( plunger.position.y, 775, 0.25 ) )
        ball.position = ( ball.position.x, plunger.position.y-30 )
    
    if ACC:
       ball.apply_force_at_world_point( (0, -50000), ball.position )
    
    
    for _ in range(3):
        # avançar a simulação
        space.step(0.01)  # passo da simulação

def begin_acc(arbiter, space, data):
    global ACC
    ACC = True
    return False
    
def stop_acc(arbiter, space, data):
    global ACC
    ACC = False
    return False

def bump(arbiter, space, data):
    #arbiter.shapes[1].body
    ball.velocity *= 2

def lose_ball(arbiter, space, data):
    # perde pontos
    # arbiter.shapes[0]
    ball.position = (486, 610)
 
def ponto(arbiter, space, data):
    global pontos
    pontos += 1
    arbiter.shapes[0].cor = color(random(256), random(256), random(256))
    
 
def build_ball( x, y, r, static = False ):
    if static: 
        shp = pm.Circle(space.static_body, r, (x, y))  # corpo, raio, coordenadas relativas ao body (offset)
    else:
        mass = 0.2 * PI * r ** 2
        moi = pm.moment_for_circle(mass, 0, r, (0, 0))  # massa, raio interno, raio, centro
        body = pm.Body(mass, moi)
        body.position = (x, y)
        shp = pm.Circle(body, r, (0, 0))  # corpo, raio, coordenadas relativas ao body (offset)
    shp.friction = 0.3
    shp.elasticity = 0.5
    shapes.append(shp)
    shp.cor = color(127)
    if static:
        space.add(shp)
    else:
        space.add(body, shp)

def build_line(x1, y1, x2, y2, thickness, static = True ):
    shp = pm.Segment(space.static_body, (x1, y1), (x2, y2), thickness )
    space.add(shp)
    shapes.append(shp)

def build_box(x, y, w, h, static = False):  # x, y do canto superior esquerdo; larg, e alt
    if static:
        pts = ( (x, y), (x, y + h), (x + w, y + h), (x + w, y) )
        shp = pm.Poly(space.static_body, pts)
        space.add(shp)
    else:
        mass = 0.2 * w * h
        moi = pm.moment_for_box(mass, (w, h))  # massa, (larg, altura)
        body = pm.Body(mass, moi)
        body.position = (x + w / 2, y + h / 2)
        shp = pm.Poly.create_box(body, (w, h)) # corpo, (larg, altura)
        space.add(body, shp)
    shp.friction = 0.3
    shp.elasticity = 0.5
    shp.cor = color(127)
    shapes.append(shp)

def build_poly( pos, verts, static, density, friction, elasticity, cor ):
    if static:
        shp = pm.Poly( space.static_body, verts )
    else:
        body = pm.Body(0, 0)
        body.position = pos
        space.add( body )
        shp = pm.Poly( body, verts )
    shp.density = density
    shp.friction = friction
    shp.elasticity = elasticity
    shp.cor = cor
    shapes.append(shp)
    space.add( shp )
    
def assemble_ring( cx, cy, rad, start, stop, E ):
    res = 32
    s = (stop-start) / res;
    A = pm.Vec2d(cx, cy)
    for r in range(res):
        verts = [];
        t1 = pm.Vec2d( cos(start + r*s), sin(start + r*s) );
        t2 = pm.Vec2d( cos(start + (r+1)*s), sin(start + (r+1)*s) );
        verts.append( A + (t1 * rad) )
        verts.append( A + (t1 * (rad - E)) )
        verts.append( A + (t2 * (rad - E)) )
        verts.append( A + (t2 * rad) )
        shp = pm.Poly(space.static_body, verts)
        space.add(shp)
        shp.cor = color(127)
        shp.collision_type = 98
        shapes.append(shp)

def arc_pts(cx, cy, w, h, start_angle, end_angle, res=5):
    """
    Returns points approximating an arc using the same
    signature as the original Processing arc().
    """
    sweep_angle = end_angle - start_angle
        
    if abs(sweep_angle) < 0.0001:
        vx = cx + cos(start_angle) * w / 2.0
        vy = cy + sin(start_angle) * h / 2.0
        return [(vx, vy)]
    num_points = abs(sweep_angle * w / 2) / res
    pts_list = []
    step_angle = float(sweep_angle) / num_points    
    va = start_angle
    side = 1 if sweep_angle > 0 else -1
    while va * side < end_angle * side or abs(va - end_angle) < 0.0001:
        vx = cx + cos(va) * w / 2.0
        vy = cy + sin(va) * h / 2.0
        pts_list.append((vx, vy))
        va += step_angle
    return pts_list

def var_bar_pts(p1x, p1y, p2x, p2y, r1, r2=None, **kwargs):
    """
    Tangent/tangent shape on 2 circles of arbitrary radius
    """
    r2 = r2 if r2 is not None else r1
    shorter = kwargs.pop('shorter', 0)
    assert not (shorter and r1 != r2),\
        "Can't draw shorter var_bar with different radii"
    d = dist(p1x, p1y, p2x, p2y)
    ri = r1 - r2
    result = []
    if d > abs(ri):
        clipped_ri_over_d = min(1, max(-1, ri / d))
        beta = asin(clipped_ri_over_d) + HALF_PI
        angle = atan2(p1x - p2x, p2y - p1y) + HALF_PI
        offset = shorter / 2.0 if shorter < d else d / 2.0
        result.extend(arc_pts(offset, 0, r1 * 2, r1 * 2,
                     -beta - PI, beta - PI, **kwargs))
        result.extend(arc_pts(d - offset, 0, r2 * 2, r2 * 2,
                      beta - PI, PI - beta, **kwargs))
        return rotate_offset_points(result, angle, p1x, p1y)
    else:
        r = max(r1, r2)
        x, y = (p1x, p1y) if r1 > r2 else (p2x, p2y)
        return arc_pts(x, y, r * 2, r * 2, 0, TWO_PI, **kwargs)
                          
def rotate_offset_points(pts, angle, offx, offy, y0=0, x0=0):
    return [(((xp - x0) * cos(angle) - (yp - y0) * sin(angle)) + x0 + offx,
             ((yp - y0) * cos(angle) + (xp - x0) * sin(angle)) + y0 + offy)
                for xp, yp in pts]

def median_center(verts):
        minx =  999999
        miny =  999999
        maxx = -999999
        maxy = -999999
        for x,y in verts:
                if x < minx: minx = x
                if y < miny: miny = y
                if x > maxx: maxx = x
                if y > maxy: maxy = y
        return minx + 0.5*(maxx-minx), miny + 0.5*(maxy-miny)


def cpvsetlength( V, l ):
        return V.normalized() * l

def assemble_bouncy_pad(A, B, pad_h=60, pad_tck=20, springs=5, stiffness=400, damping=5):
    A = pm.Vec2d(*A)
    B = pm.Vec2d(*B)
    verts = [A, B]
    delta = cpvsetlength(pm.Vec2d.perpendicular( B - A ), pad_tck )
    verts.append( B + delta )
    verts.append( A + delta )
    
    thi = 2
    ht = 1
    delta = cpvsetlength( pm.Vec2d.perpendicular( B - A ), pad_h )
    boA = A + delta
    boB = B + delta

    build_poly(median_center(verts), verts, False, 0.01, 0.92, 0.025, color(30, 180, 160) )
    shapes[-1].collision_type = 98
    pgA = pm.GrooveJoint( space.static_body, shapes[-1].body, boA, verts[3], verts[3] )
    pgB = pm.GrooveJoint( space.static_body, shapes[-1].body, boB, verts[2], verts[2] )
    constraints.append( pgA )
    constraints.append( pgB )
    space.add( pgA, pgB )

    if springs > 1 :
        r =  0.9 / (springs-1)
        delta = cpvsetlength( pm.Vec2d.perpendicular( B - A ), pad_h + 1 )
        boA = A + delta
        boB = B + delta
        for i in range(springs):
            ds = pm.DampedSpring(shapes[-1].body, space.static_body, 
                               verts[3].interpolate_to( verts[2], 0.05+(i*r) ),
                               boA.interpolate_to( boB, 0.05+(i*r) ),
                               rest_length=delta.length, stiffness=stiffness, damping=damping )
            constraints.append(ds)
            space.add( ds )
    
def mouse_clicked():
    print(f'{mouse_x}, {mouse_y}')

def key_pressed():
    keys[key] = True
    
def key_released():
    keys[key] = False
    


