var mediaWikiLoadStart=(new Date()).getTime(),mwPerformance=(window.performance&&performance.mark)?performance:{mark:function(){}};mwPerformance.mark('mwLoadStart');function isCompatible(ua){if(ua===undefined){ua=navigator.userAgent;}return!((ua.indexOf('MSIE')!==-1&&parseFloat(ua.split('MSIE')[1])<8)||(ua.indexOf('Firefox/')!==-1&&parseFloat(ua.split('Firefox/')[1])<3)||(ua.indexOf('Opera/')!==-1&&(ua.indexOf('Version/')===-1?parseFloat(ua.split('Opera/')[1])<10:parseFloat(ua.split('Version/')[1])<12))||(ua.indexOf('Opera ')!==-1&&parseFloat(ua.split(' Opera ')[1])<10)||ua.match(/BlackBerry[^\/]*\/[1-5]\./)||ua.match(/webOS\/1\.[0-4]/)||ua.match(/PlayStation/i)||ua.match(/SymbianOS|Series60/)||ua.match(/NetFront/)||ua.match(/Opera Mini/)||ua.match(/S40OviBrowser/)||ua.match(/MeeGo/)||(ua.match(/Glass/)&&ua.match(/Android/)));}(function(){if(!isCompatible()){document.documentElement.className=document.documentElement.className.replace(/(^|\s)client-js(\s|$)/,'$1client-nojs$2');return;}
function startUp(){mw.config=new mw.Map(true);mw.loader.addSource({"local":"/w/load.php"});mw.loader.register([["site","VKlpqsmC"],["noscript","cF89i5nH",[],"noscript"],["filepage","bFEXraOJ"],["user.groups","LHPg2Njy",[],"user"],["user","01nOBSCi",[],"user"],["user.cssprefs","64Nx0RWw",[],"private"],["user.defaults","OfGUWtVS"],["user.options","4VYLPU7n",[6],"private"],["user.tokens","REMgD2FG",[],"private"],["mediawiki.language.data","pfuGup+v",[168]],["mediawiki.skinning.elements","E11NSxLg"],["mediawiki.skinning.content","sxMsAAWJ"],["mediawiki.skinning.interface","t5aSV8BJ"],["mediawiki.skinning.content.parsoid","A/+AQTT0"],["mediawiki.skinning.content.externallinks","A1hQpZ/Q"],["jquery.accessKeyLabel","Ft1NzWA7",[25,129]],["jquery.appear","2yu57NDX"],["jquery.arrowSteps","iprBXJJI"],["jquery.async","ccDz4BTZ"],["jquery.autoEllipsis","qu7d0G40",[37]],["jquery.badge","LmsRaKH9",[165]],["jquery.byteLength","ts+RPb5N"],["jquery.byteLimit","2NSWn/9v",[21]],[
"jquery.checkboxShiftClick","DbHr2pWv"],["jquery.chosen","6MdeWkqL"],["jquery.client","mAbYsOxs"],["jquery.color","HI5syPeK",[27]],["jquery.colorUtil","vUpS4L2M"],["jquery.confirmable","bNvLbqRB",[169]],["jquery.cookie","a6vZBTOP"],["jquery.expandableField","VSsgY9MQ"],["jquery.farbtastic","rqgjcxOa",[27]],["jquery.footHovzer","xxrZqJP4"],["jquery.form","PDxH3tiy"],["jquery.fullscreen","e/jqccgV"],["jquery.getAttrs","7ocN0w/r"],["jquery.hidpi","Zaj9ecHG"],["jquery.highlightText","8SkkgKSS",[227,129]],["jquery.hoverIntent","zB9a2wt7"],["jquery.i18n","id3q2zte",[167]],["jquery.localize","22+TugI7"],["jquery.makeCollapsible","m44e7QOw"],["jquery.mockjax","6yICurfg"],["jquery.mw-jump","hKw+Au+K"],["jquery.mwExtension","+caZMerd"],["jquery.placeholder","Yi/9/4Kk"],["jquery.qunit","7D5WUvWF"],["jquery.qunit.completenessTest","5TnCYG0s",[46]],["jquery.spinner","JxURDFu5"],["jquery.jStorage","PGans7v4",[93]],["jquery.suggestions","vqPJy2gU",[37]],["jquery.tabIndex","l7V4mtD+"],[
"jquery.tablesorter","U1JnzVzQ",[227,129,170]],["jquery.textSelection","PCR4l9nA",[25]],["jquery.throttle-debounce","idIGL6uO"],["jquery.validate","HNAx9zz7"],["jquery.xmldom","5cNOubTR"],["jquery.tipsy","gObUMkpQ"],["jquery.ui.core","NnX1S3PL",[59],"jquery.ui"],["jquery.ui.core.styles","sFZ9COam",[],"jquery.ui"],["jquery.ui.accordion","XSVbba6t",[58,78],"jquery.ui"],["jquery.ui.autocomplete","qQc/BTzv",[67],"jquery.ui"],["jquery.ui.button","p489wICw",[58,78],"jquery.ui"],["jquery.ui.datepicker","PX0XEK94",[58],"jquery.ui"],["jquery.ui.dialog","Z6zT6Wdd",[62,65,69,71],"jquery.ui"],["jquery.ui.draggable","pZ/dLgis",[58,68],"jquery.ui"],["jquery.ui.droppable","LcyNQK2V",[65],"jquery.ui"],["jquery.ui.menu","gt02ZTaq",[58,69,78],"jquery.ui"],["jquery.ui.mouse","Ciy9W/kc",[78],"jquery.ui"],["jquery.ui.position","ZbKNgFHl",[],"jquery.ui"],["jquery.ui.progressbar","jek2nW+p",[58,78],"jquery.ui"],["jquery.ui.resizable","SeeMJ5mw",[58,68],"jquery.ui"],["jquery.ui.selectable","OMs9G9bl",[58,68],
"jquery.ui"],["jquery.ui.slider","TS9EpCJh",[58,68],"jquery.ui"],["jquery.ui.sortable","mXUWx66n",[58,68],"jquery.ui"],["jquery.ui.spinner","8Qn/I5e9",[62],"jquery.ui"],["jquery.ui.tabs","RLJog0Ka",[58,78],"jquery.ui"],["jquery.ui.tooltip","GAi+3spd",[58,69,78],"jquery.ui"],["jquery.ui.widget","x06GgnLF",[],"jquery.ui"],["jquery.effects.core","XT1Nfryb",[],"jquery.ui"],["jquery.effects.blind","Xd9Cb2J7",[79],"jquery.ui"],["jquery.effects.bounce","/K0QjCUu",[79],"jquery.ui"],["jquery.effects.clip","Kwj1aJ4h",[79],"jquery.ui"],["jquery.effects.drop","8/IFQbJe",[79],"jquery.ui"],["jquery.effects.explode","NslW3Xg5",[79],"jquery.ui"],["jquery.effects.fade","0p9SQ/qr",[79],"jquery.ui"],["jquery.effects.fold","TH0awWv9",[79],"jquery.ui"],["jquery.effects.highlight","ypJXl1u5",[79],"jquery.ui"],["jquery.effects.pulsate","r48j3krY",[79],"jquery.ui"],["jquery.effects.scale","sl2L6PKM",[79],"jquery.ui"],["jquery.effects.shake","9jhuA0p8",[79],"jquery.ui"],["jquery.effects.slide","0OFksOku",[79],
"jquery.ui"],["jquery.effects.transfer","zq5dVdmR",[79],"jquery.ui"],["json","kB2Q/9V5",[],null,null,"return!!(window.JSON\u0026\u0026JSON.stringify\u0026\u0026JSON.parse);"],["moment","IHUdl13q"],["mediawiki.apihelp","igSwBaAW",[119]],["mediawiki.template","RSyFqNTv"],["mediawiki.template.mustache","WcDiunGA",[96]],["mediawiki.template.regexp","ja/S60IL",[96]],["mediawiki.apipretty","E6w3tz0Y"],["mediawiki.api","OqT9bESt",[145,8]],["mediawiki.api.category","yemsrkrQ",[134,100]],["mediawiki.api.edit","gy6F84Bp",[134,100]],["mediawiki.api.login","79PMZJQF",[100]],["mediawiki.api.options","1MY0GhHw",[100]],["mediawiki.api.parse","0QkpenxC",[100]],["mediawiki.api.upload","hzsfkbuv",[227,93,102]],["mediawiki.api.watch","bqbSOBbi",[100]],["mediawiki.content.json","ENG9/n6u"],["mediawiki.confirmCloseWindow","62uz22JW"],["mediawiki.debug","ujy/1QfC",[32,57]],["mediawiki.debug.init","t8m/foUI",[110]],["mediawiki.feedback","TIlqg5Rr",[134,125,229]],["mediawiki.feedlink","dKTbGhwQ"],[
"mediawiki.filewarning","KD9Q2QcU",[229]],["mediawiki.ForeignApi","Xbdm7Rpn",[116]],["mediawiki.ForeignApi.core","O5f9DQgn",[100,228]],["mediawiki.helplink","LwfFJztN"],["mediawiki.hidpi","votn7neG",[36],null,null,"return'srcset'in new Image();"],["mediawiki.hlist","YisRBr1Z",[25]],["mediawiki.htmlform","cM5OyOHz",[22,129]],["mediawiki.htmlform.styles","6jSOs0HT"],["mediawiki.htmlform.ooui.styles","hqpR/sfZ"],["mediawiki.icon","5JxynzIw"],["mediawiki.inspect","Grq47qOa",[21,93,129]],["mediawiki.messagePoster","vjMrxOpJ",[100,228]],["mediawiki.messagePoster.wikitext","Pco9kYML",[102,125]],["mediawiki.notification","ZzuayS9w",[177]],["mediawiki.notify","GGYUXO6c"],["mediawiki.RegExp","h+qpXTLw"],["mediawiki.pager.tablePager","HcgMHICy"],["mediawiki.searchSuggest","sTZlSf/9",[35,45,50,100]],["mediawiki.sectionAnchor","hhgr4URg"],["mediawiki.storage","xauVfjkG"],["mediawiki.Title","12bXa6vx",[21,145]],["mediawiki.Upload","yK6+UqCI",[106]],["mediawiki.ForeignUpload","fbcbE6Al",[115,135]],[
"mediawiki.ForeignStructuredUpload","zv053O6S",[136]],["mediawiki.Upload.Dialog","vNaHnN5k",[139]],["mediawiki.Upload.BookletLayout","+bCbMN8i",[135,169,229]],["mediawiki.ForeignStructuredUpload.BookletLayout","X2G/uMdA",[137,139,224,223]],["mediawiki.toc","zSWz2I67",[146]],["mediawiki.Uri","7lr7beDx",[145,98]],["mediawiki.user","7RyuRpV2",[100,146,7]],["mediawiki.userSuggest","Q/To3GQB",[50,100]],["mediawiki.util","d3q00YjP",[15,128]],["mediawiki.cookie","jaSbUK78",[29]],["mediawiki.toolbar","ntgbuCrF"],["mediawiki.experiments","K/lGtxd7"],["mediawiki.action.edit","j1prhAua",[22,53,150]],["mediawiki.action.edit.styles","hzDEUAUy"],["mediawiki.action.edit.collapsibleFooter","YTkOnGhx",[41,146,123]],["mediawiki.action.edit.preview","DgOC68O1",[33,48,53,155,100,169]],["mediawiki.action.edit.stash","pddzRKCB",[35,100]],["mediawiki.action.history","neY8JL+g"],["mediawiki.action.history.diff","tVhUPJb/"],["mediawiki.action.view.dblClickEdit","KmXqmzIi",[177,7]],[
"mediawiki.action.view.metadata","x0uhJzVG"],["mediawiki.action.view.categoryPage.styles","D1rDyIPc"],["mediawiki.action.view.postEdit","sryk0LhP",[146,169,96]],["mediawiki.action.view.redirect","XNehyga4",[25]],["mediawiki.action.view.redirectPage","sXAxqdBs"],["mediawiki.action.view.rightClickEdit","WaxGZk1T"],["mediawiki.action.edit.editWarning","KzAWp8jt",[53,109,169]],["mediawiki.action.view.filepage","qCkMdIqG"],["mediawiki.language","yF69pX0t",[166,9]],["mediawiki.cldr","7bdsXUES",[167]],["mediawiki.libs.pluralruleparser","pxYVWW/e"],["mediawiki.language.init","NeO+hhIZ"],["mediawiki.jqueryMsg","EjtXgyaf",[227,165,145,7]],["mediawiki.language.months","xSPMUPf6",[165]],["mediawiki.language.names","k2SG3pjA",[168]],["mediawiki.language.specialCharacters","d9jPZXyd",[165]],["mediawiki.libs.jpegmeta","IFXTKNIF"],["mediawiki.page.gallery","ShSrwK54",[54,175]],["mediawiki.page.gallery.styles","w60+40Wu"],["mediawiki.page.ready","wNIFsfio",[15,23,41,43,45]],["mediawiki.page.startup",
"nD38F4mX",[145]],["mediawiki.page.patrol.ajax","m0j7F64d",[48,134,100,177]],["mediawiki.page.watch.ajax","b0vmusa1",[107,177]],["mediawiki.page.image.pagination","jC2A2YSV",[48,142]],["mediawiki.special","2CYIirie"],["mediawiki.special.block","2/tWLdnW",[145]],["mediawiki.special.changeemail","F/4OC/h/",[145]],["mediawiki.special.changeslist","a+tXfk6E"],["mediawiki.special.changeslist.legend","dmuJNJ7V"],["mediawiki.special.changeslist.legend.js","QzL4awnJ",[41,146]],["mediawiki.special.changeslist.enhanced","kd8/8Fnz"],["mediawiki.special.edittags","upcQqqKq",[24]],["mediawiki.special.edittags.styles","4W7u8Vor"],["mediawiki.special.import","siyir8yP"],["mediawiki.special.movePage","F7CFDCVs",[221]],["mediawiki.special.movePage.styles","pHeACjL2"],["mediawiki.special.pageLanguage","R1Hc98Ho"],["mediawiki.special.pagesWithProp","TjgmmyYN"],["mediawiki.special.preferences","YW/U9IS6",[109,165,127]],["mediawiki.special.recentchanges","8Btfo25N",[181]],["mediawiki.special.search",
"CbBixqak"],["mediawiki.special.undelete","UoYaIV5t"],["mediawiki.special.upload","t9u/3JOH",[48,134,100,109,169,173,96]],["mediawiki.special.userlogin.common.styles","TbB2RpUm"],["mediawiki.special.userlogin.signup.styles","+L/ucoga"],["mediawiki.special.userlogin.login.styles","yLh3soJD"],["mediawiki.special.userlogin.signup.js","26b8/DZq",[54,100,169]],["mediawiki.special.unwatchedPages","5SEiagCN",[134,107]],["mediawiki.special.javaScriptTest","fa+Z67mg",[142]],["mediawiki.special.version","OFxZBPOc"],["mediawiki.legacy.config","JUVVpQS3"],["mediawiki.legacy.commonPrint","tcJFuVE2"],["mediawiki.legacy.protect","7iDTFmTU",[22]],["mediawiki.legacy.shared","i20B8wuF"],["mediawiki.legacy.oldshared","kBOVaH/N"],["mediawiki.legacy.wikibits","BeqN1VHb",[145]],["mediawiki.ui","lpt3UtnJ"],["mediawiki.ui.checkbox","6ZzpJ+Ue"],["mediawiki.ui.radio","oRokTNN2"],["mediawiki.ui.anchor","cN1SgpYx"],["mediawiki.ui.button","RnowCEEm"],["mediawiki.ui.input","0SPWNHSf"],["mediawiki.ui.icon",
"n+A4YGhM"],["mediawiki.ui.text","lAvlLtzE"],["mediawiki.widgets","X3zPh3DP",[19,22,224,222]],["mediawiki.widgets.styles","dYeRNHkp"],["mediawiki.widgets.DateInputWidget","YBV3Wtab",[94,229]],["mediawiki.widgets.CategorySelector","hgjOCAGB",[115,134,229]],["mediawiki.widgets.UserInputWidget","T0DlnDMd",[229]],["es5-shim","9Yx+t12D",[],null,null,"return(function(){'use strict';return!this\u0026\u0026!!Function.prototype.bind;}());"],["dom-level2-shim","p3BertyL",[],null,null,"return!!window.Node;"],["oojs","5unXSlKt",[226,93]],["oojs-ui","349+bMmZ",[228,230,231,232,233]],["oojs-ui.styles","1oWgMz7j"],["oojs-ui.styles.icons","00aR3O12"],["oojs-ui.styles.indicators","vCClYRPL"],["oojs-ui.styles.textures","wEtg2RTq"],["oojs-ui.styles.icons-accessibility","cYszGo+k"],["oojs-ui.styles.icons-alerts","i43jN0ZV"],["oojs-ui.styles.icons-content","rHJOxvPz"],["oojs-ui.styles.icons-editing-advanced","ZGorxojm"],["oojs-ui.styles.icons-editing-core","uS4/ssnW"],["oojs-ui.styles.icons-editing-list",
"Zckh5gAt"],["oojs-ui.styles.icons-editing-styling","8APDJepY"],["oojs-ui.styles.icons-interactions","5Eat+P6I"],["oojs-ui.styles.icons-layout","iUZZ9cRa"],["oojs-ui.styles.icons-location","eAJmG59B"],["oojs-ui.styles.icons-media","b7Tsh8HJ"],["oojs-ui.styles.icons-moderation","m8CqnScT"],["oojs-ui.styles.icons-movement","BEk1DM4o"],["oojs-ui.styles.icons-user","ivukQHJp"],["oojs-ui.styles.icons-wikimedia","j1ZKvGlv"],["skins.vector.styles","n35f8bFo"],["skins.vector.styles.responsive","+FGAcjHf"],["skins.vector.js","uBTd36/O",[51,54]],["ext.confirmEdit.fancyCaptcha.styles","FbR2VDSQ"],["ext.confirmEdit.fancyCaptcha","fe5Mlk98",[100]],["ext.confirmEdit.fancyCaptchaMobile","fe5Mlk98",["mobile.startup"]]]);;mw.config.set({"wgLoadScript":"/w/load.php","debug":!1,"skin":"vector","stylepath":"/w/skins","wgUrlProtocols":
"bitcoin\\:|ftp\\:\\/\\/|ftps\\:\\/\\/|geo\\:|git\\:\\/\\/|gopher\\:\\/\\/|http\\:\\/\\/|https\\:\\/\\/|irc\\:\\/\\/|ircs\\:\\/\\/|magnet\\:|mailto\\:|mms\\:\\/\\/|news\\:|nntp\\:\\/\\/|redis\\:\\/\\/|sftp\\:\\/\\/|sip\\:|sips\\:|sms\\:|ssh\\:\\/\\/|svn\\:\\/\\/|tel\\:|telnet\\:\\/\\/|urn\\:|worldwind\\:\\/\\/|xmpp\\:|\\/\\/","wgArticlePath":"/wiki/$1","wgScriptPath":"/w","wgScriptExtension":".php","wgScript":"/w/index.php","wgSearchType":null,"wgVariantArticlePath":!1,"wgActionPaths":{},"wgServer":"https://garoa.net.br","wgServerName":"garoa.net.br","wgUserLanguage":"pt-br","wgContentLanguage":"pt-br","wgTranslateNumerals":!0,"wgVersion":"1.26.2","wgEnableAPI":!0,"wgEnableWriteAPI":!0,"wgMainPageTitle":"Página principal","wgFormattedNamespaces":{"-2":"Mídia","-1":"Especial","0":"","1":"Discussão","2":"Usuário","3":"Usuário Discussão","4":"Garoa Hacker Clube","5":"Garoa Hacker Clube Discussão","6":"Arquivo","7":"Arquivo Discussão","8":"MediaWiki","9":
"MediaWiki Discussão","10":"Predefinição","11":"Predefinição Discussão","12":"Ajuda","13":"Ajuda Discussão","14":"Categoria","15":"Categoria Discussão","104":"Blog","105":"Blog talk"},"wgNamespaceIds":{"mídia":-2,"especial":-1,"":0,"discussão":1,"usuário":2,"usuário_discussão":3,"garoa_hacker_clube":4,"garoa_hacker_clube_discussão":5,"arquivo":6,"arquivo_discussão":7,"mediawiki":8,"mediawiki_discussão":9,"predefinição":10,"predefinição_discussão":11,"ajuda":12,"ajuda_discussão":13,"categoria":14,"categoria_discussão":15,"blog":104,"blog_talk":105,"imagem":6,"imagem_discussão":7,"ficheiro":6,"ficheiro_discussão":7,"usuária":2,"usuária_discussão":3,"image":6,"image_talk":7,"media":-2,"special":-1,"talk":1,"user":2,"user_talk":3,"project":4,"project_talk":5,"file":6,"file_talk":7,"mediawiki_talk":9,"template":10,"template_talk":11,"help":12,"help_talk":13,"category":14,"category_talk":15},"wgContentNamespaces":[0],"wgSiteName":"Garoa Hacker Clube","wgDBname":
"ghc_wiki","wgExtraSignatureNamespaces":[],"wgAvailableSkins":{"vector":"Vector","fallback":"Fallback","apioutput":"ApiOutput"},"wgExtensionAssetsPath":"/w/extensions","wgCookiePrefix":"ghc_wiki_mw_","wgCookieDomain":"","wgCookiePath":"/","wgCookieExpiration":15552000,"wgResourceLoaderMaxQueryLength":2000,"wgCaseSensitiveNamespaces":[],"wgLegalTitleChars":" %!\"$&'()*,\\-./0-9:;=?@A-Z\\\\\\^_`a-z~+\\u0080-\\uFFFF","wgResourceLoaderStorageVersion":1,"wgResourceLoaderStorageEnabled":!1,"wgResourceLoaderLegacyModules":["mediawiki.legacy.wikibits"],"wgForeignUploadTargets":[],"wgEnableUploads":!0});window.RLQ=window.RLQ||[];while(RLQ.length){RLQ.shift()();}window.RLQ={push:function(fn){fn();}};}var script=document.createElement('script');script.src="/w/load.php?debug=false&lang=pt-br&modules=jquery%2Cmediawiki&only=scripts&skin=vector&version=R5LBFehQ";script.onload=script.onreadystatechange=function(){if(!script.readyState||/loaded|complete/.test(script.readyState)){script.onload=
script.onreadystatechange=null;script=null;startUp();}};document.getElementsByTagName('head')[0].appendChild(script);}());