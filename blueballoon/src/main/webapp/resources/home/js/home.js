!function() {
    return "function" != typeof NodeList.prototype.forEach && void (NodeList.prototype.forEach = Array.prototype.forEach)
}(), Array.isArray || (Array.isArray = function(o) {
    return window.$ && $.isArray ? $.isArray(o) : o && o.constructor == Array
}), function() {
    for (var o, t = function() {}, n = ["assert", "clear", "count", "debug", "dir", "dirxml", "error", "exception", "group", "groupCollapsed", "groupEnd", "info", "log", "markTimeline", "profile", "profileEnd", "table", "time", "timeEnd", "timeline", "timelineEnd", "timeStamp", "trace", "warn"], e = n.length, r = window.console = window.console || {}; e--;)
        o = n[e], r[o] || (r[o] = t)
}(), document.contains || (document.contains = function() {
    return document.body.contains.apply(document.body, arguments)
}), !function() {
    function o(o, t) {
        t = t || {
            bubbles: !1,
            cancelable: !1,
            detail: void 0
        };
        var n = document.createEvent("CustomEvent");
        return n.initCustomEvent(o, t.bubbles, t.cancelable, t.detail), n
    }
    return "function" != typeof window.CustomEvent && (o.prototype = window.Event.prototype, void (window.CustomEvent = o))
}();

function Func() {
    var e = this;
    e.check_string = function(e, t) {
        switch (t) {
        case "email":
            return /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(e)
        }
    }, e.ucfirst = function(e) {
        e += "";
        var t = e.charAt(0).toUpperCase();
        return t + e.substr(1)
    }, e.number_format = function(e, t, n, i) {
        e = (e + "").replace(",", "").replace(" ", "");
        var o = isFinite(+e) ? +e : 0,
            a = isFinite(+t) ? Math.abs(t) : 0,
            r = "undefined" == typeof i ? "," : i,
            s = "undefined" == typeof n ? "." : n,
            c = "",
            l = function(e, t) {
                var n = Math.pow(10, t);
                return "" + Math.round(e * n) / n
            };
        return c = (a ? l(o, a) : "" + Math.round(o)).split("."), c[0].length > 3 && (c[0] = c[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, r)), (c[1] || "").length < a && (c[1] = c[1] || "", c[1] += new Array(a - c[1].length + 1).join("0")), c.join(s)
    }, e.set_cookie = function(e, t, n, i, o, a) {
        if (n) {
            var r = new Date;
            r.setTime(r.getTime() + 1e3 * n), n = r.toGMTString()
        }
        document.cookie = e + "=" + escape(t) + (n ? "; expires=" + n : "") + (i ? "; path=" + i : "") + (o ? "; domain=" + o : "") + (a ? "; secure" : "")
    }, e.get_cookie = function(e) {
        var t = " " + document.cookie,
            n = " " + e + "=",
            i = null,
            o = 0,
            a = 0;
        return t.length > 0 && (o = t.indexOf(n), o != -1 && (o += n.length, a = t.indexOf(";", o), a == -1 && (a = t.length), i = unescape(t.substring(o, a)))), i
    }, e.is_element_on_screen = function(e, t) {
        t = "undefined" != typeof t ? t : 0;
        var n = $(e);
        if ($(e).length) {
            var i = $(window),
                o = i.scrollTop(),
                a = o + i.height(),
                r = n.offset().top,
                s = r + n.height() - t;
            return Math.min(s, a) >= Math.max(r, o)
        }
    }, e.smooth_scroll = function(t, n, i, o, a) {
        var r = $(window).scrollTop();
        if (i < 0)
            return void (o && o());
        var s,
            c = (!isNaN(parseFloat(n)) && isFinite(n) ? n : n.offset().top + (a ? a : 0)) - r;
        s = 0 === i ? c : c / i * 10, this.scrollToTimerCache = setTimeout(function() {
            isNaN(parseInt(s, 10)) || (window.scrollTo(0, r + s), e.smooth_scroll(t, n, i - 10, !!o && o(), a))
        }.bind(this), 10)
    }, e.strip = function(e) {
        var t = document.createElement("DIV");
        return t.innerHTML = e, t.textContent || t.innerText || ""
    }, e.debounce = function(e, t, n) {
        var i;
        return function() {
            var o = this,
                a = arguments,
                r = function() {
                    i = null, n || e.apply(o, a)
                },
                s = n && !i;
            clearTimeout(i), i = setTimeout(r, t), s && e.apply(o, a)
        }
    }, e.getAbsoluteHeight = function(e) {
        e = "string" == typeof e ? document.querySelector(e) : e;
        var t = window.getComputedStyle(e),
            n = parseFloat(t.marginTop) + parseFloat(t.marginBottom);
        return Math.ceil(e.offsetHeight + n)
    }
}
function Common() {
    var e = this;
    e.func = new Func, e.month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], e.logged = $("html").is(".logged"), e.get_cdn_url = function() {
        return window.trConfig && window.trConfig.cdn ? trConfig.cdn : (e.cdn_url || (e.cdn_url = location.host + "/", e.cdn_url.indexOf(".com") >= 0 && (e.cdn_url.indexOf("www.") >= 0 ? e.cdn_url = e.cdn_url.replace("www.", "cdn.") : e.cdn_url = "cdn-" + e.cdn_url), e.cdn_url = "//" + e.cdn_url), e.cdn_url)
    }, e.get_cdn_version = function() {
        if (window.trVersion)
            return window.trVersion;
        if ("undefined" == typeof e.cdn_version)
            for (var t = document.getElementsByTagName("script"), n = 0; n < t.length; n++)
                if (/script\.v[0-9]+\.(min|orig)\.js/.test(t[n].src)) {
                    var i = t[n].src.split("/");
                    if (i.length > 0) {
                        var o = i[i.length - 1],
                            i = o.split(".");
                        i[1] && (e.cdn_version = i[1].substr(1))
                    }
                }
        return e.cdn_version
    }, e.init_lazyload = function() {
        setTimeout(function() {
            $("img.lazy, .img.lazy").unveil()
        }, 10)
    }, e.init_bg_all = function() {
        var e = $(".bg-all img");
        "objectFit" in document.documentElement.style == !1 && e.length > 0 && e.each(function(e) {
            var t = $(this).attr("src"),
                n = $(this).data("src"),
                i = $(this).parent();
            i.toggleClass("lazy", !!$(this).hasClass("lazy")).css("background-image", 'url("' + t + '")').data("src", n), $(this).remove()
        })
    }, e.load_css = function(t, n) {
        var i = document.createElement("link");
        i.type = "text/css", i.rel = "stylesheet", i.href = t.indexOf("pw") < 0 ? t : t.replace(".css", ".v" + e.get_cdn_version() + ".css"), i.onload = function() {
            n && n()
        }, $("html").append(i)
    }, e.load_js = function(t, n, i) {
        var o = document.createElement("script");
        o.async = "async", o.src = i || t.indexOf("pw") < 0 ? t : t.replace(".min.js", ".v" + e.get_cdn_version() + ".min.js"), document.body.appendChild(o), o.onload = function() {
            n && n()
        }
    }, e.show_request_error = function(e, t) {
        console.log("------------------------------"), console.log("ERROR: " + e), console.log("STATUS: " + t.status), 200 == t.status && console.log("MESSAGE: " + t.responseText)
    }, e.send_request = function(t, n, i, o, a) {
        if ("undefined" == typeof o)
            var o = {};
        console.log("SEND " + (o.type ? o.type : "POST") + ": " + t), $.ajax({
            url: t,
            data: n,
            dataType: o.dataType ? o.dataType : "json",
            type: o.type ? o.type : "POST",
            success: function(e) {
                i && i(e)
            },
            error: function(n) {
                e.show_request_error(t, n), a && a()
            }
        })
    }, e.send_google_event = function(e, t, n, i) {
        if ("undefined" != typeof ga) {
            var o = {
                hitType: "event",
                eventCategory: e,
                eventAction: t,
                eventLabel: n ? n : ""
            };
            if (i)
                for (var a in i)
                    o[a] = i[a];
            console.log("EVENT: " + [o.eventCategory, o.eventAction, o.eventLabel].join("; ") + ("nonInteraction" in o ? "; nonInteraction:" + o.nonInteraction : "")), location.href.indexOf("tourradar.com") >= 0 && ga("send", o)
        }
        "undefined" != typeof tracker && tracker("addEvent", e, t, n, i), location.href.indexOf("tourradar.com") < 0
    }, e.send_criteo_event = function(e, t) {
        if ($("body").data("criteo")) {
            var n = 38193;
            if ("undefined" != typeof e) {
                var i = [];
                window.criteo_q = window.criteo_q || [], "undefined" == typeof window.criteo_q.init && (window.criteo_q.init = !0, i.push({
                    event: "setAccount",
                    account: n
                }), i.push({
                    event: "setSiteType",
                    type: "d"
                }));
                var o = {
                    event: e
                };
                if ("undefined" != typeof t)
                    for (var a in t)
                        o[a] = t[a];
                i.push(o), console.log("CR:EVENT:" + JSON.stringify(i)), window.criteo_q.push(i)
            }
        }
    }, e.send_facebook_event = function(e, t, n) {
        "undefined" != typeof e && ("undefined" == typeof n ? (fbq(e, t), console.log("FB:EVENT:" + e + ", " + t)) : ("undefined" != typeof n.value && (n.value = parseFloat(n.value).toFixed(2)), fbq(e, t, n), console.log("FB:EVENT:" + e + ", " + t + ", " + JSON.stringify(n))))
    }, e.send_adwords_event = function(e, t, n, i) {
        "function" != typeof goog_report_conversion && (goog_report_conversion = function(e) {
            goog_snippet_vars(), window.google_conversion_format = "3";
            var t = new Object;
            t.onload_callback = function() {
                "undefined" != typeof e && (window.location = e)
            };
            var n = window.google_trackConversion;
            "function" == typeof n && n(t)
        }), goog_snippet_vars = function() {
            var e = window;
            e.google_conversion_id = t, e.google_conversion_label = n, e.google_remarketing_only = !!i
        }, goog_report_conversion()
    }, e.lib = {
        use: {
            popup: {
                initiated: !1,
                version: "1-0-2",
                css: "include/js/magnific-popup/magnific-popup",
                js: "include/js/magnific-popup/magnific-popup"
            },
            slider: {
                initiated: !1,
                version: "8-1-1",
                css: "include/js/nouislider/nouislider",
                js: "include/js/nouislider/nouislider"
            },
            calendar: {
                initiated: !1,
                version: "1-4-2",
                css: "include/js/pikaday/scss/pikaday",
                js: "include/js/pikaday/pikaday"
            },
            selector: {
                initiated: !1,
                version: "2-0-1",
                css: "include/js/selectivity/selectivity-full",
                js: "include/js/selectivity/selectivity-full"
            },
            animation: {
                initiated: !1,
                version: "1-0-0",
                css: !1,
                js: "include/js/zepto-anim"
            },
            mobile: {
                initiated: !1,
                version: "1-0-2",
                css: !1,
                js: "include/js/zepto-mobile"
            },
            tooltip: {
                initiated: !1,
                version: "1-1-2",
                css: "include/js/ttip/ttip",
                js: "include/js/ttip/ttip"
            },
            dragdrop: {
                initiated: !1,
                version: "1-0-0",
                css: !1,
                js: "include/js/zepto.dragswap"
            },
            top_banner: {
                initiated: !1,
                version: "1-4-5",
                css: !1,
                js: "include/js/top_banner/top"
            },
            autocomplete: {
                initiated: !1,
                version: "1-0-3",
                css: "include/js/tiny-autocomplete/tiny-autocomplete",
                js: "include/js/tiny-autocomplete/tiny-autocomplete"
            }
        },
        init: function(t, n, i) {
            var o = window.trVersion || Math.random();
            e.lib.use[t].initiated ? (i && setTimeout(function() {
                i()
            }, 300), n && setTimeout(function() {
                n()
            }, 300)) : (e.lib.use[t].initiated = !0, e.lib.use[t].css ? e.load_css(e.get_cdn_url() + e.lib.use[t].css + ".v" + e.lib.use[t].version + ".min.css?v=" + o, function() {
                i && i()
            }) : "", e.load_js(e.get_cdn_url() + e.lib.use[t].js + ".v" + e.lib.use[t].version + ".min.js?v=" + o, function() {
                n && n()
            }, !0))
        }
    }, e.signup = {
        initiated: !1,
        version: "2015-12-29-005",
        show: function(t, n) {
            e.signup.initiated ? $(".signup_link").click() : (e.signup.initiated = !0, e.send_request("/pw_common/component/signup", {}, function(i) {
                $("main").append(i.component), e.load_js(e.get_cdn_url() + "include/pw/_common/signup.min.js?v=" + e.signup.version, function() {
                    e.lib.init("popup", function() {
                        $(".signup_link").magnificPopup({
                            closeOnBgClick: !0
                        }), $(".email_add_popup_link").magnificPopup({
                            closeOnBgClick: !1,
                            closeOnContentClick: !1,
                            showCloseBtn: !1,
                            enableEscapeKey: !1
                        }), $(".signup_link").click(), _signup = new Signup, _signup.initiate(t, n)
                    })
                })
            }))
        }
    }, e.check_new_popup = function() {
        e.byUserInteraction("check-popup", function() {
            if ("undefined" == typeof e.checkPopup && (e.checkPopup = !0, 0 == $(".mfp-container").length)) {
                var t = "europe-winter-tours";
                e.byUserInteraction(t, function() {
                    var n = parseInt(e.func.get_cookie(t));
                    if (validUntil = new Date(2017, 0, 1), !n && $("li.exp").length > 0 && new Date <= validUntil)
                        return e.check_new_popup_contest(t, validUntil), !1;
                    for (var i = ["wanderlust-april-2017", "new-visitor-2016", "tr-expo-2017-app"], o = 0; o < i.length; o++) {
                        var a = i[o],
                            n = parseInt(e.func.get_cookie(a)),
                            r = parseInt(e.func.get_cookie("top-b-g")),
                            s = $("body").data("b-sale");
                        if ($("#row-banner." + a).length > 0 && !n && "home" != $("main").data("page") && e.func.set_cookie(a, n ? n + 1 : 1, 864e3, "/"), "wanderlust-april-2017" != a || n || e.func.set_cookie(a, 2, 864e3, "/"), "wanderlust-april-2017" == a && n > 1 && n < 3 && "home" != $("main").data("page") && 0 !== s && e.func.set_cookie(a, 3, 864e3, "/"), "wanderlust-april-2017" == a && 2 == n && !r && $("#row-banner." + a).length > 0 && "home" != $("main").data("page") && 0 !== s || "new-visitor-2016" == a && !n && !r && $("#row-banner." + a).length > 0) {
                            var c = a;
                            $.ajax({
                                url: "/welcome/new_popup" + ($(window).width() < 600 ? "?mobile=1" : ""),
                                dataType: "json",
                                data: {
                                    banner: c
                                },
                                type: "POST",
                                success: function(t) {
                                    "OK" != t.status || $(".mfp-content #sem-banner-unlock").length || e.lib.init("popup", function() {
                                        $("body").append('<a href="#ex2016" id="ex2016_link" class="hid"></a><div id="ex2016">' + t.html + "</div>"), "new-visitor-2016" == c && (window.location.href.indexOf("/d/") != -1 && $("main").length && $("main").data("destination") && $("main").data("destination").length ? $(".ex2016 h3 span").append(" " + $("main").data("destination") + " tour").show() : $('[itemtype="http://schema.org/TravelAgency"]').length && $(".ex2016 h3 span").append(" " + $('h1[itemprop="name"]').text() + " tour").show()), $("#ex2016_link").magnificPopup({
                                            closeOnBgClick: !0,
                                            callbacks: {
                                                open: function() {
                                                    $(".mfp-wrap").removeAttr("tabindex"), $("#sem-banner-unlock input").focus(), e.send_google_event("Sale Popup", "Show", c, {
                                                        nonInteraction: !0
                                                    })
                                                },
                                                close: function() {
                                                    e.send_google_event("Sale Popup", "Close", c, {
                                                        nonInteraction: !0
                                                    })
                                                }
                                            }
                                        }), $("#ex2016_link").magnificPopup("open"), $(".ex2016 .but.action").live("click", function() {
                                            $.magnificPopup.close(), $("#row-banner .btext a.multi").click()
                                        })
                                    })
                                },
                                error: function() {
                                    e.common.error()
                                }
                            })
                        }
                    }
                })
            }
        })
    }, e.check_new_popup_contest = function(t, n) {
        var i = Math.ceil((n - new Date) / 1e3);
        e.func.set_cookie(t, 1, i, "/"), e.send_request("/welcome/new_popup" + ($(window).width() < 600 ? "?mobile=1" : ""), {
            banner: t
        }, function(t) {
            "OK" == t.status && e.lib.init("popup", function() {
                var n = "Europe Winter Tours Popup",
                    i = location.pathname + location.search;
                $("body").append('<a href="#cpopup" id="cpopup_link" class="hid"></a><div id="cpopup">' + t.html + "</div>"), $("#cpopup_link").magnificPopup({
                    closeOnBgClick: !0,
                    callbacks: {
                        open: function() {
                            $(".mfp-wrap").removeAttr("tabindex"), e.send_google_event(n, "Show", i)
                        },
                        close: function() {
                            e.send_google_event(n, "Close", i)
                        }
                    }
                }), $("#cpopup_link").magnificPopup("open"), $(".ex2016").on("click", ".show form a", function() {
                    $(".ex2016 .show form").submit()
                }), $(".ex2016").on("click", ".hide a", function() {
                    $("#cpopup_link").magnificPopup("close")
                }), $(".ex2016").on("submit", ".show form", function() {
                    var t = $(".ex2016").hasClass("wait");
                    if (!t) {
                        $(".ex2016").addClass("wait");
                        var n = $.trim($(".ex2016 .show form input").val());
                        if (!n || !e.func.check_string(n, "email"))
                            return $(".ex2016").removeClass("wait"), alert("Please enter valid email address."), !1;
                        e.send_request("/pw_serp/winter_tours_email", {
                            email: n
                        }, function(e) {
                            "OK" == e.status && $(".ex2016 .show, .ex2016 .hide").toggleClass("hid")
                        })
                    }
                    return !1
                })
            })
        })
    }, e.byUserInteraction = function(t, n) {
        "undefined" == typeof e.interactions && (e.interactions = {}), e.interactions[t] || (e.interactions[t] = {}, n && (e.interactions[t].callback = n))
    }, e.initUserInteraction = function() {
        "undefined" == typeof e.interactions && (e.interactions = {}), e.byWindowAction(["scroll", "click", "keydown", "keyup", "mousemove", "touchend"], function() {
            $.each(e.interactions, function(t, n) {
                "function" != typeof n.callback || e.interactions[t].initiated || (e.interactions[t].initiated = !0, n.callback())
            })
        })
    }, e.byWindowAction = function(t, n) {
        "undefined" == typeof e.windowActions && (e.windowActions = []), $.inArray("load", t) != -1 && n();
        var i = t.indexOf("load");
        i > -1 && t.splice(i, 1), e.windowActions.push({
            events: t,
            callback: n
        })
    }, e.initWindowAction = function() {
        "undefined" == typeof e.windowActions && (e.windowActions = []), $(window).on("scroll click keydown keyup mousemove touchend load resize lookup", function(t) {
            $.each(e.windowActions, function(e, n) {
                $.inArray(t.type, n.events) < 0 || n.callback()
            })
        })
    }, e.initParameters = function() {
        var t = document.getElementsByTagName("main")[0],
            n = t.getAttribute("data-parameters");
        t.removeAttribute("data-parameters"), n ? e.parameters = JSON.parse(n) || {} : e.parameters = {}
    }
}
function Header() {
    var e = this,
        t = common;
    e.menu = {
        initiated: !1,
        g_search: !1,
        s_open: !1,
        no_s_blur: !1,
        act_drop: null,
        next_drop: null,
        act_drop_to: null,
        initiate: function() {
            $("head").append('<link rel="shortcut icon" href="' + t.get_cdn_url() + 'favicon.ico">'), $('a[href="#"]').click(function(e) {
                e.preventDefault()
            }), $("header input").blur(function(n) {
                e.menu.no_s_blur || (e.menu.s_open = !1, $(".tagln-search").removeClass("mob-focus"), $("header .autocomplete-list").remove(), $(this).removeClass("focus").val(""), t.send_google_event("Header Search", "Close"))
            }), $("header .tagln-search").click(function(n) {
                var i = $("header input");
                e.menu.no_s_blur = !1, e.menu.s_open && ($(n.target).is("header .close span") || $(n.target).is("header .close")) ? (e.menu.s_open = !1, $(".tagln-search").removeClass("mob-focus"), $("header .autocomplete-list").remove(), i.removeClass("focus").val(""), t.send_google_event("Header Search", "Close")) : e.menu.s_open || (e.menu.s_open = !0, i.focus(), t.send_google_event("Header Search", "Open"))
            }), $(":root").on("mousedown", ".tagln-search", function() {
                e.menu.no_s_blur = !0
            }), $("header input").focus(function() {
                $(".tagln-search").addClass("mob-focus"), $(this).val() || $(this).data("serp", ""), $(this).addClass("focus")
            }), $("header li.dropdown").mouseenter(function() {
                e.menu.open_dropdown($(this))
            }), $("header li.dropdown").mouseleave(function() {
                var t = $(this);
                t.hasClass("hover") ? e.menu.act_drop_to = setTimeout(function() {
                    e.menu.act_drop = null, t.removeClass("hover"), e.menu.next_drop && e.menu.open_dropdown(e.menu.next_drop)
                }, 175) : e.menu.next_drop && e.menu.next_drop[0] == t[0] && (e.menu.next_drop = null)
            }), t.byUserInteraction("menu-load", function() {
                try {
                    if (!e.menu.initiated) {
                        if (window.localStorage) {
                            var n = localStorage.menu_exp;
                            if ("undefined" != typeof localStorage.menu_exp && n > Date.now()) {
                                e.menu.initiated = !0;
                                var i = localStorage.mobile_menu,
                                    o = {
                                        destinations: localStorage.destinations,
                                        styles: localStorage.styles
                                    };
                                t.send_request("/pw_common/component/cache_time", {}, function(t) {
                                    var a = 1e3 * t.component;
                                    a > n - 6048e5 ? e.menu.get_menu() : e.menu.load(o, i)
                                })
                            }
                        }
                        e.menu.initiated || (e.menu.initiated = !0, e.menu.get_menu())
                    }
                } catch (a) {}
            }), $("header .t-menu").click(function() {
                setTimeout(function() {
                    $("nav.header").addClass("open"), $(".darken").removeClass("hid"), $("body").addClass("lock")
                }, 25)
            }), $(".darken").click(function() {
                $(".darken").addClass("hid"), $("body").removeClass("lock"), $("nav.header, nav.header ul.open").removeClass("open"), $("nav.header .return").addClass("hid"), $("nav.header ul").removeAttr("style")
            }), $(".support .open-olark").click(function() {
                footer.olarkIntegration.startEnquiryDialog(), t.send_google_event("Header", "Click", "Live Chat")
            })
        },
        open_dropdown: function(n) {
            if (e.menu.act_drop) {
                if (e.menu.act_drop[0] != n[0])
                    return void (e.menu.next_drop = n);
                clearTimeout(e.menu.act_drop_to)
            } else
                e.menu.act_drop = n, e.menu.next_drop = null, n.addClass("hover");
            var i = n.data("type");
            if (i)
                var o = i;
            else if (n.hasClass("profile"))
                var o = "profile";
            else
                var o = "help";
            t.send_google_event("Header", "Open", o)
        },
        get_menu: function() {
            t.send_request("/pw_common/component/header_menu,header_mobile_menu", {}, function(t) {
                var n = t.components.header_menu,
                    i = t.components.header_mobile_menu;
                if (e.menu.load(n, i), $("li.dropdown.fill nav").removeClass("hid"), window.localStorage)
                    try {
                        var o = Date.now() + 6048e5;
                        localStorage.mobile_menu = i, localStorage.destinations = n.destinations, localStorage.styles = n.styles, localStorage.menu_exp = o
                    } catch (a) {}
            })
        },
        load: function(n, i) {
            $("nav.header .pr-end").after(i), $('header li[data-type="destinations"] nav').html(n.destinations), $('header li[data-type="styles"] nav').html(n.styles), $("li.dropdown.fill nav").removeClass("hid"), $("nav.header li").click(function() {
                $(this).children("ul").addClass("open"), $(this).children("div.return").removeClass("hid"), $(this).parent("ul").css("overflow", "visible")
            }), $("nav.header .return").click(function(e) {
                $(this).parent("li").parent("ul").removeAttr("style"), $(this).addClass("hid"), $(this).next("ul").removeClass("open"), e.stopPropagation()
            }), $("nav.header ul").scroll(function() {
                var e = $(this).scrollTop(),
                    t = Math.floor(e / 43);
                $(this).children("li").each(function(n) {
                    if (n < t)
                        $(this).css({
                            opacity: 0
                        });
                    else if (n == t) {
                        var i = (43 - e % 43) / 43;
                        $(this).css({
                            opacity: i
                        })
                    } else
                        $(this).css({
                            opacity: 1
                        })
                })
            }), $("header .return").mousedown(function() {
                var t = $(this).parents("nav");
                setTimeout(function() {
                    e.menu.swap(t.children("ul.all"), t.children("ul.top"), "t", null)
                }, 200)
            }), $("header ul li.dropdown.fill").mouseleave(function() {
                $(this).find("ul.all").addClass("hid"), $(this).find("ul.top").removeClass("hid")
            }), $("header .see-all a").click(function(n) {
                n.preventDefault();
                var i = $(this).parents("li[data-type]").data("type");
                $(this).parents("nav").find("ul.all > li:not(.return)").hide(), $(this).parents("nav").find('ul.all > li[data-type="' + i + '"]').show(), e.menu.swap($(this).parents("nav ul.top"), $(this).parents("nav").children("ul.all"), "b", $(this).parents(".top li").find("span").text()), t.send_google_event("Header", "Click", "See all " + i)
            })
        },
        swap: function(e, t, n, i) {
            t.hasClass("hid") && t.removeClass("hid");
            var o = "t" == n;
            o || t.css("opacity", "0");
            var a = Date.now() + 300,
                r = function() {
                    if (Date.now() < a) {
                        var n = (a - Date.now()) / 300,
                            i = o ? 100 * n : 100 * (1 - n);
                        t.css("top", "-" + i + "%"), e.css("top", "-" + i + "%")
                    }
                },
                s = Date.now() + 800,
                c = function() {
                    if (Date.now() < s) {
                        var n = (s - Date.now()) / 800;
                        o || t.css("opacity", 1 - n), o && e.css("opacity", n)
                    }
                };
            if (!o) {
                t.parents("nav").find(".all .return span").text(i);
                var l = Date.now() + 1500,
                    u = function() {
                        if (Date.now() < l) {
                            var e = (l - Date.now()) / 1500;
                            t.parents("nav").find(".all .arrow").css("opacity", 1 - e), t.parents("nav").find(".all .return span").css("opacity", e)
                        }
                    },
                    d = setInterval(u, 50);
                setTimeout(function() {
                    clearInterval(d);
                    var e = t.parents("nav").find(".return span");
                    t.parents("nav").find(".all .arrow").css("opacity", "1"), e.css("opacity", "0"), e.text("")
                }, 1500)
            }
            var f = setInterval(r, 25),
                p = setInterval(c, 40);
            setTimeout(function() {
                clearInterval(f), e.addClass("hid"), e.css("opacity", "1"), e.css("top", "0"), t.css("top", "0")
            }, 300), setTimeout(function() {
                clearInterval(p), t.css("opacity", "1")
            }, 800)
        }
    }, e.search = {
        initiated: !1,
        g_search: !1,
        clicked: !1,
        maxResults: 5,
        initiate: function() {
            $("header input").one("focus click keydown input", function() {
                e.search.initiated || (e.search.initiated = !0, t.lib.init("autocomplete", function() {
                    $("header input").tinyAutocomplete({
                        url: "https://3VPAXN8SSR-dsn.algolia.net/1/indexes/*/queries",
                        method: "post",
                        keyboardDelay: 0,
                        getRequestData: function(t) {
                            var n = $.param({
                                query: t,
                                hitsPerPage: e.search.maxResults
                            });
                            return JSON.stringify({
                                requests: [{
                                    indexName: "serp_production",
                                    params: n
                                }, {
                                    indexName: "operators_production",
                                    params: n
                                }, {
                                    indexName: "tours_production",
                                    params: n
                                }],
                                strategy: "stopIfEnoughMatches"
                            })
                        },
                        ajaxSettings: {
                            type: "post",
                            contentType: "application/json",
                            dataType: "json",
                            beforeSend: function(e) {
                                e.setRequestHeader("X-Algolia-API-Key", "8f24a176469396e8292e2de464476855"), e.setRequestHeader("X-Algolia-Application-Id", "3VPAXN8SSR")
                            }
                        },
                        wrapField: !1,
                        itemTemplate: '<li class="autocomplete-item" data-url="{{url}}" data-type="{{eventType}}">{{title}}<span>{{type}}</span></li>',
                        lastItemTemplate: '<li class="autocomplete-item" data-url="" data-type="">See all results for "{{title}}"</li>',
                        onSelect: function(n) {
                            var i = $(n).data("url"),
                                o = $(n).data("type");
                            if ($(n).hasClass("autocomplete-item"))
                                if (i = t.func.strip(i), o = t.func.strip(o), i) {
                                    var a = $(n).html().replace(/<span>(.*)<\/span>/g, "").replace("amp;", "");
                                    a = t.func.strip(a), t.send_google_event("Header Search", "Select " + t.func.ucfirst(o.toLowerCase()), a), window.location.href = "/" + i
                                } else
                                    e.search.search_in_google()
                        }
                    }).on("receivedata", function(e, t, n) {
                        for (var i = [], o = 0; o < n.results.length; o++)
                            for (var a = n.results[o].hits, r = 0; r < a.length; r++) {
                                var s = "MIX",
                                    c = "MIX";
                                a[r].type_name ? s = c = a[r].type_name : "operators_production" == n.results[o].index ? s = c = "Operator" : "tours_production" == n.results[o].index && (s = a[r].operator_name, c = "Tour"), i.push({
                                    title: a[r].name,
                                    url: a[r].url,
                                    type: s,
                                    eventType: c
                                })
                            }
                        t.json = i, t.selectedItem = 0
                    }).on("keydown", function(t) {
                        var n = t.keyCode ? t.keyCode : t.which,
                            i = $("header .autocomplete-list").last(),
                            o = i.find(".autocomplete-item.active").index();
                        13 == n ? i && "none" !== i.css("display") && i.find("li").length > 0 ? o == -1 && i.find(".autocomplete-item:first-child").click() : e.search.search_in_google() : 27 == n && $("header input").val("").removeClass("focus")
                    })
                }))
            })
        },
        search_in_google: function() {
            e.search.g_search ? e.search.g_query() : (e.search.g_search = !0, $("header").append('<div id="results"></div>'), window.__gcse = {
                parsetags: "explicit",
                callback: function() {
                    e.search.g_query()
                }
            }, function() {
                var e = "003707296529978746672:vbrxfelmaog",
                    t = document.createElement("script");
                t.type = "text/javascript", t.async = !0, t.src = ("https:" == document.location.protocol ? "https:" : "http:") + "//cse.google.com/cse.js?cx=" + e;
                var n = document.getElementsByTagName("script")[0];
                n.parentNode.insertBefore(t, n)
            }())
        },
        g_query: function() {
            if ("complete" != document.readyState)
                return google.setOnLoadCallback(e.search.g_query(), !0);
            google.search.cse.element.render({
                gname: "gsearch",
                div: "results",
                tag: "searchresults-only",
                attributes: {
                    linkTarget: ""
                }
            });
            var n = google.search.cse.element.getElement("gsearch"),
                i = $("header input").val();
            i += " tourradar", n.execute(i), t.send_google_event("Header Search", "Custom Search", i), document.activeElement.blur()
        }
    }, e.top_banner = {
        initiated: !1,
        initiate: function() {
            $(".t_b").length > 0 ? e.top_banner.show_banner() : location.href.indexOf("partner=") < 0 && setTimeout(function() {
                t.check_new_popup()
            }, 1e3)
        },
        show_banner: function() {
            e.top_banner.initiated || (e.top_banner.initiated = !0, t.send_request("/pw_common/component/top_banner", {}, function(e) {
                $("body").trigger("banner:init"), setTimeout(function() {
                    t.check_new_popup()
                }, 1e3), $(".t_b").addClass("done").html(e.component);
                var n = $("body").data("b");
                $("main .top .sch").length && ("wanderlust-april-2017" == n || "new-visitor-2016" == n ? $("main .top").append('<img height="' + ($("body").hasClass("tab") ? 33 : 100) + '" class="hb" src="' + t.get_cdn_url() + "im/r/banner/homepage/2x_" + n + ($("body").hasClass("tab") ? "mob" : "") + '.png">') : "you_reffered_not_logged" == n && $("#row-banner.for_referred").length > 0 ? ($("main .top").append('<div class="yrnl"><div><span>' + $("#row-banner").data("in") + '</span><br>sent you a 5% discount</div><span class="li">Redeem discount</span></div>'), $("#row-banner .inv_image").clone().prependTo("main .top .yrnl"), $("main .top .yrnl").click(function() {
                    location.href = $("#row-banner a").attr("href")
                })) : "black-friday-2016-app" == n && $("main .top").append('<a href="/black-friday"><img height="' + ($("body").hasClass("tab") ? 33 : 100) + '" class="hb" src="' + t.get_cdn_url() + "im/r/banner/homepage/2-2x_" + n + ($("body").hasClass("tab") ? "mob" : "") + '.png"></a>'))
            }))
        }
    }, e.newsletter_top_banner = {
        initiated: !1,
        max_window_width: 963,
        initiate: function() {
            e.newsletter_top_banner.all_checks() && e.newsletter_top_banner.show(), $(window).bind("resize", function() {
                e.newsletter_top_banner.all_checks() ? e.newsletter_top_banner.show() : e.newsletter_top_banner.check()
            })
        },
        all_checks: function() {
            return !$("body").data("r") && !$(".r2 ul li.tr").hasClass("logged") && !t.func.get_cookie("tnbcls") && 0 == $("#row-banner").length && !$("body").hasClass("tab") && $(window).width() >= e.newsletter_top_banner.max_window_width
        },
        show: function() {
            e.newsletter_top_banner.initiated ? e.newsletter_top_banner.check() : (e.newsletter_top_banner.initiated = !0, t.send_request("/welcome/newsletter_signups", {}, function(n) {
                if ("OK" == n.status) {
                    $("body").prepend(n.html);
                    var i = "#tnb .tnb1 .in",
                        o = $(i + " input").attr("placeholder");
                    $(i + " div").click(function() {
                        var e = $.trim($(i + " input").val());
                        return e && t.func.check_string(e, "email") ? void t.send_request("/welcome/newsletter_check", {
                            email: e
                        }, function(e) {
                            "OK" == e.status && ($(i).html("<b>Thanks! You will receive an email soon</b>"), t.func.set_cookie("tnbcls", "1", 31536e3, "/"))
                        }) : ($(i + " input").addClass("red").attr("placeholder", "Please, enter a valid email").val("").focus(function() {
                            $(this).removeClass("red").attr("placeholder", o).val(e)
                        }), !1)
                    }), $(i + " input").live("keyup", function(e) {
                        var t = e.keyCode ? e.keyCode : e.which;
                        13 == t && $(i + " div").click()
                    }), $("#tnb .tnb1 .cls").click(function() {
                        $("#tnb").remove(), t.func.set_cookie("tnbcls", "1", 31536e3, "/"), e.newsletter_top_banner.check()
                    }), e.newsletter_top_banner.check()
                }
            }))
        },
        check: function() {
            e.newsletter_top_banner.initiated && ($(".b.val.fixed").length > 0 ? $(".b.val.fixed").addClass("wtop") : $(".b.val.fixed").removeClass("wtop"), $(".b.menu ul.fixed").length > 0 ? $(".b.menu ul.fixed").addClass("wtop") : $(".b.menu ul.fixed").removeClass("wtop"), $("#tnb").length || $(".b.val.fixed, .b.menu ul.fixed").removeClass("wtop"))
        }
    }
}
function Footer() {
    var e = this,
        t = common;
    e.links = {
        initiate: function() {
            $("footer .rlk h4").click(function() {
                var e = $(this).parent("div");
                e.hasClass("open") ? (e.removeClass("open"), $(this).find(".arrow").addClass("bottom")) : ($("footer .rlk div").removeClass("open"), $("footer .rlk div .arrow").addClass("bottom"), e.find(".arrow").removeClass("bottom"), e.addClass("open"))
            })
        }
    }, e.subscribe = {
        initiate: function() {
            $("footer form").submit(function() {
                var n = $.trim($(this).children("input").val());
                return n && t.func.check_string(n, "email") ? (t.send_google_event("Newsletter - Signup", "SignedUp"), t.send_request("/welcome/newsletter_check", {
                    email: n
                }, function(t) {
                    "OK" == t.status && e.subscribe.success()
                }), !1) : (alert("Please enter valid email address."), !1)
            }), $("footer form a").click(function() {
                return $("footer form").submit(), !1
            })
        },
        success: function() {
            $("footer form").find("input, a, p").toggleClass("hid"), $("footer form .title").addClass("submit")
        }
    }, e.social = {
        initiated: !1,
        initiate: function() {
            $("footer .soc").length > 0 && t.byWindowAction(["scroll"], function() {
                $(window).scrollTop() + $(window).height() >= $("footer .soc").offset().top && (e.social.initiated || (e.social.initiated = !0, t.send_request("/pw_common/component/footer_social,footer_facebook", {}, function(t) {
                    e.social.show_links(t.components.footer_social), e.social.show_facebook(t.components.footer_facebook)
                })))
            })
        },
        show_links: function(e) {
            $("footer .soc").prepend(e)
        },
        show_facebook: function(e) {
            $("footer .fb").prepend(e)
        }
    }, e.olarkIntegration = {
        askSubmit: function(n, i) {
            var o = 0 | $.trim(n.find('input[name="tour_id"]').val()),
                a = 0 | $.trim(n.data("price")),
                r = $.trim(n.find("textarea").val()) || "",
                s = n.find('input[name="email"]').length > 0 ? $.trim(n.find('input[name="email"]').val()) : null,
                c = n.find('input[name="phone"]'),
                l = n.find('input[name="name"]').val(),
                u = 0 | n.find('input[name="live_chat"]').val(),
                d = $.trim(c.val()),
                f = n.find('select[name="currency"]'),
                p = n.find('select[name="source"]'),
                h = n.find('select[name="date"]'),
                m = n.find('input[name="stateroom"]'),
                v = n.find('input[name="stateroom"]:checked'),
                g = n.find('select[name="transport"]'),
                y = "EUR" | n.data("currency"),
                _ = !1,
                w = n.parents("#ask_popup").hasClass("river-cruise");
            if (r || w ? !l && w ? _ = "Please enter your Full Name." : !(n.find('input[name="email"]').length > 0) || s && t.func.check_string(s, "email") ? d.length < 5 && w ? _ = "Please enter your phone." : h.length > 0 && 10 != h.val().length && w ? _ = "Please Select Date." : m.length > 0 && 0 == v.length && w && (_ = "Please Select Stateroom.") : _ = "Please enter valid email address." : _ = "Please enter your question.", g.length > 0 && !g.hasClass("hid") && (r = r + "\n\nI would like an offer for this room: " + g.val()), m.length > 0 && v.length > 0 && (r = (r ? r + "\n\n" : "") + "Stateroom: " + v.val()), _)
                return void alert(_);
            "undefined" != typeof tracker && tracker("addEvent", "tracker", "email", s, {});
            var b = {
                type: "t",
                id: o,
                enquiry_source: "",
                email: s,
                details_phone: d,
                first_name: l,
                source: "tr",
                source_id: 0,
                pax: 1,
                name: l,
                details_type: 4,
                comment: r,
                note: i.note || "",
                date: i.date || null
            };
            if (f.length > 0 && (b.currency = f.val(), h.length > 0 && 10 == h.val().length && (b.date = h.val()), "0" != p.val() && (b.create_source = p.val())), e.olark.isAvailable() && u && !i.forceEnqiry) {
                window.olark && olark("api.box.expand");
                var k = $("#olark-wrapper");
                return k.find("#olark-form-input-fname").val(l).trigger("input"), k.find("#olark-form-input-email").val(s).trigger("input"), d && k.find("#olark-form-input-phone").val(d).trigger("input"), k.find(".olark-form-send-button").click(), k.find(".olark-feedback-cancel-button").click(), setTimeout(function() {
                    k.find(".olark-chat-input").val(r), k.find(".olark-chat-send-button").click()
                }, 1e3), $.magnificPopup.close(), void t.send_google_event("Ask A Question", "Question Asked - Live Chat", i.name)
            }
            w && (b.booktype = "river", b.date || (b.date = h.val())), t.send_request(n.attr("action"), b, function(e) {
                if ("OK" != e.status)
                    return !1;
                t.send_google_event("Ask A Question", "Question Asked" + (i.note ? " - General" : ""), i.name);
                var n = {
                    id: o,
                    price: a,
                    quantity: 1
                };
                t.send_criteo_event("viewBasket", {
                    item: [n]
                }), a && parseInt(o) && y && t.send_facebook_event("track", "CompleteRegistration", {
                    value: a,
                    currency: y
                }), $("#ask_popup_success .but.blue").attr("href", e.href), $.magnificPopup.close();
                var r = $(".ask_link_success");
                r.magnificPopup({
                    closeOnBgClick: !0,
                    closeMarkup: '<div title="Close (Esc)" class="close mfp-close"></div>',
                    callbacks: {
                        close: function() {
                            $(".ask_link_success, #ask_popup_success").remove()
                        }
                    }
                }), r.magnificPopup("open"), $("#ask_popup_success .but:not(.blue)").click(function() {
                    r.magnificPopup("close")
                });
                var s = $("#ask_popup_success .oh-blk");
                if (s.length > 0) {
                    var c = new OpeningHours(t);
                    c.initiate(s), c.initiateTracking("", i.name)
                }
                "function" == typeof onEnquiryCreatedGlobal && onEnquiryCreatedGlobal()
            })
        },
        defaultTour: {
            id: -1,
            name: location.href,
            note: "User comes from " + location.href
        },
        startEnquiryDialog: function(n) {
            var i = this;
            return n || (n = this.defaultTour), this._initialized ? void $(".ask_link").magnificPopup("open") : (data = {
                id: n.id
            }, n.type && (data.type = n.type), void t.send_request("/pw_tour/ask_question_popup", data, function(o) {
                $("body").append(o.component), window.olark && olark("api.box.shrink"), $("#ask_popup form").submit(function(e) {
                    e.preventDefault(), i.askSubmit($(this), n)
                }), window.tracker && tracker("appendParameters", o.parameters || []);
                var a = $("#ask_popup .expect"),
                    r = $("#ask_popup .but.blue");
                a.data("expect", a.text()), t.lib.init("popup", function() {
                    var t = $(".ask_link"),
                        i = null;
                    t.magnificPopup({
                        closeOnBgClick: !0,
                        closeMarkup: '<div title="Close (Esc)" class="close mfp-close"></div>',
                        mainClass: "ask-popup",
                        fixedContentPos: !0,
                        callbacks: {
                            open: function() {
                                n.forceEnqiry || (i = setInterval(function() {
                                    var t = 0 | $('input[name="live_chat"]').val();
                                    t && e.olark.isAvailable() ? a.text("Immediate response") : a.text(a.data("expect")), "Submit" != r.text() && "Submit Question" != r.text() && r.text("Submit Question")
                                }, 500))
                            },
                            close: function() {
                                clearInterval(i), $(".ask_link, #ask_popup").remove()
                            }
                        }
                    }), t.magnificPopup("open")
                })
            }))
        }
    }, e.olark = {
        visitorInfo: new Array,
        initiate: function() {
            this.shouldBeEnabled() && (label = "Need help?", $("footer").append('<a class="olark hid olark-tr-placeholder" data-reactid=".0.2"><svg x="0px" y="0px" viewBox="0 0 27 21.9" data-reactid=".0.2.0"><path fill="#ffffff" d="M23.2,0L2.6,1.7C1,1.9,0,3.2,0,4.9v8c0,1.6,0.8,3,2.4,3.1l5.3,0.5c0,0,1,1.6,0.3,3.2C7.2,21.3,6,21.9,6,21.9 c4.2,0,6.6-3.1,7.8-4.9l9.4,0.7c1.8,0.2,3.8-1.3,3.8-3.1V3.1C27,1.3,25-0.1,23.2,0z M6.4,10.1c-0.9,0-1.7-0.7-1.7-1.7 c0-0.9,0.7-1.7,1.7-1.7C7.3,6.8,8,7.5,8,8.5C8,9.4,7.3,10.1,6.4,10.1z M13.2,10.1c-0.9,0-1.7-0.7-1.7-1.7c0-0.9,0.7-1.7,1.7-1.7 c0.9,0,1.7,0.7,1.7,1.7C14.8,9.4,14.1,10.1,13.2,10.1z M19.9,10.1c-0.9,0-1.7-0.7-1.7-1.7c0-0.9,0.7-1.7,1.7-1.7 c0.9,0,1.7,0.7,1.7,1.7C21.6,9.4,20.9,10.1,19.9,10.1z" data-reactid=".0.2.0.0"></path></svg><p class="olark-button-text" data-reactid=".0.2.2">' + label + "</p></a>"))
        },
        show: function() {
            t.func.get_cookie("olark_active") ? ($("footer .olark").remove(), e.olark.load()) : $("footer .olark").removeClass("hid").click(function() {
                $(this).html("Please wait…"), e.olark.expand()
            })
        },
        shouldBeEnabled: function() {
            return !(!location.pathname || "/t/" != location.pathname.substr(0, 3)) || (!(!location.pathname || "/book-now" != location.pathname.substr(0, 9)) || !(!window.localStorage || null === localStorage.getItem("olark.isAvailable")))
        },
        _isAvailable: !1,
        isAvailable: function() {
            return "undefined" != typeof forceOlarkStatus ? !!forceOlarkStatus : this._isAvailable
        },
        isExpand: !1,
        isLoaded: !1,
        isReady: !1,
        load: function() {
            if (this.shouldBeEnabled()) {
                var t = this;
                window.localStorage && null !== localStorage.getItem("olark.isAvailable") && (this._isAvailable = !!localStorage.getItem("olark.isAvailable")), window.olark || function(e, t, n, i, o, a) {
                    e.olark || (i = "script", a = t.createElement(i), i = t.getElementsByTagName(i)[0], a.async = 1, a.src = "//" + n, i.parentNode.insertBefore(a, i), a = e.olark = function() {
                        o.s.push(arguments), o.t.push(+new Date)
                    }, a.extend = function(e, t) {
                        a("extend", e, t)
                    }, a.identify = function(e) {
                        a("identify", o.i = e)
                    }, a.configure = function(e, t) {
                        a("configure", e, t), o.c[e] = t
                    }, o = a._ = {
                        s: [],
                        t: [+new Date],
                        c: {},
                        l: n
                    })
                }(window, document, "static.olark.com/jsclient/loader.js"), olark.identify("7577-172-10-6850"), olark("api.chat.onBeginConversation", function() {
                    var e = new Image(1, 1),
                        t = "https://www.googleadservices.com/pagead/conversion";
                    e.src = t + "/979964262/?bam=2&label=fe6YCKynmloQ5qKk0wM&script=0"
                });
                var n = setInterval(function() {
                    "function" == typeof olark && (clearInterval(n), olark("api.chat.onReady", function() {
                        t.isReady = !0, $("footer .olark").remove(), $(document).trigger("olark:loaded", [!0])
                    }), olark("api.chat.onOperatorsAvailable", function() {
                        window.localStorage && localStorage.setItem("olark.isAvailable", !0), t._isAvailable = !0
                    }), olark("api.chat.onOperatorsAway", function() {
                        window.localStorage && localStorage.setItem("olark.isAvailable", !1), t._isAvailable = !1
                    }), olark("api.box.onExpand", function() {
                        t.isExpand = !0, t.isAvailable() || (setTimeout(function() {
                            window.olark && olark("api.box.shrink")
                        }, 1), e.olarkIntegration.startEnquiryDialog())
                    }), olark("api.chat.onMessageToOperator", function(e) {
                        var t = !1;
                        olark("api.visitor.getDetails", function(e) {
                            e.pageCountForThisVisit >= 3 || t || "undefined" != typeof tracker && (t = !0, tracker("addEvent", "tracker", "email", e.emailAddress, {}))
                        })
                    }), olark("api.box.onShrink", function() {
                        t.isExpand = !1
                    }), olark("api.chat.onBeginConversation", function() {
                        olark("api.visitor.getDetails", function(t) {
                            var n = $.trim(t.emailAddress),
                                i = $.trim(t.fullName);
                            n && $.ajax({
                                url: "/travellers/olark_traveller_information",
                                data: {
                                    email: t.emailAddress,
                                    tour_id: e.olarkIntegration.defaultTour.id,
                                    visitor_name: i,
                                    phone: t.phoneNumber
                                },
                                dataType: "json",
                                type: "POST",
                                success: function(t) {
                                    if ("OK" == t.status) {
                                        window.tracker && tracker("appendParameters", t.parameters || []);
                                        var n = (Array(), Array()),
                                            i = t.information;
                                        if (i.traveller && "id" in i.traveller ? e.olark.visitorInfo.push("Travel Credits: " + i.traveller.referral_balance) : e.olark.visitorInfo.push("Travel Credits: Not a customer yet"), i.traveller && "location" in i.traveller && e.olark.visitorInfo.push("Customer Location: " + i.traveller.location), i.traveller && "medical_conditions" in i.traveller && e.olark.visitorInfo.push("Medical Condition: " + i.traveller.medical_conditions), i.traveller && "age" in i.traveller && e.olark.visitorInfo.push("Age: " + i.traveller.age), i.enquiries && (e.olark.visitorInfo.push("# of Enquiries : " + i.enquiries.length), i.enquiries.length)) {
                                            var o = ["", "Availability request", "Brochure request", "Ready to book", "Have a question", "Hold 48 hours"];
                                            n[n.length] = "CUSTOMER HAS FOLLOWING ENQUIRIES / BOOKINGS:", $.each(i.enquiries, function(e, t) {
                                                if (e < 10) {
                                                    if ("approval" == t.payment_provider_status)
                                                        var i = "Waiting for user approval";
                                                    else if (3 == parseInt(t.status) || "confirmed" == t.payment_provider_status)
                                                        var i = "Confirmed booking";
                                                    else if ("declined_by_operator" == t.payment_provider_status || 6 == parseInt(t.status) || 4 == parseInt(t.status) || "payment_failed" == t.payment_provider_status || "declined_by_system" == t.payment_provider_status || "failed" == t.payment_provider_full_payment_status)
                                                        var i = "Declined";
                                                    else
                                                        var i = "Initial enquiry";
                                                    n[n.length] = t.id + " - " + t.added_formated + " - " + o[parseInt(t.type)] + " - " + i + " - " + t.pax + " pax - " + t.full_price + t.per_person_currency + " - " + t.tour_name + " - https://www.tourradar.com/admin/enquiries/go/" + t.id
                                                }
                                            })
                                        }
                                        if (i.pdf && (e.olark.visitorInfo.push("# of Downloaded PDF : " + i.pdf.length), i.pdf.length && (n[n.length] = "CUSTOMER HAS THE FOLLOWING PDF DOWNLOADS:", $.each(i.pdf, function(e, t) {
                                            e < 10 && (n[n.length] = t.time_create + " - " + t.name + " - //www.tourradar.com/t/" + t.tour_id)
                                        }))), i.traveller && "inviter" in i.traveller && (n[n.length] = "CUSTOMER DETAILS:", n[n.length] = "Invited by : " + i.traveller.inviter.name + " - //www.tourradar.com/admin/travellers/edit/" + i.traveller.inviter.id), olark("api.chat.updateVisitorStatus", {
                                            snippet: e.olark.visitorInfo
                                        }), n.length) {
                                            var a = 0;
                                            $.each(n, function(e, t) {
                                                setTimeout(function() {
                                                    olark("api.chat.sendNotificationToOperator", {
                                                        body: t
                                                    })
                                                }, a), a += 120
                                            })
                                        }
                                    }
                                }
                            })
                        })
                    }))
                }, 10)
            }
        },
        open: function() {
            $("footer .olark").length ? $("footer .olark").click() : (olark("api.box.expand"), t.func.set_cookie("olark_active", "1", 86400, "/"))
        },
        expand: function() {
            e.olark.load(), olark("api.box.expand"), t.func.set_cookie("olark_active", "1", 86400, "/"), t.send_google_event("Olark_Chat", "Olark Widget Open", location.href)
        }
    }, e.elems = function() {
        e.func = new Func, t.byWindowAction(["scroll", "load"], function() {
            e.func.is_element_on_screen(".asta") && ($("body").hasClass("mob") ? $(".asta div").addClass("a") : $(".asta").addClass("a"))
        })
    }
}
function Timer(e, t, n) {
    var i = this;
    n = n || 1, i.initiate = function() {
        e.length > 0 && (i.timer = null, i.endMoment = i.getCurrentTimestamp() + t, document.addEventListener("visibilitychange", function() {
            "visible" == document.visibilityState ? i.restart() : i.stop()
        }, !1), i.start())
    }, i.getCurrentTimestamp = function() {
        return Math.round(new Date / 1e3)
    }, i.restart = function() {
        i.stop(), i.start()
    }, i.start = function() {
        i.timer = setInterval(function() {
            var t = i.endMoment - i.getCurrentTimestamp();
            if (t > 0) {
                var n = Math.floor(t / 3600),
                    o = Math.floor((t - 3600 * n) / 60),
                    a = parseInt(t - 3600 * n - 60 * o);
                e.text(i.format(n, o, a))
            } else
                e.hide()
        }, 1e3 * n)
    }, i.stop = function() {
        clearInterval(i.timer)
    }, i.format = function(e, t, n) {
        return [e >= 10 ? e : "0" + e, t >= 10 ? t : "0" + t, n >= 10 ? n : "0" + n].join(":")
    }
}
function Homepage() {
    var e = this,
        t = common,
        n = new MainSearch,
        i = footer,
        o = new UnlockSavingPopup(t),
        a = new TermsSalePopup(t);
    e.initiate = function() {
        t.load_css(t.get_cdn_url() + "include/pw/homepage/async.css"), e.dynamic.initiate(), e.hiring.initiate(), e.wishlist.initiate(), n.init($(".top .sch")), i.olark.show(), $(".sale-line").length > 0 && new Timer($(".sale-line .ends span"), $(".sale-line .ends").data("ends")).initiate(), t.send_criteo_event("viewHome")
    }, e.dynamic = {
        initiate: function() {
            $("main .top").height() < $(window).height() && $("main .top").height($(window).height()), $("main .top .sch .wlnk").click(function() {
                var e = $(this).data("video");
                t.lib.init("popup", function() {
                    $.magnificPopup.open({
                        items: {
                            src: "http://www.youtube.com/watch?v=" + e
                        },
                        type: "iframe",
                        iframe: {
                            markup: '<div class="mfp-iframe-scaler"><div class="mfp-close"></div><iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe></div>',
                            patterns: {
                                youtube: {
                                    index: "youtube.com/",
                                    id: "v=",
                                    src: "//www.youtube.com/embed/%id%?autoplay=1&showinfo=0&rel=0"
                                }
                            },
                            srcAction: "iframe_src"
                        },
                        callbacks: {
                            open: function() {
                                t.send_google_event("How it works Video", "Show popup Home", "Open")
                            },
                            close: function() {
                                t.send_google_event("How it works Video", "Show popup Home", "Close")
                            }
                        }
                    })
                })
            }), setTimeout(function() {
                e.dynamic.top_tag_hide($(".tag").find(".is-f").eq(0))
            }, 4e3), $("body").hasClass("tab") ? (e.dynamic.wishlists_bg(), $(".fv").scrollLeft($(".fv .grid").width() / 2 - $(window).width() / 2)) : e.dynamic.slider.initiate(), $("body").hasClass("mob") && (e.dynamic.triangle_fly(), t.byWindowAction(["scroll"], function() {
                e.dynamic.triangle_fly()
            })), e.dynamic.deals.initiate(), e.dynamic.agents(), e.dynamic.next_scroll(), o.load(function() {
                window.location.href = "/deals"
            }), a.load(), $(".sale-line.unlocked").click(function() {
                window.location.href = "/deals"
            })
        },
        triangle_fly: function() {
            t.func.is_element_on_screen($(".dl")) && $(window).scrollTop() < $(".dl .con .text").last().offset().top + $(".dl .con .text").last().height() - 10 && $(window).scrollTop() > $(".dl").offset().top ? $(".dl .pc").css("position", "fixed") : $(".dl .pc").css("position", "absolute")
        },
        wishlists_bg: function() {
            $(".wl ul a li").each(function() {
                $(this).css("background-image", "url(" + $(this).find("img.lazy").first().data("src") + ")"), $(this).find("img.lazy").remove()
            })
        },
        top_tag_hide: function(t) {
            var n = t.is(":last-child") ? t.parent().children().eq(0) : t.next();
            e.dynamic.top_tag_switch(t, n), setTimeout(function() {
                e.dynamic.top_tag_hide(n)
            }, 2e3)
        },
        top_tag_switch: function(e, t) {
            e.removeClass("is-v").removeClass("is-f").addClass("is-h"), t.removeClass("is-h").addClass("is-v")
        },
        slider: {
            margin_left: 0,
            IntSlide: !1,
            initiate: function() {
                t.func.is_element_on_screen($(".fv .grid"), 0) && e.dynamic.slider.carousel(), t.byWindowAction(["scroll"], function() {
                    t.func.is_element_on_screen($(".fv .grid"), 0) ? e.dynamic.slider.IntSlide || e.dynamic.slider.carousel() : e.dynamic.slider.IntSlide && (clearInterval(e.dynamic.slider.IntSlide), e.dynamic.slider.IntSlide = !1)
                }), $(".grid").mouseenter(function() {
                    clearInterval(e.dynamic.slider.IntSlide), e.dynamic.slider.IntSlide = !1, $(".grid").mousemove(function(t) {
                        var n = t.pageX - $(".fv").offset().left;
                        n <= .15 * $(".fv").width() ? (clearInterval(e.dynamic.slider.IntSlide), e.dynamic.slider.IntSlide = !1, n <= .05 * $(".fv").width() ? e.dynamic.slider.carousel("right", 1) : e.dynamic.slider.carousel("right", 5)) : n >= .85 * $(".fv").width() ? (clearInterval(e.dynamic.slider.IntSlide), e.dynamic.slider.IntSlide = !1, n >= .95 * $(".fv").width() ? e.dynamic.slider.carousel("left", 1) : e.dynamic.slider.carousel("left", 5)) : (clearInterval(e.dynamic.slider.IntSlide), e.dynamic.slider.IntSlide = !1)
                    })
                }).mouseleave(function() {
                    clearInterval(e.dynamic.slider.IntSlide), e.dynamic.slider.IntSlide = !1, e.dynamic.slider.carousel()
                })
            },
            carousel: function(t, n) {
                e.dynamic.slider.IntSlide = setInterval(function() {
                    for (var i = 1 == n ? 2 : 1, o = 0; o < i; o++) {
                        if ("right" == t ? e.dynamic.slider.margin_left = e.dynamic.slider.margin_left + 1 : e.dynamic.slider.margin_left = e.dynamic.slider.margin_left - 1, "right" == t) {
                            if (0 == $(".grid").offset().left) {
                                var a = $(".grid .l:last-child"),
                                    r = a.width();
                                $(".grid").prepend('<div class="l">' + a.html() + "</div>"), $(".grid .l:first-child img.lazy").each(function() {
                                    $(this).attr("src", $(this).data("src")).removeClass("lazy")
                                }), a.remove(), e.dynamic.slider.margin_left = e.dynamic.slider.margin_left - r
                            }
                        } else if ($(".grid").width() + e.dynamic.slider.margin_left <= $(window).width()) {
                            var s = $(".grid .l:first-child"),
                                c = s.width();
                            $(".grid").append('<div class="l">' + s.html() + "</div>"), $(".grid .l:last-child img.lazy").each(function() {
                                $(this).attr("src", $(this).data("src")).removeClass("lazy")
                            }), s.remove(), e.dynamic.slider.margin_left = e.dynamic.slider.margin_left + c
                        }
                        $(".grid").css("margin-left", e.dynamic.slider.margin_left + "px")
                    }
                }, n ? n : 15)
            }
        },
        deals: {
            initiate: function() {
                var t = parseInt($(".dl .pc .p span span").text());
                $(".dl .con").mouseover(function() {
                    e.dynamic.deals.calc_deal(parseInt($(this).data("p")))
                }).mouseleave(function() {
                    e.dynamic.deals.calc_deal(t)
                })
            },
            calc_deal: function(t) {
                clearInterval(e.dynamic.deals.ChangeDeal), e.dynamic.deals.ChangeDeal = setInterval(function() {
                    var n = parseInt($(".dl .pc .p span span").text());
                    n == t ? clearInterval(e.dynamic.deals.ChangeDeal) : n < t ? $(".dl .pc .p span span").text(n + 1) : n > t && $(".dl .pc .p span span").text(n - 1)
                }, 10)
            }
        },
        agents: function() {
            $(".cs .t .wp").click(function() {
                if ($(this).hasClass("active"))
                    $(".cs .t .wp").removeClass("active").children("img").css("opacity", "").css("z-index", "");
                else {
                    $(".cs .t .wp").removeClass("active").children("img").css("opacity", "").css("z-index", ""), $(this).addClass("active");
                    var e = $(this).index(),
                        n = $(".cs .t .wp").length - (e + 1),
                        i = $(".cs .t .wp").length - n - 1;
                    if (i > 0)
                        for (var o = 0; o < e; o++) {
                            var a = 100 / i * (o + 1) / 100;
                            $($(".cs .t .wp")[o]).children("img").css("opacity", a > .9 ? .9 : a)
                        }
                    if (n > 0)
                        for (var r = 0, o = n + e; o > e; o--) {
                            var a = 100 / n * (r + 1) / 100;
                            $($(".cs .t .wp")[o]).children("img").css("opacity", a > .9 ? .9 : a).css("z-index", r), r++
                        }
                    t.send_google_event("Customer Support Faces", "Select agent", $(this).find("span").text())
                }
            })
        },
        next_scroll: function() {
            $(".top .nxt").click(function() {
                t.func.smooth_scroll($(window), $(".usps-section"), 300, function() {})
            })
        }
    }, e.hiring = {
        initiate: function() {
            $(".hire").click(function() {
                t.send_google_event("Header", "Click", "Hiring")
            })
        }
    }, e.wishlist = {
        initiated: !1,
        initiate: function() {
            $(".wl ul li").length > 0 && (t.func.is_element_on_screen($(".cf"), 0) && e.wishlist.load_owners(), t.byWindowAction(["scroll"], function() {
                t.func.is_element_on_screen($(".cf"), 0) && e.wishlist.load_owners()
            }))
        },
        load_owners: function() {
            if (!e.wishlist.initiated) {
                e.wishlist.initiated = !0;
                var n = [];
                $(".wl ul li").each(function() {
                    n.push($(this).attr("data-wishlist"))
                }), t.send_request("/pw_wishlist/get_owners", {
                    ids: n.join(",")
                }, function(e) {
                    if ("OK" == e.status)
                        for (var t in e.wishlists)
                            $('.wl ul li[data-wishlist="' + t + '"]').append(e.wishlists[t])
                })
            }
        }
    }
}
function MainSearch() {
    var e = this,
        t = common;
    e.init = function(t) {
        e.search.initiate(t)
    }, e.search = {
        initiated: !1,
        month_initiated: !1,
        month_preselected: !1,
        check_destination: !1,
        firstResultUrl: !1,
        firstResultText: !1,
        maxResults: 5,
        form: null,
        initiate: function(n) {
            e.search.form = n, e.search.form.find("input").val(""), !$("body").hasClass("tab") && t.func.is_element_on_screen(e.search.form.find("input.a")) && e.search.form.find("input.a").focus(), e.search.form.find("input.a").one("focus click keydown input", function() {
                e.search.initiated || (e.search.initiated = !0, t.lib.init("autocomplete", function() {
                    e.search.form.find("input.a").tinyAutocomplete({
                        url: "https://3VPAXN8SSR-dsn.algolia.net/1/indexes/*/queries",
                        method: "post",
                        keyboardDelay: 0,
                        getRequestData: function(t) {
                            var n = $.param({
                                query: t,
                                hitsPerPage: e.search.maxResults
                            });
                            return JSON.stringify({
                                requests: [{
                                    indexName: "serp_production",
                                    params: n
                                }, {
                                    indexName: "operators_production",
                                    params: n
                                }, {
                                    indexName: "tours_production",
                                    params: n
                                }],
                                strategy: "stopIfEnoughMatches"
                            })
                        },
                        ajaxSettings: {
                            type: "post",
                            contentType: "application/json",
                            dataType: "json",
                            beforeSend: function(e) {
                                e.setRequestHeader("X-Algolia-API-Key", "8f24a176469396e8292e2de464476855"), e.setRequestHeader("X-Algolia-Application-Id", "3VPAXN8SSR")
                            }
                        },
                        showNoResults: !0,
                        itemTemplate: '<li class="autocomplete-item" data-url="{{url}}" data-type="{{eventType}}">{{title}}<span>{{type}}</span></li>',
                        noResultsTemplate: '<li class="autocomplete-item" data-url="0" data-type="">Search for \'{{title}}\'</li>',
                        onSelect: function(n) {
                            var i = $(n).data("url"),
                                o = $(n).data("type");
                            if (i = t.func.strip(i), o = t.func.strip(o), i && $(n).hasClass("autocomplete-item")) {
                                if (0 != i) {
                                    var a = $(n).html().replace(/<span>(.*)<\/span>/g, "").replace("amp;", "");
                                    a = t.func.strip(a), e.search.form.find("input.a").val(a).data("url", i), e.search.check_destination = e.search.form.find("input.a").val(), t.send_google_event("Main Search", "Select " + t.func.ucfirst(o.toLowerCase()), e.search.check_destination)
                                }
                                e.search.form.find(".b .months .active").length || e.search.form.find("div.b").click()
                            } else
                                e.search.form.find("input.a").val("").data("url", "")
                        }
                    }).on("beforerequest", function(t, n, i) {
                        e.search.form.find(".autocomplete .l").length || e.search.form.find(".autocomplete").append('<img class="l" src="/im/r/pw/tr-loader-small.gif">')
                    }).on("receivedata", function(t, n, i) {
                        e.search.firstResultUrl = !1, e.search.firstResultText = !1;
                        for (var o = [], a = 0; a < i.results.length; a++)
                            for (var r = i.results[a].hits, s = 0; s < r.length; s++) {
                                var c = "MIX",
                                    l = "MIX";
                                r[s].type_name ? c = l = r[s].type_name : "operators_production" == i.results[a].index ? c = l = "Operator" : "tours_production" == i.results[a].index && (c = r[s].operator_name, l = "Tour"), o.push({
                                    title: r[s].name,
                                    url: r[s].url,
                                    type: c,
                                    eventType: l
                                }), e.search.firstResultUrl || (e.search.firstResultUrl = r[s].url, e.search.firstResultText = r[s].name)
                            }
                        n.json = o, e.search.form.find(".autocomplete img.l").remove(), e.search.form.find(".autocomplete .pre").hide()
                    }).on("keydown keypress change focus input", function(t) {
                        0 == $(this).val().length && (e.search.form.find(".autocomplete .pre").show(), e.search.form.find("div.b .months").addClass("hid"))
                    }).on("keydown", function(t) {
                        var n = t.keyCode ? t.keyCode : t.which;
                        if (13 == n || 9 == n) {
                            e.search.form.find("div.b .months").addClass("hid");
                            var i = e.search.form.find(".autocomplete .autocomplete-list").last(),
                                o = i.find(".autocomplete-item.active").index();
                            13 == n && ("none" !== i.css("display") ? o == -1 && (t.stopPropagation(), i.find(".autocomplete-item:first-child").click(), e.search.form.find(".but").click()) : e.search.form.find(".but").click()), 9 == n && (t.preventDefault(), e.search.form.find("div.b").click())
                        }
                    }), $(document).mouseup(function(t) {
                        "none" == e.search.form.find(".autocomplete-list").css("display") || e.search.form.find(".autocomplete").find(t.target).length || e.search.form.find(".autocomplete .pre").hide()
                    }), e.search.form.find("input.a").focus(function() {
                        $(this).val() || ($(this).data("url", ""), e.search.form.find(".autocomplete .pre").show()), e.search.form.find("div.b .months").addClass("hid")
                    }), e.search.form.find("input.a").focus(), $("body").hasClass("mob") || t.send_request("/pw_homepage/load", {
                        action: "preload_search"
                    }, function(t) {
                        "OK" == t.status && (e.search.form.find(".autocomplete").append(t.component), e.search.form.find("div.b .months").addClass("hid"))
                    })
                }))
            }), e.search.form.find("div.b") && e.search.form.data("month") && setTimeout(function() {
                e.search.form.find("div.b").click()
            }, 100), e.search.form.find("div.b").click(function() {
                e.search.month_initiated ? e.search.showmonths() : (e.search.month_initiated = !0, t.send_request("/pw_homepage/load", {
                    action: "preload_search_months"
                }, function(n) {
                    if ("OK" == n.status) {
                        e.search.form.find("div.b").append('<div class="months hid"></div>');
                        for (var i = 0; i < n.component.length; i++)
                            if (e.search.form.find("div.b .months").append('<div data-month="' + n.component[i][0] + '">' + n.component[i][1] + "</div>"), !e.search.month_preselected && n.component[i][2]) {
                                e.search.month_preselected = !0;
                                var o = e.search.form.find('div.b .months div[data-month="' + n.component[i][0] + '"]');
                                o.addClass("active"), e.search.form.find("input.b").val(o.text())
                            }
                        e.search.form.find(".b .months div").click(function() {
                            $(this).hasClass("active") ? (e.search.form.find(".b .months div").removeClass("active"), e.search.form.find("input.b").val("")) : (e.search.form.find(".b .months div").removeClass("active"), $(this).addClass("active"), e.search.form.find("input.b").val($(this).text()), t.send_google_event("Main Search", "Select Month", $(this).text()))
                        }), $(document).mouseup(function(t) {
                            var n = e.search.form.find("div.b .months");
                            n.hasClass("hid") || n.find(t.target).length || e.search.form.find("div.b").click()
                        }), e.search.month_preselected || e.search.showmonths()
                    }
                }))
            }), e.search.form.find(".but").click(function() {
                if (e.search.form.find("div.b .months").addClass("hid"), "" == e.search.form.find("input.a").val().trim())
                    return e.search.form.find("input.a").focus().addClass("shake").data("url", ""), t.send_google_event("Main Search", "Search", "Error"), void setTimeout(function() {
                        e.search.form.find("input.a").removeClass("shake")
                    }, 1e3);
                var n = e.search.form.find("input.a").data("url");
                n && e.search.check_destination == e.search.form.find("input.a").val() || e.search.firstResultUrl && (n = e.search.firstResultUrl, e.search.check_destination = e.search.firstResultText, e.search.form.find("input.a").val(e.search.firstResultText));
                var i = Array();
                return e.search.form.find(".b .months .active").each(function() {
                    i.push($(this).attr("data-month"))
                }), i = i.join(":"), n && e.search.check_destination == e.search.form.find("input.a").val() ? (t.send_google_event("Main Search", "Search", "Success"), void (window.location.href = "/" + n + (i ? "#month=" + i : ""))) : (e.search.check_destination = !1, e.search.search_in_google(), !1)
            })
        },
        showmonths: function() {
            e.search.form.find("div.b .months").toggleClass("hid"), e.search.form.find("div.b .months.hid").length || e.search.form.find(".autocomplete .pre").hide()
        },
        search_in_google: function() {
            e.search.g_search ? e.search.g_query() : (e.search.g_search = !0, $("header").append('<div id="results"></div>'), window.__gcse = {
                parsetags: "explicit",
                callback: function() {
                    e.search.g_query()
                }
            }, function() {
                var e = "003707296529978746672:vbrxfelmaog",
                    t = document.createElement("script");
                t.type = "text/javascript", t.async = !0, t.src = ("https:" == document.location.protocol ? "https:" : "http:") + "//cse.google.com/cse.js?cx=" + e;
                var n = document.getElementsByTagName("script")[0];
                n.parentNode.insertBefore(t, n)
            }())
        },
        g_query: function() {
            if ("complete" != document.readyState)
                return google.setOnLoadCallback(e.search.g_query(), !0);
            google.search.cse.element.render({
                gname: "gsearch",
                div: "results",
                tag: "searchresults-only",
                attributes: {
                    linkTarget: ""
                }
            });
            var n = google.search.cse.element.getElement("gsearch"),
                i = e.search.form.find("input").val() + (e.search.form.find(".months .active").length ? " " + e.search.form.find(".months .active").data("month").replace("-", " ") : "");
            n.execute(i), t.send_google_event("Main Search", "Custom Search", i), document.activeElement.blur()
        }
    }
}
function UnlockSavingPopup(e) {
    var t,
        n,
        i = "fixed",
        o = this,
        a = {
            sale: null,
            memberSaving: null
        },
        r = $(window);
    o.load = function(e) {
        $("body").on("click", ".unlock", function() {
            $(this).hasClass("sale-line") && $(this).data("link") ? $("main").length > 0 && ($("main").hasClass("mob") || $("main").hasClass("tab")) || $(window).width() <= 1023 ? window.location.href = $(this).data("link") : window.open($(this).data("link"), "_blank") : $(this).hasClass("unlocked") || o.initPopup($(this), e)
        })
    }, o.initPopup = function(t, n) {
        var i = {
            id: t.data("id") ? parseInt(t.data("id")) : null,
            value: t.data("value")
        };
        i.value ? o.updateValue = i.value : o.updateValue = null;
        var r = i.id ? "sale" : "memberSaving";
        a[r] ? o.showPopup(a[r], i.id, n) : e.send_request("/pw_tour/load_unlock_layout/", i, function(e) {
            "OK" == e.status && (a[r] = e.html, o.showPopup(a[r], i.id, n))
        })
    }, o.initOnScroll = function(i) {
        i.length && (t = i, n = i.offset().top, e.byWindowAction(["scroll"], o.onScroll), o.onScroll())
    }, o.onScroll = function() {
        var e = r.scrollTop() > n,
            o = "";
        e && (o = t.height()), t.parent().css("height", o), t.toggleClass(i, e), e ? t.parent().height(t.height()) : t.parent().height("")
    }, o.showPopup = function(t, n, i) {
        var a = ".unlockSavingPopup";
        e.lib.init("popup", function() {
            $.magnificPopup.close(), $.magnificPopup.open({
                items: {
                    src: t
                },
                closeOnBgClick: !0,
                callbacks: {
                    open: function() {
                        var t = $(a);
                        t.off();
                        var r = t.find("form");
                        o.updateValue && t.find(".value").length && t.find(".value").html(o.updateValue), r.find("input").on("keydown", function(e) {
                            $(this).hasClass("error") && $(this).removeClass("error"), 13 === e.keyCode && r.submit()
                        }), r.on("submit", function(e) {
                            return e.preventDefault(), o.checkForm($(this), n, i), !1
                        }), r.find(".but").on("click", function(e) {
                            return e.preventDefault(), r.submit(), !1
                        }), t.find(".terms-link").on("click", function(e) {
                            return e.preventDefault(), o.showTerms(), !1
                        }), e.send_google_event("Sale", "Open Popup Form")
                    }
                }
            })
        })
    }, o.checkForm = function(t, n, i) {
        t.find("input").removeClass("error");
        var a = !1,
            r = $.trim(t.find('input[name="name"]').val()),
            s = $.trim(t.find('input[name="email"]').val());
        r || (a = !0, t.find('input[name="name"]').addClass("error")), s && e.func.check_string(s, "email") || (a = !0, t.find('input[name="email"]').addClass("error")), a || o.success(r, s, n, i)
    }, o.success = function(t, n, i, a) {
        e.send_request("/pw_tour/save_unlock/", {
            name: t,
            email: n,
            saleId: i
        }, function(n) {
            "OK" == n.status && (o.showSuccess(n.html.replace("-NAME-", t), a), e.send_google_event("Sale", i ? "Global or STR Sale Unlocked" : "Member's Saving Sale Unlocked"), e.send_adwords_event(location.href, 979964262, "_OR2CJ_xsnEQ5qKk0wM"), "undefined" == typeof fbq ? (!function(e, t, n, i, o, a, r) {
                e.fbq || (o = e.fbq = function() {
                    o.callMethod ? o.callMethod.apply(o, arguments) : o.queue.push(arguments)
                }, e._fbq || (e._fbq = o), o.push = o, o.loaded = !0, o.version = "2.0", o.queue = [], a = t.createElement(n), a.async = !0, a.src = i, r = t.getElementsByTagName(n)[0], r.parentNode.insertBefore(a, r))
            }(window, document, "script", "https://connect.facebook.net/en_US/fbevents.js"), fbq("track", "CompleteRegistration", {
                value: 10,
                currency: "USD"
            })) : fbq("track", "CompleteRegistration", {
                value: 10,
                currency: "USD"
            }))
        })
    }, o.showSuccess = function(t, n) {
        var i = ".unlockSavingPopupSuccess";
        e.lib.init("popup", function() {
            $.magnificPopup.close(), $.magnificPopup.open({
                items: {
                    src: t.replace("-NAME-", name)
                },
                closeOnBgClick: !0,
                callbacks: {
                    open: function() {
                        $(i).off().on("click", ".but", function(e) {
                            e.preventDefault(), $.magnificPopup.close()
                        })
                    },
                    close: function() {
                        n ? n() : location.reload()
                    }
                }
            })
        })
    }, o.showTerms = function() {
        var e = ".unlockSavingPopup";
        $(e).find(".content, .terms-content").toggleClass("hid").off("click.terms").on("click.terms", ".terms-content .but", function(e) {
            return e.preventDefault(), o.hideTerms(), !1
        })
    }, o.hideTerms = function() {
        var e = ".unlockSavingPopup";
        $(e).find(".content, .terms-content").toggleClass("hid")
    }, o.showTermsPopup = function(t) {
        e.lib.init("popup", function() {
            $.magnificPopup.close(), $.magnificPopup.open({
                items: {
                    src: t
                },
                closeOnBgClick: !0
            })
        })
    }
}
function TermsSalePopup(e) {
    var t = this,
        n = null;
    t.load = function(i) {
        $("body").on("click", ".w-inf.tooltip a", function() {
            if (!$(this).hasClass("loading"))
                if ($(this).addClass("loading"), n)
                    t.showPopup();
                else {
                    var i = $(".sale-line").data("id");
                    e.lib.init("popup", function() {
                        e.send_request("/pw_tour/load_terms_sale_layout/", {
                            id: i
                        }, function(e) {
                            "OK" == e.status && (n = e.html, t.showPopup()), $(this).removeClass("loading")
                        })
                    })
                }
        })
    }, t.showPopup = function() {
        $.magnificPopup.open({
            items: {
                src: n
            },
            closeOnBgClick: !0
        })
    }
}
!function(e) {
    function t(i) {
        if (n[i])
            return n[i].exports;
        var o = n[i] = {
            exports: {},
            id: i,
            loaded: !1
        };
        return e[i].call(o.exports, o, o.exports, t), o.loaded = !0, o.exports
    }
    var n = {};
    return t.m = e, t.c = n, t.p = "", t(0)
}([function(e, t, n) {
    "use strict";
    t.__esModule = !0;
    var i = n(1),
        o = function() {
            var e = new i.Tracker,
                t = 0;
            return setTimeout(function() {
                var n = function() {
                        var n = Array.prototype.slice.call(arguments),
                            i = n.shift();
                        if ("function" != typeof e[i])
                            return console.error("Tracking:: Unable to execute " + i + ". This method not exists "), null;
                        var o = e[i].apply(e, n);
                        return t && clearTimeout(t), t = setTimeout(function() {
                            e.sendBeacon()
                        }, 1e3), o
                    },
                    i = window,
                    o = i[i.CRMTracker].q || [];
                o.forEach(function(e) {
                    n.apply(n, e)
                }), i[i.CRMTracker] = n
            }, 1), window.addEventListener("beforeunload", function(t) {
                e.onUnload();
                var n = document.activeElement;
                n && n.href && n.href.indexOf(location.host) !== -1 || e.sendBeacon()
            }, !0), function() {}
        },
        a = document.readyState;
    "interactive" === a || "complete" === a ? o() : document.addEventListener("DOMContentLoaded", o)
}, function(e, t, n) {
    "use strict";
    t.__esModule = !0;
    var i = n(2),
        o = n(3),
        a = n(4),
        r = n(6),
        s = n(7),
        c = n(5),
        l = function() {
            function e(e) {
                void 0 === e && (e = null), this.eventQueue = [], this.forceData = !1, this.parameters = [], this.config = r["default"], e && this.setConfig(e), this.startTime = (new Date).getTime(), this.information = new a.Information(this.config)
            }
            return e.prototype.setConfig = function(e) {
                return this.config = s(this.config, e), this.information.setConfig(this.config), !0
            }, e.prototype.setPageValue = function(e) {
                return this.information.setPageValue(e), this
            }, e.prototype.getTrackData = function() {
                var e = this.getTrackId();
                return {
                    id: e,
                    localId: this.config.localId,
                    queue: this.getQueueList(!0),
                    data: this.information.getData(!!e),
                    parameters: this.parameters
                }
            }, e.prototype.getTrackId = function() {
                var e = i.Cookie.getCookie(this.config.keys.cookieId);
                return e ? e : (e = o.SessionStorage.get(this.config.keys.cookieId)) ? e : (e = c.LocalStorage.get(this.config.keys.cookieId), e ? e : null)
            }, e.prototype.setTrackId = function(e) {
                return i.Cookie.setCookie(this.config.keys.cookieId, e), o.SessionStorage.put(this.config.keys.cookieId, e), c.LocalStorage.put(this.config.keys.cookieId, e), this
            }, e.prototype.setVisitId = function(e) {
                return o.SessionStorage.put(this.config.keys.visitId, e), c.LocalStorage.put(this.config.keys.visitId, e), this.config.currentVisitId = e, this
            }, e.prototype.getBeaconData = function() {
                var e = this.getTrackId(),
                    t = {
                        id: e,
                        localId: this.config.localId,
                        queue: this.getQueueList(),
                        parameters: this.parameters
                    };
                return this.forceData && (t.data = this.information.getData(!1)), t
            }, e.prototype.processResult = function(e) {
                var t = this;
                if (e && e.success)
                    return this.setTrackId(e.data.id), this.setVisitId(e.data.visitId), this.parameters = [], this.eventQueue.forEach(function(n) {
                        t.addRawEvent(e.data.visitId, n)
                    }), e.data.calls.forEach(function(e) {
                        t[e.method].apply(t, e.params)
                    }), !0
            }, e.prototype.clearMe = function() {
                return i.Cookie.setCookie(this.config.keys.cookieId, ""), o.SessionStorage.put(this.config.keys.cookieId, ""), c.LocalStorage.put(this.config.keys.cookieId, ""), !0
            }, e.prototype.addEvent = function(e, t, n, i) {
                void 0 === i && (i = null);
                var o = this.config.currentVisitId,
                    a = {
                        category: e,
                        action: t,
                        value: n,
                        params: i,
                        time: Math.floor(Date.now() / 1e3)
                    };
                return o ? this.addRawEvent(o, a) : (this.eventQueue.push(a), !0)
            }, e.prototype.onUnload = function() {
                var e = this.config.currentVisitId;
                if (e) {
                    window.performance && window.performance.timing && (this.savePerformance(e, this.information.getPerformance()), this.startTime = window.performance.timing.loadEventEnd);
                    var t = (new Date).getTime(),
                        n = (t - this.startTime) / 1e3;
                    t <= this.startTime && (n = .1), this.saveVisitTime(e, n)
                }
            }, e.prototype.makeRequest = function(e, t, n) {
                if (window.fetch)
                    return void window.fetch(e, {
                        method: "POST",
                        body: t,
                        mode: "cors",
                        credentials: "include"
                    }).then(function(e) {
                        return e.json()
                    }).then(function(e) {
                        return n(e), !0
                    })["catch"](function(e) {
                        console.log("There has been a problem with your fetch operation: ", e)
                    });
                try {
                    var i = new XMLHttpRequest;
                    return i.open("POST", e, !0), i.withCredentials = !0, i.onload = function() {
                        200 == i.status && n(JSON.parse(i.responseText))
                    }, i.onerror = function(e) {}, i.send(t), i
                } catch (e) {
                    return null
                }
            }, e.prototype.isBeaconEmpty = function(e) {
                return !(e.parameters && e.parameters.length > 0 || e.queue && Object.keys(e.queue).length > 0 || e.data)
            }, e.prototype.sendBeacon = function() {
                var e = this,
                    t = this.getBeaconData();
                if (this.isBeaconEmpty(t))
                    return !1;
                var n = this.config.endpoint + "?id=" + t.id + "&rand=" + Math.random(),
                    i = JSON.stringify(t),
                    o = i,
                    a = window.navigator;
                if (a.sendBeacon && a.sendBeacon(n, o))
                    return this.getQueueList(!0), this.parameters = [], !0;
                var r = this.parameters;
                this.parameters = [];
                try {
                    var s = new XMLHttpRequest;
                    return s.open("POST", n, !0), s.withCredentials = !0, s.onload = function() {
                        200 == s.status && (e.parameters = [], e.getQueueList(!0))
                    }, s.onerror = function(t) {
                        e.appendParameters(r)
                    }, s.send(o), !0
                } catch (e) {
                    return !1
                }
            }, e.prototype.savePerformance = function(e, t) {
                var n = this.getQueue(e);
                return n.performance = t, this.saveQueue(e, n), !0
            }, e.prototype.addRawEvent = function(e, t) {
                var n = this.getQueue(e);
                return n.event = n.event || [], n.event.push(t), this.saveQueue(e, n), !0
            }, e.prototype.saveVisitTime = function(e, t) {
                var n = this.getQueue(e);
                return n.visitTime = t, this.saveQueue(e, n), !0
            }, e.prototype.getQueue = function(e) {
                var t = c.LocalStorage.get(this.config.keys.queueId) || {};
                return "undefined" == typeof t[e] ? {} : t[e]
            }, e.prototype.getQueueList = function(e) {
                void 0 === e && (e = !0);
                var t = c.LocalStorage.get(this.config.keys.queueId) || {};
                return e && c.LocalStorage.put(this.config.keys.queueId, {}), t
            }, e.prototype.saveQueue = function(e, t) {
                var n = c.LocalStorage.get(this.config.keys.queueId) || {};
                return n[e] = t, c.LocalStorage.put(this.config.keys.queueId, n), !0
            }, e.prototype.setForceSendData = function(e) {
                return this.forceData = e, this
            }, e.prototype.track = function() {
                var e = this,
                    t = this.getTrackData(),
                    n = this.config.endpoint + "?id=" + t.id + "&rand=" + Math.random(),
                    i = JSON.stringify(t);
                this.makeRequest(n, i, function(t) {
                    e.processResult(t)
                })
            }, e.prototype.setParameters = function(e) {
                return this.parameters = e, this
            }, e.prototype.appendParameters = function(e) {
                var t = this;
                return e.forEach(function(e) {
                    t.parameters.push(e)
                }), this
            }, e.prototype.addParameter = function(e, t, n) {
                return this.parameters.push({
                    param: e,
                    value: t,
                    points: n
                }), this
            }, e.prototype.start = function() {
                this.track()
            }, e
        }();
    t.Tracker = l
}, function(e, t) {
    "use strict";
    t.__esModule = !0;
    var n = function() {
        function e() {}
        return e.getCookiesList = function() {
            var e = {};
            if (document.cookie && "" != document.cookie)
                for (var t = document.cookie.split(";"), n = 0; n < t.length; n++) {
                    var i = t[n].split("=");
                    i[0] = i[0].replace(/^ /, ""), e[decodeURIComponent(i[0])] = decodeURIComponent(i[1])
                }
            return e
        }, e.getCookie = function(e) {
            for (var t = e + "=", n = document.cookie.split(";"), i = 0; i < n.length; i++) {
                for (var o = n[i]; " " == o.charAt(0);)
                    o = o.substring(1);
                if (0 == o.indexOf(t)) {
                    var a = o.substring(t.length, o.length);
                    return "undefined" == typeof a ? null : a
                }
            }
            return null
        }, e.setCookie = function(e, t, n) {
            void 0 === n && (n = 9999999);
            var i = new Date;
            i.setTime(i.getTime() + 24 * n * 60 * 60 * 1e3);
            var o = "expires=" + i.toUTCString();
            return document.cookie = e + "=" + t + ";" + o + ";path=/", !0
        }, e
    }();
    t.Cookie = n
}, function(e, t) {
    "use strict";
    t.__esModule = !0;
    var n = function() {
        function e() {}
        return e.getStorage = function() {
            return window.sessionStorage || null;
        }, e.put = function(e, t) {
            try {
                return !!this.getStorage() && (this.getStorage().setItem(e, JSON.stringify(t)), !0)
            } catch (e) {}
            return !1
        }, e.get = function(e) {
            try {
                if (!this.getStorage())
                    return null;
                var t = this.getStorage().getItem(e);
                return null === t ? t : JSON.parse(t)
            } catch (e) {
                return null
            }
        }, e
    }();
    t.SessionStorage = n
}, function(e, t, n) {
    "use strict";
    t.__esModule = !0;
    var i = n(2),
        o = n(5),
        a = n(3),
        r = function() {
            function e(e) {
                this.pageValue = null, this.setConfig(e)
            }
            return e.prototype.setPageValue = function(e) {
                return this.pageValue = e, this
            }, e.prototype.setConfig = function(e) {
                return this.config = e, this
            }, e.prototype.getScreen = function() {
                return {
                    width: screen.width,
                    height: screen.height,
                    pixelDepth: screen.pixelDepth,
                    availWidth: screen.availWidth,
                    availHeight: screen.availHeight,
                    colorDepth: screen.colorDepth
                }
            }, e.prototype.getNavigator = function() {
                var e = this.config.window.navigator;
                return {
                    appCodeName: e.appCodeName,
                    appName: e.appName,
                    appVersion: e.appVersion,
                    cookieEnabled: e.cookieEnabled,
                    doNotTrack: !!e.doNotTrack,
                    hardwareConcurrency: 0 | e.hardwareConcurrency,
                    language: e.language,
                    languages: e.languages,
                    maxTouchPoints: 0 | e.maxTouchPoints,
                    platform: e.platform,
                    product: e.product,
                    productSub: e.productSub,
                    userAgent: e.userAgent,
                    vendor: e.vendor,
                    vendorSub: e.vendorSub
                }
            }, e.prototype.getTabId = function() {
                var e = this.config.keys.tabId,
                    t = a.SessionStorage.get(e);
                if (t)
                    return t;
                var n = o.LocalStorage.get(e);
                return n = (0 | n) + 1, o.LocalStorage.put(e, n), a.SessionStorage.put(e, n), n
            }, e.prototype.getPerformance = function() {
                var e = this.config.window.performance;
                if (!e)
                    return null;
                var t = null;
                e.memory && (t = {
                    jsHeapSizeLimit: e.memory.jsHeapSizeLimit,
                    totalJSHeapSize: e.memory.totalJSHeapSize,
                    usedJSHeapSize: e.memory.usedJSHeapSize
                });
                var n = null;
                return e.getEntries && (n = e.getEntries()), {
                    timing: e.timing,
                    memory: t,
                    entries: n
                }
            }, e.prototype.getData = function(e) {
                return void 0 === e && (e = !1), {
                    url: this.config.window.location.href,
                    referrer: this.config.window.document.referrer,
                    tabId: this.getTabId(),
                    pageValue: this.pageValue,
                    screen: e ? null : this.getScreen(),
                    cookie: e ? null : i.Cookie.getCookiesList(),
                    navigator: e ? null : this.getNavigator(),
                    prev: a.SessionStorage.get(this.config.keys.visitId)
                }
            }, e
        }();
    t.Information = r
}, function(e, t, n) {
    "use strict";
    var i = this && this.__extends || function() {
        var e = Object.setPrototypeOf || {
            __proto__: []
        } instanceof Array && function(e, t) {
            e.__proto__ = t
        } || function(e, t) {
            for (var n in t)
                t.hasOwnProperty(n) && (e[n] = t[n])
        };
        return function(t, n) {
            function i() {
                this.constructor = t
            }
            e(t, n), t.prototype = null === n ? Object.create(n) : (i.prototype = n.prototype, new i)
        }
    }();
    t.__esModule = !0;
    var o = n(3),
        a = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.getStorage = function() {
                return window.localStorage || null
            }, t
        }(o.SessionStorage);
    t.LocalStorage = a
}, function(e, t) {
    "use strict";
    t.__esModule = !0;
    var n = "tracking__",
        i = {
            keys: {
                tabId: n + "tab_id",
                cookieId: n + "session_id",
                visitId: n + "visit_id",
                queueId: n + "queue"
            },
            endpoint: "",
            localId: Math.random().toString(),
            window: window,
            currentVisitId: null
        };
    t["default"] = i
}, function(e, t, n) {
    var i,
        o;
    !function(a, r) {
        i = r, o = "function" == typeof i ? i.call(t, n, t, e) : i, !(void 0 !== o && (e.exports = o))
    }(this, function() {
        function e(e) {
            var t = e && "object" == typeof e;
            return t && "[object RegExp]" !== Object.prototype.toString.call(e) && "[object Date]" !== Object.prototype.toString.call(e)
        }
        function t(e) {
            return Array.isArray(e) ? [] : {}
        }
        function n(n, i) {
            var o = i && i.clone === !0;
            return o && e(n) ? a(t(n), n, i) : n
        }
        function i(t, i, o) {
            var r = t.slice();
            return i.forEach(function(i, s) {
                "undefined" == typeof r[s] ? r[s] = n(i, o) : e(i) ? r[s] = a(t[s], i, o) : t.indexOf(i) === -1 && r.push(n(i, o))
            }), r
        }
        function o(t, i, o) {
            var r = {};
            return e(t) && Object.keys(t).forEach(function(e) {
                r[e] = n(t[e], o)
            }), Object.keys(i).forEach(function(s) {
                e(i[s]) && t[s] ? r[s] = a(t[s], i[s], o) : r[s] = n(i[s], o)
            }), r
        }
        function a(e, t, a) {
            var r = Array.isArray(t),
                s = a || {
                    arrayMerge: i
                },
                c = s.arrayMerge || i;
            return r ? Array.isArray(e) ? c(e, t, a) : n(t, a) : o(e, t, a)
        }
        return a.all = function(e, t) {
            if (!Array.isArray(e) || e.length < 2)
                throw new Error("first argument should be an array with at least two elements");
            return e.reduce(function(e, n) {
                return a(e, n, t)
            })
        }, a
    })
}]), !function(e, t) {
    "function" == typeof define && define.amd ? define(function() {
        return t(e)
    }) : t(e)
}(this, function(e) {
    var t = function() {
        function t(e) {
            return null == e ? String(e) : X[Z.call(e)] || "object"
        }
        function n(e) {
            return "function" == t(e)
        }
        function i(e) {
            return null != e && e == e.window
        }
        function o(e) {
            return null != e && e.nodeType == e.DOCUMENT_NODE
        }
        function a(e) {
            return "object" == t(e)
        }
        function r(e) {
            return a(e) && !i(e) && Object.getPrototypeOf(e) == Object.prototype
        }
        function s(e) {
            var t = !!e && "length" in e && e.length,
                n = C.type(e);
            return "function" != n && !i(e) && ("array" == n || 0 === t || "number" == typeof t && t > 0 && t - 1 in e)
        }
        function c(e) {
            return A.call(e, function(e) {
                return null != e
            })
        }
        function l(e) {
            return e.length > 0 ? C.fn.concat.apply([], e) : e
        }
        function u(e) {
            return e.replace(/::/g, "/").replace(/([A-Z]+)([A-Z][a-z])/g, "$1_$2").replace(/([a-z\d])([A-Z])/g, "$1_$2").replace(/_/g, "-").toLowerCase()
        }
        function d(e) {
            return e in N ? N[e] : N[e] = new RegExp("(^|\\s)" + e + "(\\s|$)")
        }
        function f(e, t) {
            return "number" != typeof t || D[u(e)] ? t : t + "px"
        }
        function p(e) {
            var t,
                n;
            return q[e] || (t = j.createElement(e), j.body.appendChild(t), n = getComputedStyle(t, "").getPropertyValue("display"), t.parentNode.removeChild(t), "none" == n && (n = "block"), q[e] = n), q[e]
        }
        function h(e) {
            return "children" in e ? P.call(e.children) : C.map(e.childNodes, function(e) {
                return 1 == e.nodeType ? e : void 0
            })
        }
        function m(e, t) {
            var n,
                i = e ? e.length : 0;
            for (n = 0; i > n; n++)
                this[n] = e[n];
            this.length = i, this.selector = t || ""
        }
        function v(e, t, n) {
            for (x in t)
                n && (r(t[x]) || ee(t[x])) ? (r(t[x]) && !r(e[x]) && (e[x] = {}), ee(t[x]) && !ee(e[x]) && (e[x] = []), v(e[x], t[x], n)) : t[x] !== $ && (e[x] = t[x])
        }
        function g(e, t) {
            return null == t ? C(e) : C(e).filter(t)
        }
        function y(e, t, i, o) {
            return n(t) ? t.call(e, i, o) : t
        }
        function _(e, t, n) {
            null == n ? e.removeAttribute(t) : e.setAttribute(t, n)
        }
        function w(e, t) {
            var n = e.className || "",
                i = n && n.baseVal !== $;
            return t === $ ? i ? n.baseVal : n : void (i ? n.baseVal = t : e.className = t)
        }
        function b(e) {
            try {
                return e ? "true" == e || "false" != e && ("null" == e ? null : +e + "" == e ? +e : /^[\[\{]/.test(e) ? C.parseJSON(e) : e) : e
            } catch (t) {
                return e
            }
        }
        function k(e, t) {
            t(e);
            for (var n = 0, i = e.childNodes.length; i > n; n++)
                k(e.childNodes[n], t)
        }
        var $,
            x,
            C,
            S,
            T,
            I,
            E = [],
            O = E.concat,
            A = E.filter,
            P = E.slice,
            j = e.document,
            q = {},
            N = {},
            D = {
                "column-count": 1,
                columns: 1,
                "font-weight": 1,
                "line-height": 1,
                opacity: 1,
                "z-index": 1,
                zoom: 1
            },
            M = /^\s*<(\w+|!)[^>]*>/,
            R = /^<(\w+)\s*\/?>(?:<\/\1>|)$/,
            L = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,
            H = /^(?:body|html)$/i,
            z = /([A-Z])/g,
            B = ["val", "css", "html", "text", "data", "width", "height", "offset"],
            F = ["after", "prepend", "before", "append"],
            V = j.createElement("table"),
            U = j.createElement("tr"),
            J = {
                tr: j.createElement("tbody"),
                tbody: V,
                thead: V,
                tfoot: V,
                td: U,
                th: U,
                "*": j.createElement("div")
            },
            Q = /complete|loaded|interactive/,
            W = /^[\w-]*$/,
            X = {},
            Z = X.toString,
            K = {},
            G = j.createElement("div"),
            Y = {
                tabindex: "tabIndex",
                readonly: "readOnly",
                "for": "htmlFor",
                "class": "className",
                maxlength: "maxLength",
                cellspacing: "cellSpacing",
                cellpadding: "cellPadding",
                rowspan: "rowSpan",
                colspan: "colSpan",
                usemap: "useMap",
                frameborder: "frameBorder",
                contenteditable: "contentEditable"
            },
            ee = Array.isArray || function(e) {
                return e instanceof Array
            };
        return K.matches = function(e, t) {
            if (!t || !e || 1 !== e.nodeType)
                return !1;
            var n = e.matches || e.webkitMatchesSelector || e.mozMatchesSelector || e.oMatchesSelector || e.matchesSelector;
            if (n)
                return n.call(e, t);
            var i,
                o = e.parentNode,
                a = !o;
            return a && (o = G).appendChild(e), i = ~K.qsa(o, t).indexOf(e), a && G.removeChild(e), i
        }, T = function(e) {
            return e.replace(/-+(.)?/g, function(e, t) {
                return t ? t.toUpperCase() : ""
            })
        }, I = function(e) {
            return A.call(e, function(t, n) {
                return e.indexOf(t) == n
            })
        }, K.fragment = function(e, t, n) {
            var i,
                o,
                a;
            return R.test(e) && (i = C(j.createElement(RegExp.$1))), i || (e.replace && (e = e.replace(L, "<$1></$2>")), t === $ && (t = M.test(e) && RegExp.$1), t in J || (t = "*"), a = J[t], a.innerHTML = "" + e, i = C.each(P.call(a.childNodes), function() {
                a.removeChild(this)
            })), r(n) && (o = C(i), C.each(n, function(e, t) {
                B.indexOf(e) > -1 ? o[e](t) : o.attr(e, t)
            })), i
        }, K.Z = function(e, t) {
            return new m(e, t)
        }, K.isZ = function(e) {
            return e instanceof K.Z
        }, K.init = function(e, t) {
            var i;
            if (!e)
                return K.Z();
            if ("string" == typeof e)
                if (e = e.trim(), "<" == e[0] && M.test(e))
                    i = K.fragment(e, RegExp.$1, t), e = null;
                else {
                    if (t !== $)
                        return C(t).find(e);
                    i = K.qsa(j, e)
                }
            else {
                if (n(e))
                    return C(j).ready(e);
                if (K.isZ(e))
                    return e;
                if (ee(e))
                    i = c(e);
                else if (a(e))
                    i = [e], e = null;
                else if (M.test(e))
                    i = K.fragment(e.trim(), RegExp.$1, t), e = null;
                else {
                    if (t !== $)
                        return C(t).find(e);
                    i = K.qsa(j, e)
                }
            }
            return K.Z(i, e)
        }, C = function(e, t) {
            return K.init(e, t)
        }, C.extend = function(e) {
            var t,
                n = P.call(arguments, 1);
            return "boolean" == typeof e && (t = e, e = n.shift()), n.forEach(function(n) {
                v(e, n, t)
            }), e
        }, K.qsa = function(e, t) {
            var n,
                i = "#" == t[0],
                o = !i && "." == t[0],
                a = i || o ? t.slice(1) : t,
                r = W.test(a);
            return e.getElementById && r && i ? (n = e.getElementById(a)) ? [n] : [] : 1 !== e.nodeType && 9 !== e.nodeType && 11 !== e.nodeType ? [] : P.call(r && !i && e.getElementsByClassName ? o ? e.getElementsByClassName(a) : e.getElementsByTagName(t) : e.querySelectorAll(t))
        }, C.contains = j.documentElement.contains ? function(e, t) {
            return e !== t && e.contains(t)
        } : function(e, t) {
            for (; t && (t = t.parentNode);)
                if (t === e)
                    return !0;
            return !1
        }, C.type = t, C.isFunction = n, C.isWindow = i, C.isArray = ee, C.isPlainObject = r, C.isEmptyObject = function(e) {
            var t;
            for (t in e)
                return !1;
            return !0
        }, C.isNumeric = function(e) {
            var t = Number(e),
                n = typeof e;
            return null != e && "boolean" != n && ("string" != n || e.length) && !isNaN(t) && isFinite(t) || !1
        }, C.inArray = function(e, t, n) {
            return E.indexOf.call(t, e, n)
        }, C.camelCase = T, C.trim = function(e) {
            return null == e ? "" : String.prototype.trim.call(e)
        }, C.uuid = 0, C.support = {}, C.expr = {}, C.noop = function() {}, C.map = function(e, t) {
            var n,
                i,
                o,
                a = [];
            if (s(e))
                for (i = 0; i < e.length; i++)
                    n = t(e[i], i), null != n && a.push(n);
            else
                for (o in e)
                    n = t(e[o], o), null != n && a.push(n);
            return l(a)
        }, C.each = function(e, t) {
            var n,
                i;
            if (s(e)) {
                for (n = 0; n < e.length; n++)
                    if (t.call(e[n], n, e[n]) === !1)
                        return e
            } else
                for (i in e)
                    if (t.call(e[i], i, e[i]) === !1)
                        return e;
            return e
        }, C.grep = function(e, t) {
            return A.call(e, t)
        }, e.JSON && (C.parseJSON = JSON.parse), C.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function(e, t) {
            X["[object " + t + "]"] = t.toLowerCase()
        }), C.fn = {
            constructor: K.Z,
            length: 0,
            forEach: E.forEach,
            reduce: E.reduce,
            push: E.push,
            sort: E.sort,
            splice: E.splice,
            indexOf: E.indexOf,
            concat: function() {
                var e,
                    t,
                    n = [];
                for (e = 0; e < arguments.length; e++)
                    t = arguments[e], n[e] = K.isZ(t) ? t.toArray() : t;
                return O.apply(K.isZ(this) ? this.toArray() : this, n)
            },
            map: function(e) {
                return C(C.map(this, function(t, n) {
                    return e.call(t, n, t)
                }))
            },
            slice: function() {
                return C(P.apply(this, arguments))
            },
            ready: function(e) {
                return Q.test(j.readyState) && j.body ? e(C) : j.addEventListener("DOMContentLoaded", function() {
                    e(C)
                }, !1), this
            },
            get: function(e) {
                return e === $ ? P.call(this) : this[e >= 0 ? e : e + this.length]
            },
            toArray: function() {
                return this.get()
            },
            size: function() {
                return this.length
            },
            remove: function() {
                return this.each(function() {
                    null != this.parentNode && this.parentNode.removeChild(this)
                })
            },
            each: function(e) {
                return E.every.call(this, function(t, n) {
                    return e.call(t, n, t) !== !1
                }), this
            },
            filter: function(e) {
                return n(e) ? this.not(this.not(e)) : C(A.call(this, function(t) {
                    return K.matches(t, e)
                }))
            },
            add: function(e, t) {
                return C(I(this.concat(C(e, t))))
            },
            is: function(e) {
                return this.length > 0 && K.matches(this[0], e)
            },
            not: function(e) {
                var t = [];
                if (n(e) && e.call !== $)
                    this.each(function(n) {
                        e.call(this, n) || t.push(this)
                    });
                else {
                    var i = "string" == typeof e ? this.filter(e) : s(e) && n(e.item) ? P.call(e) : C(e);
                    this.forEach(function(e) {
                        i.indexOf(e) < 0 && t.push(e)
                    })
                }
                return C(t)
            },
            has: function(e) {
                return this.filter(function() {
                    return a(e) ? C.contains(this, e) : C(this).find(e).size()
                })
            },
            eq: function(e) {
                return -1 === e ? this.slice(e) : this.slice(e, +e + 1)
            },
            first: function() {
                var e = this[0];
                return e && !a(e) ? e : C(e)
            },
            last: function() {
                var e = this[this.length - 1];
                return e && !a(e) ? e : C(e)
            },
            find: function(e) {
                var t,
                    n = this;
                return t = e ? "object" == typeof e ? C(e).filter(function() {
                    var e = this;
                    return E.some.call(n, function(t) {
                        return C.contains(t, e)
                    })
                }) : 1 == this.length ? C(K.qsa(this[0], e)) : this.map(function() {
                    return K.qsa(this, e)
                }) : C()
            },
            closest: function(e, t) {
                var n = [],
                    i = "object" == typeof e && C(e);
                return this.each(function(a, r) {
                    for (; r && !(i ? i.indexOf(r) >= 0 : K.matches(r, e));)
                        r = r !== t && !o(r) && r.parentNode;
                    r && n.indexOf(r) < 0 && n.push(r)
                }), C(n)
            },
            parents: function(e) {
                for (var t = [], n = this; n.length > 0;)
                    n = C.map(n, function(e) {
                        return (e = e.parentNode) && !o(e) && t.indexOf(e) < 0 ? (t.push(e), e) : void 0
                    });
                return g(t, e)
            },
            parent: function(e) {
                return g(I(this.pluck("parentNode")), e)
            },
            children: function(e) {
                return g(this.map(function() {
                    return h(this)
                }), e)
            },
            contents: function() {
                return this.map(function() {
                    return this.contentDocument || P.call(this.childNodes)
                })
            },
            siblings: function(e) {
                return g(this.map(function(e, t) {
                    return A.call(h(t.parentNode), function(e) {
                        return e !== t
                    })
                }), e)
            },
            empty: function() {
                return this.each(function() {
                    this.innerHTML = ""
                })
            },
            pluck: function(e) {
                return C.map(this, function(t) {
                    return t[e]
                })
            },
            show: function() {
                return this.each(function() {
                    "none" == this.style.display && (this.style.display = ""), "none" == getComputedStyle(this, "").getPropertyValue("display") && (this.style.display = p(this.nodeName))
                })
            },
            replaceWith: function(e) {
                return this.before(e).remove()
            },
            wrap: function(e) {
                var t = n(e);
                if (this[0] && !t)
                    var i = C(e).get(0),
                        o = i.parentNode || this.length > 1;
                return this.each(function(n) {
                    C(this).wrapAll(t ? e.call(this, n) : o ? i.cloneNode(!0) : i)
                })
            },
            wrapAll: function(e) {
                if (this[0]) {
                    C(this[0]).before(e = C(e));
                    for (var t; (t = e.children()).length;)
                        e = t.first();
                    C(e).append(this)
                }
                return this
            },
            wrapInner: function(e) {
                var t = n(e);
                return this.each(function(n) {
                    var i = C(this),
                        o = i.contents(),
                        a = t ? e.call(this, n) : e;
                    o.length ? o.wrapAll(a) : i.append(a)
                })
            },
            unwrap: function() {
                return this.parent().each(function() {
                    C(this).replaceWith(C(this).children())
                }), this
            },
            clone: function() {
                return this.map(function() {
                    return this.cloneNode(!0)
                })
            },
            hide: function() {
                return this.css("display", "none")
            },
            toggle: function(e) {
                return this.each(function() {
                    var t = C(this);
                    (e === $ ? "none" == t.css("display") : e) ? t.show() : t.hide()
                })
            },
            prev: function(e) {
                return C(this.pluck("previousElementSibling")).filter(e || "*")
            },
            next: function(e) {
                return C(this.pluck("nextElementSibling")).filter(e || "*")
            },
            html: function(e) {
                return 0 in arguments ? this.each(function(t) {
                    var n = this.innerHTML;
                    C(this).empty().append(y(this, e, t, n))
                }) : 0 in this ? this[0].innerHTML : null
            },
            text: function(e) {
                return 0 in arguments ? this.each(function(t) {
                    var n = y(this, e, t, this.textContent);
                    this.textContent = null == n ? "" : "" + n
                }) : 0 in this ? this.pluck("textContent").join("") : null
            },
            attr: function(e, t) {
                var n;
                return "string" != typeof e || 1 in arguments ? this.each(function(n) {
                    if (1 === this.nodeType)
                        if (a(e))
                            for (x in e)
                                _(this, x, e[x]);
                        else
                            _(this, e, y(this, t, n, this.getAttribute(e)))
                }) : 0 in this && 1 == this[0].nodeType && null != (n = this[0].getAttribute(e)) ? n : $
            },
            removeAttr: function(e) {
                return this.each(function() {
                    1 === this.nodeType && e.split(" ").forEach(function(e) {
                        _(this, e)
                    }, this)
                })
            },
            prop: function(e, t) {
                return e = Y[e] || e, 1 in arguments ? this.each(function(n) {
                    this[e] = y(this, t, n, this[e])
                }) : this[0] && this[0][e]
            },
            removeProp: function(e) {
                return e = Y[e] || e, this.each(function() {
                    delete this[e]
                })
            },
            data: function(e, t) {
                var n = "data-" + e.replace(z, "-$1").toLowerCase(),
                    i = 1 in arguments ? this.attr(n, t) : this.attr(n);
                return null !== i ? b(i) : $
            },
            val: function(e) {
                return 0 in arguments ? (null == e && (e = ""), this.each(function(t) {
                    this.value = y(this, e, t, this.value)
                })) : this[0] && (this[0].multiple ? C(this[0]).find("option").filter(function() {
                    return this.selected
                }).pluck("value") : this[0].value)
            },
            offset: function(t) {
                if (t)
                    return this.each(function(e) {
                        var n = C(this),
                            i = y(this, t, e, n.offset()),
                            o = n.offsetParent().offset(),
                            a = {
                                top: i.top - o.top,
                                left: i.left - o.left
                            };
                        "static" == n.css("position") && (a.position = "relative"), n.css(a)
                    });
                if (!this.length)
                    return null;
                if (j.documentElement !== this[0] && !C.contains(j.documentElement, this[0]))
                    return {
                        top: 0,
                        left: 0
                    };
                var n = this[0].getBoundingClientRect();
                return {
                    left: n.left + e.pageXOffset,
                    top: n.top + e.pageYOffset,
                    width: Math.round(n.width),
                    height: Math.round(n.height)
                }
            },
            css: function(e, n) {
                if (arguments.length < 2) {
                    var i = this[0];
                    if ("string" == typeof e) {
                        if (!i)
                            return;
                        return i.style[T(e)] || getComputedStyle(i, "").getPropertyValue(e)
                    }
                    if (ee(e)) {
                        if (!i)
                            return;
                        var o = {},
                            a = getComputedStyle(i, "");
                        return C.each(e, function(e, t) {
                            o[t] = i.style[T(t)] || a.getPropertyValue(t)
                        }), o
                    }
                }
                var r = "";
                if ("string" == t(e))
                    n || 0 === n ? r = u(e) + ":" + f(e, n) : this.each(function() {
                        this.style.removeProperty(u(e))
                    });
                else
                    for (x in e)
                        e[x] || 0 === e[x] ? r += u(x) + ":" + f(x, e[x]) + ";" : this.each(function() {
                            this.style.removeProperty(u(x))
                        });
                return this.each(function() {
                    this.style.cssText += ";" + r
                })
            },
            index: function(e) {
                return e ? this.indexOf(C(e)[0]) : this.parent().children().indexOf(this[0])
            },
            hasClass: function(e) {
                return !!e && E.some.call(this, function(e) {
                        return this.test(w(e))
                    }, d(e))
            },
            addClass: function(e) {
                return e ? this.each(function(t) {
                    if ("className" in this) {
                        S = [];
                        var n = w(this),
                            i = y(this, e, t, n);
                        i.split(/\s+/g).forEach(function(e) {
                            C(this).hasClass(e) || S.push(e)
                        }, this), S.length && w(this, n + (n ? " " : "") + S.join(" "))
                    }
                }) : this
            },
            removeClass: function(e) {
                return this.each(function(t) {
                    if ("className" in this) {
                        if (e === $)
                            return w(this, "");
                        S = w(this), y(this, e, t, S).split(/\s+/g).forEach(function(e) {
                            S = S.replace(d(e), " ")
                        }), w(this, S.trim())
                    }
                })
            },
            toggleClass: function(e, t) {
                return e ? this.each(function(n) {
                    var i = C(this),
                        o = y(this, e, n, w(this));
                    o.split(/\s+/g).forEach(function(e) {
                        (t === $ ? !i.hasClass(e) : t) ? i.addClass(e) : i.removeClass(e)
                    })
                }) : this
            },
            scrollTop: function(e) {
                if (this.length) {
                    var t = "scrollTop" in this[0];
                    return e === $ ? t ? this[0].scrollTop : this[0].pageYOffset : this.each(t ? function() {
                        this.scrollTop = e
                    } : function() {
                        this.scrollTo(this.scrollX, e)
                    })
                }
            },
            scrollLeft: function(e) {
                if (this.length) {
                    var t = "scrollLeft" in this[0];
                    return e === $ ? t ? this[0].scrollLeft : this[0].pageXOffset : this.each(t ? function() {
                        this.scrollLeft = e
                    } : function() {
                        this.scrollTo(e, this.scrollY)
                    })
                }
            },
            position: function() {
                if (this.length) {
                    var e = this[0],
                        t = this.offsetParent(),
                        n = this.offset(),
                        i = H.test(t[0].nodeName) ? {
                            top: 0,
                            left: 0
                        } : t.offset();
                    return n.top -= parseFloat(C(e).css("margin-top")) || 0, n.left -= parseFloat(C(e).css("margin-left")) || 0, i.top += parseFloat(C(t[0]).css("border-top-width")) || 0, i.left += parseFloat(C(t[0]).css("border-left-width")) || 0, {
                        top: n.top - i.top,
                        left: n.left - i.left
                    }
                }
            },
            offsetParent: function() {
                return this.map(function() {
                    for (var e = this.offsetParent || j.body; e && !H.test(e.nodeName) && "static" == C(e).css("position");)
                        e = e.offsetParent;
                    return e
                })
            }
        }, C.fn.detach = C.fn.remove, ["width", "height"].forEach(function(e) {
            var t = e.replace(/./, function(e) {
                return e[0].toUpperCase()
            });
            C.fn[e] = function(n) {
                var a,
                    r = this[0];
                return n === $ ? i(r) ? r["inner" + t] : o(r) ? r.documentElement["scroll" + t] : (a = this.offset()) && a[e] : this.each(function(t) {
                    r = C(this), r.css(e, y(this, n, t, r[e]()))
                })
            }
        }), F.forEach(function(n, i) {
            var o = i % 2;
            C.fn[n] = function() {
                var n,
                    a,
                    r = C.map(arguments, function(e) {
                        var i = [];
                        return n = t(e), "array" == n ? (e.forEach(function(e) {
                            return e.nodeType !== $ ? i.push(e) : C.zepto.isZ(e) ? i = i.concat(e.get()) : void (i = i.concat(K.fragment(e)))
                        }), i) : "object" == n || null == e ? e : K.fragment(e)
                    }),
                    s = this.length > 1;
                return r.length < 1 ? this : this.each(function(t, n) {
                    a = o ? n : n.parentNode, n = 0 == i ? n.nextSibling : 1 == i ? n.firstChild : 2 == i ? n : null;
                    var c = C.contains(j.documentElement, a);
                    r.forEach(function(t) {
                        if (s)
                            t = t.cloneNode(!0);
                        else if (!a)
                            return C(t).remove();
                        a.insertBefore(t, n), c && k(t, function(t) {
                            if (!(null == t.nodeName || "SCRIPT" !== t.nodeName.toUpperCase() || t.type && "text/javascript" !== t.type || t.src)) {
                                var n = t.ownerDocument ? t.ownerDocument.defaultView : e;
                                n.eval.call(n, t.innerHTML)
                            }
                        })
                    })
                })
            }, C.fn[o ? n + "To" : "insert" + (i ? "Before" : "After")] = function(e) {
                return C(e)[n](this), this
            }
        }), K.Z.prototype = m.prototype = C.fn, K.uniq = I, K.deserializeValue = b, C.zepto = K, C
    }();
    return e.Zepto = t, void 0 === e.$ && (e.$ = t), function(t) {
        function n(e) {
            return e._zid || (e._zid = p++)
        }
        function i(e, t, i, r) {
            if (t = o(t), t.ns)
                var s = a(t.ns);
            return (g[n(e)] || []).filter(function(e) {
                return e && (!t.e || e.e == t.e) && (!t.ns || s.test(e.ns)) && (!i || n(e.fn) === n(i)) && (!r || e.sel == r)
            })
        }
        function o(e) {
            var t = ("" + e).split(".");
            return {
                e: t[0],
                ns: t.slice(1).sort().join(" ")
            }
        }
        function a(e) {
            return new RegExp("(?:^| )" + e.replace(" ", " .* ?") + "(?: |$)")
        }
        function r(e, t) {
            return e.del && !_ && e.e in w || !!t
        }
        function s(e) {
            return b[e] || _ && w[e] || e
        }
        function c(e, i, a, c, l, d, p) {
            var h = n(e),
                m = g[h] || (g[h] = []);
            i.split(/\s/).forEach(function(n) {
                if ("ready" == n)
                    return t(document).ready(a);
                var i = o(n);
                i.fn = a, i.sel = l, i.e in b && (a = function(e) {
                    var n = e.relatedTarget;
                    return !n || n !== this && !t.contains(this, n) ? i.fn.apply(this, arguments) : void 0
                }), i.del = d;
                var h = d || a;
                i.proxy = function(t) {
                    if (t = u(t), !t.isImmediatePropagationStopped()) {
                        t.data = c;
                        var n = h.apply(e, t._args == f ? [t] : [t].concat(t._args));
                        return n === !1 && (t.preventDefault(), t.stopPropagation()), n
                    }
                }, i.i = m.length, m.push(i), "addEventListener" in e && e.addEventListener(s(i.e), i.proxy, r(i, p))
            })
        }
        function l(e, t, o, a, c) {
            var l = n(e);
            (t || "").split(/\s/).forEach(function(t) {
                i(e, t, o, a).forEach(function(t) {
                    delete g[l][t.i], "removeEventListener" in e && e.removeEventListener(s(t.e), t.proxy, r(t, c))
                })
            })
        }
        function u(e, n) {
            return (n || !e.isDefaultPrevented) && (n || (n = e), t.each(C, function(t, i) {
                var o = n[t];
                e[t] = function() {
                    return this[i] = k, o && o.apply(n, arguments)
                }, e[i] = $
            }), e.timeStamp || (e.timeStamp = Date.now()), (n.defaultPrevented !== f ? n.defaultPrevented : "returnValue" in n ? n.returnValue === !1 : n.getPreventDefault && n.getPreventDefault()) && (e.isDefaultPrevented = k)), e
        }
        function d(e) {
            var t,
                n = {
                    originalEvent: e
                };
            for (t in e)
                x.test(t) || e[t] === f || (n[t] = e[t]);
            return u(n, e)
        }
        var f,
            p = 1,
            h = Array.prototype.slice,
            m = t.isFunction,
            v = function(e) {
                return "string" == typeof e
            },
            g = {},
            y = {},
            _ = "onfocusin" in e,
            w = {
                focus: "focusin",
                blur: "focusout"
            },
            b = {
                mouseenter: "mouseover",
                mouseleave: "mouseout"
            };
        y.click = y.mousedown = y.mouseup = y.mousemove = "MouseEvents", t.event = {
            add: c,
            remove: l
        }, t.proxy = function(e, i) {
            var o = 2 in arguments && h.call(arguments, 2);
            if (m(e)) {
                var a = function() {
                    return e.apply(i, o ? o.concat(h.call(arguments)) : arguments)
                };
                return a._zid = n(e), a
            }
            if (v(i))
                return o ? (o.unshift(e[i], e), t.proxy.apply(null, o)) : t.proxy(e[i], e);
            throw new TypeError("expected function")
        }, t.fn.bind = function(e, t, n) {
            return this.on(e, t, n)
        }, t.fn.unbind = function(e, t) {
            return this.off(e, t)
        }, t.fn.one = function(e, t, n, i) {
            return this.on(e, t, n, i, 1)
        };
        var k = function() {
                return !0
            },
            $ = function() {
                return !1
            },
            x = /^([A-Z]|returnValue$|layer[XY]$|webkitMovement[XY]$)/,
            C = {
                preventDefault: "isDefaultPrevented",
                stopImmediatePropagation: "isImmediatePropagationStopped",
                stopPropagation: "isPropagationStopped"
            };
        t.fn.delegate = function(e, t, n) {
            return this.on(t, e, n)
        }, t.fn.undelegate = function(e, t, n) {
            return this.off(t, e, n)
        }, t.fn.live = function(e, n) {
            return t(document.body).delegate(this.selector, e, n), this
        }, t.fn.die = function(e, n) {
            return t(document.body).undelegate(this.selector, e, n), this
        }, t.fn.on = function(e, n, i, o, a) {
            var r,
                s,
                u = this;
            return e && !v(e) ? (t.each(e, function(e, t) {
                u.on(e, n, i, t, a)
            }), u) : (v(n) || m(o) || o === !1 || (o = i, i = n, n = f), (o === f || i === !1) && (o = i, i = f), o === !1 && (o = $), u.each(function(u, f) {
                a && (r = function(e) {
                    return l(f, e.type, o), o.apply(this, arguments)
                }), n && (s = function(e) {
                    var i,
                        a = t(e.target).closest(n, f).get(0);
                    return a && a !== f ? (i = t.extend(d(e), {
                        currentTarget: a,
                        liveFired: f
                    }), (r || o).apply(a, [i].concat(h.call(arguments, 1)))) : void 0
                }), c(f, e, o, i, n, s || r)
            }))
        }, t.fn.off = function(e, n, i) {
            var o = this;
            return e && !v(e) ? (t.each(e, function(e, t) {
                o.off(e, n, t)
            }), o) : (v(n) || m(i) || i === !1 || (i = n, n = f), i === !1 && (i = $), o.each(function() {
                l(this, e, i, n)
            }))
        }, t.fn.trigger = function(e, n) {
            return e = v(e) || t.isPlainObject(e) ? t.Event(e) : u(e), e._args = n, this.each(function() {
                e.type in w && "function" == typeof this[e.type] ? this[e.type]() : "dispatchEvent" in this ? this.dispatchEvent(e) : t(this).triggerHandler(e, n)
            })
        }, t.fn.triggerHandler = function(e, n) {
            var o,
                a;
            return this.each(function(r, s) {
                o = d(v(e) ? t.Event(e) : e), o._args = n, o.target = s, t.each(i(s, e.type || e), function(e, t) {
                    return a = t.proxy(o), !o.isImmediatePropagationStopped() && void 0
                })
            }), a
        }, "focusin focusout focus blur load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select keydown keypress keyup error".split(" ").forEach(function(e) {
            t.fn[e] = function(t) {
                return 0 in arguments ? this.bind(e, t) : this.trigger(e)
            }
        }), t.Event = function(e, t) {
            v(e) || (t = e, e = t.type);
            var n = document.createEvent(y[e] || "Events"),
                i = !0;
            if (t)
                for (var o in t)
                    "bubbles" == o ? i = !!t[o] : n[o] = t[o];
            return n.initEvent(e, i, !0), u(n)
        }
    }(t), function(t) {
        function n(e, n, i) {
            var o = t.Event(n);
            return t(e).trigger(o, i), !o.isDefaultPrevented()
        }
        function i(e, t, i, o) {
            return e.global ? n(t || w, i, o) : void 0
        }
        function o(e) {
            e.global && 0 === t.active++ && i(e, null, "ajaxStart")
        }
        function a(e) {
            e.global && !--t.active && i(e, null, "ajaxStop")
        }
        function r(e, t) {
            var n = t.context;
            return t.beforeSend.call(n, e, t) !== !1 && i(t, n, "ajaxBeforeSend", [e, t]) !== !1 && void i(t, n, "ajaxSend", [e, t])
        }
        function s(e, t, n, o) {
            var a = n.context,
                r = "success";
            n.success.call(a, e, r, t), o && o.resolveWith(a, [e, r, t]), i(n, a, "ajaxSuccess", [t, n, e]), l(r, t, n)
        }
        function c(e, t, n, o, a) {
            var r = o.context;
            o.error.call(r, n, t, e), a && a.rejectWith(r, [n, t, e]), i(o, r, "ajaxError", [n, o, e || t]), l(t, n, o)
        }
        function l(e, t, n) {
            var o = n.context;
            n.complete.call(o, t, e), i(n, o, "ajaxComplete", [t, n]), a(n)
        }
        function u(e, t, n) {
            if (n.dataFilter == d)
                return e;
            var i = n.context;
            return n.dataFilter.call(i, e, t)
        }
        function d() {}
        function f(e) {
            return e && (e = e.split(";", 2)[0]), e && (e == C ? "html" : e == x ? "json" : k.test(e) ? "script" : $.test(e) && "xml") || "text"
        }
        function p(e, t) {
            return "" == t ? e : (e + "&" + t).replace(/[&?]{1,2}/, "?")
        }
        function h(e) {
            e.processData && e.data && "string" != t.type(e.data) && (e.data = t.param(e.data, e.traditional)), !e.data || e.type && "GET" != e.type.toUpperCase() && "jsonp" != e.dataType || (e.url = p(e.url, e.data), e.data = void 0)
        }
        function m(e, n, i, o) {
            return t.isFunction(n) && (o = i, i = n, n = void 0), t.isFunction(i) || (o = i, i = void 0), {
                url: e,
                data: n,
                success: i,
                dataType: o
            }
        }
        function v(e, n, i, o) {
            var a,
                r = t.isArray(n),
                s = t.isPlainObject(n);
            t.each(n, function(n, c) {
                a = t.type(c), o && (n = i ? o : o + "[" + (s || "object" == a || "array" == a ? n : "") + "]"), !o && r ? e.add(c.name, c.value) : "array" == a || !i && "object" == a ? v(e, c, i, n) : e.add(n, c)
            })
        }
        var g,
            y,
            _ = +new Date,
            w = e.document,
            b = /<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,
            k = /^(?:text|application)\/javascript/i,
            $ = /^(?:text|application)\/xml/i,
            x = "application/json",
            C = "text/html",
            S = /^\s*$/,
            T = w.createElement("a");
        T.href = e.location.href, t.active = 0, t.ajaxJSONP = function(n, i) {
            if (!("type" in n))
                return t.ajax(n);
            var o,
                a,
                l = n.jsonpCallback,
                u = (t.isFunction(l) ? l() : l) || "Zepto" + _++,
                d = w.createElement("script"),
                f = e[u],
                p = function(e) {
                    t(d).triggerHandler("error", e || "abort")
                },
                h = {
                    abort: p
                };
            return i && i.promise(h), t(d).on("load error", function(r, l) {
                clearTimeout(a), t(d).off().remove(), "error" != r.type && o ? s(o[0], h, n, i) : c(null, l || "error", h, n, i), e[u] = f, o && t.isFunction(f) && f(o[0]), f = o = void 0
            }), r(h, n) === !1 ? (p("abort"), h) : (e[u] = function() {
                o = arguments
            }, d.src = n.url.replace(/\?(.+)=\?/, "?$1=" + u), w.head.appendChild(d), n.timeout > 0 && (a = setTimeout(function() {
                p("timeout")
            }, n.timeout)), h)
        }, t.ajaxSettings = {
            type: "GET",
            beforeSend: d,
            success: d,
            error: d,
            complete: d,
            context: null,
            global: !0,
            xhr: function() {
                return new e.XMLHttpRequest
            },
            accepts: {
                script: "text/javascript, application/javascript, application/x-javascript",
                json: x,
                xml: "application/xml, text/xml",
                html: C,
                text: "text/plain"
            },
            crossDomain: !1,
            timeout: 0,
            processData: !0,
            cache: !0,
            dataFilter: d
        }, t.ajax = function(n) {
            var i,
                a,
                l = t.extend({}, n || {}),
                m = t.Deferred && t.Deferred();
            for (g in t.ajaxSettings)
                void 0 === l[g] && (l[g] = t.ajaxSettings[g]);
            o(l), l.crossDomain || (i = w.createElement("a"), i.href = l.url, i.href = i.href, l.crossDomain = T.protocol + "//" + T.host != i.protocol + "//" + i.host), l.url || (l.url = e.location.toString()), (a = l.url.indexOf("#")) > -1 && (l.url = l.url.slice(0, a)), h(l);
            var v = l.dataType,
                _ = /\?.+=\?/.test(l.url);
            if (_ && (v = "jsonp"), l.cache !== !1 && (n && n.cache === !0 || "script" != v && "jsonp" != v) || (l.url = p(l.url, "_=" + Date.now())), "jsonp" == v)
                return _ || (l.url = p(l.url, l.jsonp ? l.jsonp + "=?" : l.jsonp === !1 ? "" : "callback=?")), t.ajaxJSONP(l, m);
            var b,
                k = l.accepts[v],
                $ = {},
                x = function(e, t) {
                    $[e.toLowerCase()] = [e, t]
                },
                C = /^([\w-]+:)\/\//.test(l.url) ? RegExp.$1 : e.location.protocol,
                I = l.xhr(),
                E = I.setRequestHeader;
            if (m && m.promise(I), l.crossDomain || x("X-Requested-With", "XMLHttpRequest"), x("Accept", k || "*/*"), (k = l.mimeType || k) && (k.indexOf(",") > -1 && (k = k.split(",", 2)[0]), I.overrideMimeType && I.overrideMimeType(k)), (l.contentType || l.contentType !== !1 && l.data && "GET" != l.type.toUpperCase()) && x("Content-Type", l.contentType || "application/x-www-form-urlencoded"), l.headers)
                for (y in l.headers)
                    x(y, l.headers[y]);
            if (I.setRequestHeader = x, I.onreadystatechange = function() {
                if (4 == I.readyState) {
                    I.onreadystatechange = d, clearTimeout(b);
                    var e,
                        n = !1;
                    if (I.status >= 200 && I.status < 300 || 304 == I.status || 0 == I.status && "file:" == C) {
                        if (v = v || f(l.mimeType || I.getResponseHeader("content-type")), "arraybuffer" == I.responseType || "blob" == I.responseType)
                            e = I.response;
                        else {
                            e = I.responseText;
                            try {
                                e = u(e, v, l), "script" == v ? (0, eval)(e) : "xml" == v ? e = I.responseXML : "json" == v && (e = S.test(e) ? null : t.parseJSON(e))
                            } catch (i) {
                                n = i
                            }
                            if (n)
                                return c(n, "parsererror", I, l, m)
                        }
                        s(e, I, l, m)
                    } else
                        c(I.statusText || null, I.status ? "error" : "abort", I, l, m)
                }
            }, r(I, l) === !1)
                return I.abort(), c(null, "abort", I, l, m), I;
            var O = !("async" in l) || l.async;
            if (I.open(l.type, l.url, O, l.username, l.password), l.xhrFields)
                for (y in l.xhrFields)
                    I[y] = l.xhrFields[y];
            for (y in $)
                E.apply(I, $[y]);
            return l.timeout > 0 && (b = setTimeout(function() {
                I.onreadystatechange = d, I.abort(), c(null, "timeout", I, l, m)
            }, l.timeout)), I.send(l.data ? l.data : null), I
        }, t.get = function() {
            return t.ajax(m.apply(null, arguments))
        }, t.post = function() {
            var e = m.apply(null, arguments);
            return e.type = "POST", t.ajax(e)
        }, t.getJSON = function() {
            var e = m.apply(null, arguments);
            return e.dataType = "json", t.ajax(e)
        }, t.fn.load = function(e, n, i) {
            if (!this.length)
                return this;
            var o,
                a = this,
                r = e.split(/\s/),
                s = m(e, n, i),
                c = s.success;
            return r.length > 1 && (s.url = r[0], o = r[1]), s.success = function(e) {
                a.html(o ? t("<div>").html(e.replace(b, "")).find(o) : e), c && c.apply(a, arguments)
            }, t.ajax(s), this
        };
        var I = encodeURIComponent;
        t.param = function(e, n) {
            var i = [];
            return i.add = function(e, n) {
                t.isFunction(n) && (n = n()), null == n && (n = ""), this.push(I(e) + "=" + I(n))
            }, v(i, e, n), i.join("&").replace(/%20/g, "+")
        }
    }(t), function(e) {
        e.fn.serializeArray = function() {
            var t,
                n,
                i = [],
                o = function(e) {
                    return e.forEach ? e.forEach(o) : void i.push({
                        name: t,
                        value: e
                    })
                };
            return this[0] && e.each(this[0].elements, function(i, a) {
                n = a.type, t = a.name, t && "fieldset" != a.nodeName.toLowerCase() && !a.disabled && "submit" != n && "reset" != n && "button" != n && "file" != n && ("radio" != n && "checkbox" != n || a.checked) && o(e(a).val())
            }), i
        }, e.fn.serialize = function() {
            var e = [];
            return this.serializeArray().forEach(function(t) {
                e.push(encodeURIComponent(t.name) + "=" + encodeURIComponent(t.value))
            }), e.join("&")
        }, e.fn.submit = function(t) {
            if (0 in arguments)
                this.bind("submit", t);
            else if (this.length) {
                var n = e.Event("submit");
                this.eq(0).trigger(n), n.isDefaultPrevented() || this.get(0).submit()
            }
            return this
        }
    }(t), function() {
        try {
            getComputedStyle(void 0)
        } catch (t) {
            var n = getComputedStyle;
            e.getComputedStyle = function(e, t) {
                try {
                    return n(e, t)
                } catch (i) {
                    return null
                }
            }
        }
    }(), t
}), function(e) {
    e.fn.unveil = function(t, n) {
        function i() {
            var t = l.filter(function() {
                var t = e(this);
                if ("none" != t.css("display") && (0 != t.offset().width || 0 != t.offset().height)) {
                    var n = a.scrollTop(),
                        i = n + a.height(),
                        o = t.offset().top,
                        s = o + t.height();
                    return s >= n - r && o <= i + r && !e(this).hasClass("lazyback")
                }
            });
            o = t.trigger("unveil"), l = l.not(o)
        }
        var o,
            a = e(window),
            r = t || 0,
            s = window.devicePixelRatio > 1,
            c = s ? "data-src-retina" : "data-src",
            l = this;
        return this.one("unveil", function() {
            var t = this.getAttribute(c);
            t = t || this.getAttribute("data-src"), t && (e(this).is("img") ? this.setAttribute("src", t) : e(this).css("background-image", "url('" + t + "')"), "function" == typeof n && n.call(this))
        }), "object" == typeof common && "function" == typeof common.byWindowAction ? common.byWindowAction(["scroll", "resize", "lookup"], i) : a.on("scroll.unveil resize.unveil lookup.unveil", i), i(), this
    }
}(window.jQuery || window.Zepto);
var common = new Common,
    header = new Header,
    footer = new Footer;
if (common.init_bg_all(), common.init_lazyload(), common.initWindowAction(), common.initUserInteraction(), common.initParameters(), $("header").length && (header.menu.initiate(), header.search.initiate(), header.top_banner.initiate()), $("footer").length && (footer.links.initiate(), footer.subscribe.initiate(), footer.social.initiate(), ("tdp" !== common.parameters.page_type || "tdp" === common.parameters.page_type && !$("body").hasClass("mob")) && footer.olark.initiate(), footer.elems(), "#chat" == location.hash)) {
    footer.olark.load();
    var OlarkChatLoaded = setInterval(function() {
        "function" == typeof olark && (clearInterval(OlarkChatLoaded), olark("api.box.expand"))
    }, 10)
}
$("header").length, window.addEventListener("load", function() {
    var e = new Homepage;
    e.initiate()
});
;
(function() {
    var s = document.createElement("script");
    s.innerHTML = "(function(){var h=this,l=function(a){return\"string\"==typeof a},aa=Date.now||function(){return+new Date};var n=function(a){a=parseFloat(a);return isNaN(a)||1<a||0>a?0:a};var da=Array.prototype.indexOf?function(a,b){return Array.prototype.indexOf.call(a,b,void 0)}:function(a,b){if(l(a))return l(b)&&1==b.length?a.indexOf(b,0):-1;for(var c=0;c<a.length;c++)if(c in a&&a[c]===b)return c;return-1},fa=Array.prototype.filter?function(a,b){return Array.prototype.filter.call(a,b,void 0)}:function(a,b){for(var c=a.length,d=[],e=0,f=l(a)?a.split(\"\"):a,g=0;g<c;g++)if(g in f){var k=f[g];b.call(void 0,k,g,a)&&(d[e++]=k)}return d},ha=Array.prototype.map?function(a,b,c){return Array.prototype.map.call(a,\nb,c)}:function(a,b,c){for(var d=a.length,e=Array(d),f=l(a)?a.split(\"\"):a,g=0;g<d;g++)g in f&&(e[g]=b.call(c,f[g],g,a));return e},ia=function(a){return Array.prototype.concat.apply([],arguments)};var p=function(a){var b=[],c=0,d;for(d in a)b[c++]=a[d];return b};var q=function(a){q[\" \"](a);return a};q[\" \"]=function(){};var r=function(a,b){for(var c in a)Object.prototype.hasOwnProperty.call(a,c)&&b.call(void 0,a[c],c,a)};var ja=n(\"0.20\"),ka=n(\"0.0\"),la=n(\"1.0\"),ma=n(\"0.0\"),na=n(\"0.2\"),oa=n(\"0.0\"),pa=n(\"0.0\");var qa=\/^true$\/.test(\"false\"),ra=\/^true$\/.test(\"true\"),sa=\/^true$\/.test(\"true\");var t=null,ua=function(){var a=p(ta);this.o={};this.c={};a=a||[];for(var b=0,c=a.length;b<c;++b)this.c[a[b]]=\"\"},u=function(){if(null===t){t=\"\";try{var a=\"\";try{a=h.top.location.hash}catch(c){a=h.location.hash}if(a){var b=a.match(\/\\bdeid=([\\d,]+)\/);t=b?b[1]:\"\"}}catch(c){}}return t},x=function(a,b,c){var d=w;if(c?d.c.hasOwnProperty(c)&&\"\"==d.c[c]:1){var e;e=(e=u())?(e=e.match(new RegExp(\"\\\\b(\"+a.join(\"|\")+\")\\\\b\")))?e[0]:null:null;if(e)a=e;else a:{if(!(1E-4>Math.random())&&(e=Math.random(),e<b)){try{var f=\nnew Uint32Array(1);h.crypto.getRandomValues(f);e=f[0]\/65536\/65536}catch(g){e=Math.random()}a=a[Math.floor(e*a.length)];break a}a=null}a&&\"\"!=a&&(c?d.c.hasOwnProperty(c)&&(d.c[c]=a):d.o[a]=!0)}},y=function(a){var b=w;return b.c.hasOwnProperty(a)?b.c[a]:\"\"},va=function(){var a=w,b=[];r(a.o,function(a,d){b.push(d)});r(a.c,function(a){\"\"!=a&&b.push(a)});return b};var ta={g:2,h:4,f:8,s:9,j:10,i:11,l:12},A={g:{b:\"376635470\",a:\"376635471\"},h:{b:\"659234980\",a:\"659234981\"},f:{b:\"659238990\",a:\"659238991\"},s:{b:\"19501577\",a:\"19501578\"},j:{b:\"659328990\",a:\"659328991\"},i:{b:\"33826044\",a:\"33826045\"},l:{b:\"659428990\",a:\"659428991\"}},w=null,wa=function(){var a=ia.apply([],ha(p(A),function(a){return p(a)},void 0)),b=fa(u().split(\",\"),function(b){return\"\"!=b&&!(0<=da(a,b))});return 0<b.length?\"&debug_experiment_id=\"+b.join(\",\"):\"\"};var xa=\/^UA-\\d+-\\d+%3A[\\w-]+(?:%2C[\\w-]+)*(?:%3BUA-\\d+-\\d+%3A[\\w-]+(?:%2C[\\w-]+)*)*$\/,ya=\/^[\\w-]+(?:\\.[\\w-]+)*$\/,B=\/^\\d+\\.fls\\.doubleclick\\.net$\/,za=\/;gac=([^;?]+)\/,Aa=\/;gclaw=([^;?]+)\/,C=function(a,b){if(B.test(a.location.host)){if((b=a.location.href.match(Aa))&&2==b.length&&b[1].match(ya))return b[1]}else{var c=(b||\"_gcl\")+\"_aw\";b=[];a=a.cookie.split(\";\");c=new RegExp(\"^\\\\s*\"+c+\"=\\\\s*(.*?)\\\\s*$\");for(var d=0;d<a.length;d++){var e=a[d].match(c);e&&b.push(e[1])}a=[];if(b&&0!=b.length)for(c=0;c<b.length;c++)d=\nb[c].split(\".\"),3==d.length&&\"GCL\"==d[0]&&d[1]&&a.push(d[2]);if(0<a.length)return a.join(\".\")}return\"\"};var Ba=function(a,b,c){a=D(a,!0);if(a[b])return!1;a[b]=[];a[b][0]=c;return!0},D=function(a,b){var c=a.GooglebQhCsO;c||(c={},b&&(a.GooglebQhCsO=c));return c};var E=null,F=null,Ca=function(a){for(var b=[],c=0,d=0;d<a.length;d++){var e=a.charCodeAt(d);255<e&&(b[c++]=e&255,e>>=8);b[c++]=e}if(!E)for(E={},F={},a=0;65>a;a++)E[a]=\"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+\/=\".charAt(a),F[a]=\"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.\".charAt(a);a=F;c=[];for(d=0;d<b.length;d+=3){var f=b[d],g=(e=d+1<b.length)?b[d+1]:0,k=d+2<b.length,m=k?b[d+2]:0,v=f>>2;f=(f&3)<<4|g>>4;g=(g&15)<<2|m>>6;m&=63;k||(m=64,e||(g=64));c.push(a[v],\na[f],a[g],a[m])}return c.join(\"\")};var G=function(a,b,c,d){for(var e=c.length;0<=(b=a.indexOf(c,b))&&b<d;){var f=a.charCodeAt(b-1);if(38==f||63==f)if(f=a.charCodeAt(b+e),!f||61==f||38==f||35==f)return b;b+=e+1}return-1},H=\/#|$\/,I=function(a,b){var c=a.search(H),d=G(a,0,b,c);if(0>d)return null;var e=a.indexOf(\"&\",d);if(0>e||e>c)e=c;d+=b.length+1;return decodeURIComponent(a.substr(d,e-d).replace(\/\\+\/g,\" \"))},Da=\/[?&]($|#)\/,J=function(a,b,c){for(var d=a.search(H),e=0,f,g=[];0<=(f=G(a,e,b,d));)g.push(a.substring(e,f)),e=Math.min(a.indexOf(\"&\",\nf)+1||d,d);g.push(a.substr(e));a=g.join(\"\").replace(Da,\"$1\");c=null!=c?\"=\"+encodeURIComponent(String(c)):\"\";(b+=c)?(c=a.indexOf(\"#\"),0>c&&(c=a.length),d=a.indexOf(\"?\"),0>d||d>c?(d=c,e=\"\"):e=a.substring(d+1,c),c=[a.substr(0,d),e,a.substr(c)],a=c[1],c[1]=b?a?a+\"&\"+b:b:a,b=c[0]+(c[1]?\"?\"+c[1]:\"\")+c[2]):b=a;return b};var K=function(a,b,c,d){var e=I(c,\"fmt\");if(d){var f=I(c,\"random\"),g=I(c,\"label\")||\"\";if(!f)return!1;f=Ca(decodeURIComponent(g.replace(\/\\+\/g,\" \"))+\":\"+decodeURIComponent(f.replace(\/\\+\/g,\" \"))).replace(\/[.]*$\/,\"\");if(!Ba(a,f,d))return!1}e&&4!=e&&(c=J(c,\"rfmt\",e));c=J(c,\"fmt\",4);e=b.createElement(\"script\");e.src=c;e.onload=function(){a.google_noFurtherRedirects&&d&&d.call&&(a.google_noFurtherRedirects=null,d())};b.getElementsByTagName(\"script\")[0].parentElement.appendChild(e);return!0};var L=\"google_conversion_id google_conversion_format google_conversion_type google_conversion_order_id google_conversion_language google_conversion_value google_conversion_evaluemrc google_conversion_currency google_conversion_domain google_conversion_label google_conversion_color google_disable_viewthrough google_enable_display_cookie_match google_remarketing_only google_remarketing_for_search google_conversion_items google_conversion_merchant_id google_user_id google_custom_params google_conversion_date google_conversion_time google_conversion_js_version onload_callback opt_image_generator google_conversion_page_url google_conversion_referrer_url google_gtm google_gcl_cookie_prefix google_read_gcl_cookie_opt_out google_basket_merchant_id google_basket_feed_country google_basket_feed_language google_basket_discount google_basket_transaction_type\".split(\" \"),\nM=function(a){return null!=a?encodeURIComponent(a.toString()):\"\"},N=function(a){if(null!=a){a=a.toString().substring(0,512);var b=a.indexOf(\"#\");return-1==b?a:a.substring(0,b)}return\"\"},O=function(a,b){b=M(b);return\"\"!=b&&(a=M(a),\"\"!=a)?\"&\".concat(a,\"=\",b):\"\"},P=function(a){var b=typeof a;return null==a||\"object\"==b||\"function\"==b?null:String(a).replace(\/,\/g,\"\\\\,\").replace(\/;\/g,\"\\\\;\").replace(\/=\/g,\"\\\\=\")},Ea=function(a){if((a=a.google_custom_params)&&\"object\"==typeof a&&\"function\"!=typeof a.join){var b=\n[];for(g in a)if(Object.prototype.hasOwnProperty.call(a,g)){var c=a[g];if(c&&\"function\"==typeof c.join){for(var d=[],e=0;e<c.length;++e){var f=P(c[e]);null!=f&&d.push(f)}c=0==d.length?null:d.join(\",\")}else c=P(c);(d=P(g))&&null!=c&&b.push(d+\"=\"+c)}var g=b.join(\";\")}else g=\"\";return\"\"==g?\"\":\"&\".concat(\"data=\",encodeURIComponent(g))},Fa=function(a){if(null!=a){a=a.toString();if(2==a.length)return O(\"hl\",a);if(5==a.length)return O(\"hl\",a.substring(0,2))+O(\"gl\",a.substring(3,5))}return\"\"};\nfunction Q(a){return\"number\"!=typeof a&&\"string\"!=typeof a?\"\":M(a.toString())}\nvar Ga=function(a){if(!a)return\"\";a=a.google_conversion_items;if(!a)return\"\";for(var b=[],c=0,d=a.length;c<d;c++){var e=a[c],f=[];e&&(f.push(Q(e.value)),f.push(Q(e.quantity)),f.push(Q(e.item_id)),f.push(Q(e.adwords_grouping)),f.push(Q(e.sku)),b.push(\"(\"+f.join(\"*\")+\")\"))}return 0<b.length?\"&item=\"+b.join(\"\"):\"\"},Ha=function(a,b){if(b.google_read_gcl_cookie_opt_out||b.google_remarketing_only||b.google_conversion_domain)return\"\";var c=\"\";if(b.google_gcl_cookie_prefix&&\/^[a-zA-Z0-9_]+$\/.test(b.google_gcl_cookie_prefix))return c=\nC(a,b.google_gcl_cookie_prefix),O(\"gclaw\",c);(b=C(a))&&(c=O(\"gclaw\",b));if(B.test(a.location.host))var d=(d=a.location.href.match(za))&&2==d.length&&d[1].match(xa)?decodeURIComponent(d[1]):\"\";else{b=[];a=a.cookie.split(\";\");for(var e=\/^\\s*_gac_(UA-\\d+-\\d+)=\\s*(.+?)\\s*$\/,f=0;f<a.length;f++){var g=a[f].match(e);g&&b.push({m:g[1],value:g[2]})}a={};if(b&&b.length)for(e=0;e<b.length;e++)f=b[e].value.split(\".\"),\"1\"==f[0]&&3==f.length&&f[1]&&(a[b[e].m]||(a[b[e].m]=[]),a[b[e].m].push({timestamp:f[1],u:f[2]}));\nb=[];for(d in a){e=[];f=a[d];for(g=0;g<f.length;g++)e.push(f[g].u);b.push(d+\":\"+e.join(\",\"))}d=0<b.length?b.join(\";\"):\"\"}return c+(d?O(\"gac\",d):\"\")},Ia=function(a,b,c){var d=[];if(a){var e=a.screen;e&&(d.push(O(\"u_h\",e.height)),d.push(O(\"u_w\",e.width)),d.push(O(\"u_ah\",e.availHeight)),d.push(O(\"u_aw\",e.availWidth)),d.push(O(\"u_cd\",e.colorDepth)));a.history&&d.push(O(\"u_his\",a.history.length))}c&&\"function\"==typeof c.getTimezoneOffset&&d.push(O(\"u_tz\",-c.getTimezoneOffset()));b&&(\"function\"==typeof b.javaEnabled&&\nd.push(O(\"u_java\",b.javaEnabled())),b.plugins&&d.push(O(\"u_nplug\",b.plugins.length)),b.mimeTypes&&d.push(O(\"u_nmime\",b.mimeTypes.length)));return d.join(\"\")};function Ja(a){a=a?a.title:\"\";if(void 0==a||\"\"==a)return\"\";var b=function(a){try{return decodeURIComponent(a),!0}catch(e){return!1}};a=encodeURIComponent(a);for(var c=256;!b(a.substr(0,c));)c--;return\"&tiba=\"+a.substr(0,c)}\nvar R=function(a,b,c,d){var e=\"\";if(b){if(a.top==a)var f=0;else{var g=a.location.ancestorOrigins;if(g)f=g[g.length-1]==a.location.origin?1:2;else{g=a.top;try{var k;if(k=!!g&&null!=g.location.href)c:{try{q(g.foo);k=!0;break c}catch(m){}k=!1}f=k}catch(m){f=!1}f=f?1:2}}a=c?c:1==f?a.top.location.href:a.location.href;e+=O(\"frm\",f);e+=O(\"url\",N(a));e+=O(\"ref\",N(d||b.referrer))}return e},S=function(a,b){return!(qa||b&&Ka.test(navigator.userAgent))||a&&a.location&&a.location.protocol&&\"https:\"==a.location.protocol.toString().toLowerCase()?\n\"https:\":\"http:\"},T=function(a){return a.google_remarketing_only?\"googleads.g.doubleclick.net\":a.google_conversion_domain||\"www.googleadservices.com\"},Ka=\/Android ([01]\\.|2\\.[01])\/i,U=function(a,b){var c=b.createElement(\"iframe\");c.style.display=\"none\";c.src=S(a,!1)+\"\/\/bid.g.doubleclick.net\/xbbe\/pixel?d=KAE\";b.body.appendChild(c)};function La(){return new Image}\nfunction Ma(a,b,c,d,e){if(c.google_conversion_domain)return!1;if(!c.google_remarketing_only||w&&y(8)===A.f.a||c.google_remarketing_only&&!c.google_conversion_domain&&sa)try{return K(a,b,d,e)}catch(f){}return!1}\nvar V=function(a,b,c,d,e,f){var g=c.opt_image_generator&&c.opt_image_generator.call,k;e&&c.onload_callback&&c.onload_callback.call?k=c.onload_callback:k=function(){};d+=O(\"async\",\"1\");!g&&f&&Ma(a,b,c,d,k)||(a=La,g&&(a=c.opt_image_generator),c=a(),c.src=d,c.onload=k)},Na=function(a,b){for(var c=document.createElement(\"iframe\"),d=[],e=[],f=0;f<b.google_conversion_items.length;f++){var g=b.google_conversion_items[f];g&&g.quantity&&g.sku&&(d.push(g.sku),e.push(g.quantity))}f=\"\";null!=b.google_conversion_language&&\n(g=b.google_conversion_language.toString(),5==g.length&&(f=\"&mrc_language=\"+g.substring(0,2)+\"&mrc_country=\"+g.substring(3,5)));a=S(a,!1)+\"\/\/www.google.com\/ads\/mrc\";c.src=a+\"?sku=\"+d.join(\",\")+\"&qty=\"+e.join(\",\")+\"&oid=\"+b.google_conversion_order_id+\"&mcid=\"+b.google_conversion_merchant_id+f;c.style.width=\"1px\";c.style.height=\"1px\";c.style.display=\"none\";return c},Oa=function(a,b,c){var d=function(){c.documentElement.appendChild(Na(a,b))};\"complete\"===c.readyState?d():a.addEventListener?a.addEventListener(\"load\",\nd):a.attachEvent(\"onload\",d)},Pa=function(a,b){w&&y(2)==A.g.a&&(\"complete\"===b.readyState?U(a,b):a.addEventListener?a.addEventListener(\"load\",function(){U(a,b)}):a.attachEvent(\"onload\",function(){U(a,b)}))},Qa=function(a){return!!a.google_conversion_merchant_id&&!!a.google_conversion_order_id&&!!a.google_conversion_items},Ra=function(a,b){for(var c={},d=function(d){c[d]=b&&null!=b[d]?b[d]:a[d]},e=0;e<L.length;e++)d(L[e]);d(\"onload_callback\");return c};var Sa=function(a,b,c){for(var d=c.length+1,e=function(){--d;if(0>=d){var c=D(a,!1),e=c[b];e&&(delete c[b],(c=e[0])&&c.call&&c())}},f=function(a,b){var c=new Image;c.onload=a;c.src=b},g=0;g<c.length;g++){var k=c[g],m=I(k,\"fmt\");switch(parseInt(m,10)){case 1:case 2:(m=a.document.getElementById(\"goog_conv_iframe\"))&&!m.src?(m.onload=e,m.src=k):f(e,k);break;case 4:K(a,a.document,k,e);break;default:f(e,k)}}e()},W=[\"GooglemKTybQhCsO\"],X=h;W[0]in X||!X.execScript||X.execScript(\"var \"+W[0]);\nfor(var Y;W.length&&(Y=W.shift());){var Z;if(Z=!W.length)Z=void 0!==Sa;Z?X[Y]=Sa:X[Y]&&X[Y]!==Object.prototype[Y]?X=X[Y]:X=X[Y]={}}\nwindow.google_trackConversion=function(a){var b=window;var c=navigator,d=document;a=Ra(b,a);a.google_conversion_format=3;var e=!1;if(a&&3==a.google_conversion_format){try{if(\"landing\"==a.google_conversion_type||!a.google_conversion_id||a.google_remarketing_only&&a.google_disable_viewthrough)var f=!1;else a.google_conversion_date=new Date,a.google_conversion_time=a.google_conversion_date.getTime(),a.google_conversion_snippets=\"number\"==typeof a.google_conversion_snippets&&0<a.google_conversion_snippets?\na.google_conversion_snippets+1:1,\"number\"!=typeof a.google_conversion_first_time&&(a.google_conversion_first_time=a.google_conversion_time),a.google_conversion_js_version=\"8\",0!=a.google_conversion_format&&1!=a.google_conversion_format&&2!=a.google_conversion_format&&3!=a.google_conversion_format&&(a.google_conversion_format=3),!1!==a.google_enable_display_cookie_match&&(a.google_enable_display_cookie_match=!0),w=new ua,ra&&(a.google_remarketing_for_search=!1),f=!0;if(f){a.google_remarketing_only&&\na.google_enable_display_cookie_match&&w&&x([A.g.b,A.g.a],ja,2);a.google_remarketing_only||a.google_conversion_domain||(w&&x([A.j.b,A.j.a],pa,10),w&&x([A.l.b,A.l.a],oa,12));a.google_remarketing_only&&!a.google_conversion_domain&&(w&&x([A.f.b,A.f.a],la,8),w&&x([A.f.a],ma,8));f=\"\/?\";\"landing\"==a.google_conversion_type&&(f=\"\/extclk?\");var g=[a.google_remarketing_only?\"\/pagead\/viewthroughconversion\/\":\"\/pagead\/conversion\/\",M(a.google_conversion_id),f,\"random=\",M(a.google_conversion_time)].join(\"\"),k,m=\nT(a);g=k=S(b,\/www[.]googleadservices[.]com\/i.test(m))+\"\/\/\"+m+g;var v=[O(\"cv\",a.google_conversion_js_version),O(\"fst\",a.google_conversion_first_time),O(\"num\",a.google_conversion_snippets),O(\"fmt\",a.google_conversion_format),O(\"userId\",a.google_user_id),O(\"value\",a.google_conversion_value),O(\"evaluemrc\",a.google_conversion_evaluemrc),O(\"currency_code\",a.google_conversion_currency),O(\"label\",a.google_conversion_label),O(\"oid\",a.google_conversion_order_id),O(\"bg\",a.google_conversion_color),Fa(a.google_conversion_language),\nO(\"guid\",\"ON\"),O(\"disvt\",a.google_disable_viewthrough),O(\"eid\",va().join()),Ia(b,c,a.google_conversion_date),Ea(a),O(\"gtm\",a.google_gtm),Ha(d,a),R(b,d,a.google_conversion_page_url,a.google_conversion_referrer_url),a.google_remarketing_for_search&&!a.google_conversion_domain?\"&srr=n\":\"\",Ja(d)].join(\"\")+wa();if(a.google_remarketing_only||a.google_conversion_domain)var ba=v;else{Qa(a)&&!a.google_basket_transaction_type&&(a.google_basket_transaction_type=\"mrc\");var ca=[v,[O(\"mid\",a.google_basket_merchant_id),\nO(\"fcntr\",a.google_basket_feed_country),O(\"flng\",a.google_basket_feed_language),O(\"dscnt\",a.google_basket_discount),O(\"bttype\",a.google_basket_transaction_type)].join(\"\"),Ga(a)].join(\"\");ba=2E3<ca.length?[v,O(\"item\",\"elngth\")].join(\"\"):ca}V(b,d,a,g+ba,!0,!0);w&&x([A.h.b,A.h.a],ka,4);if(w&&y(4)==A.h.a){var Ta=Math.floor(1E9*Math.random()),z=S(b,!1)+\"\/\/pagead2.googlesyndication.com\/pagead\/gen_204?id=beacon-api-web-survey&type=gen204Type\";z+=O(\"random\",Ta);z+=O(\"time\",aa());if(b.navigator&&b.navigator.sendBeacon){try{var ea=\nz.replace(\"gen204Type\",\"send-beacon\");ea+=O(\"async\",\"1\");b.navigator.sendBeacon(ea,\"\")}catch(Ua){}var Va=z.replace(\"gen204Type\",\"img\");V(b,d,a,Va,!1,!1)}else{var Wa=z.replace(\"gen204Type\",\"beacon-undefined\");V(b,d,a,Wa,!1,!1)}}if(a.google_remarketing_for_search&&!a.google_conversion_domain){var Xa=Math.floor(1E9*Math.random()),Ya=[M(a.google_conversion_id),\"\/?random=\",Xa].join(\"\"),Za=S(b,!1)+\"\/\/www.google.com\/ads\/user-lists\/\"+Ya;c=Za;var $a=[O(\"label\",a.google_conversion_label),O(\"fmt\",\"3\"),R(b,d,\na.google_conversion_page_url,a.google_conversion_referrer_url)].join(\"\");V(b,d,a,c+$a,!1,!1)}-1!=T(a).indexOf(\"googletraveladservices.com\")&&w&&x([A.i.b,A.i.a],na,11);a.google_remarketing_only&&a.google_enable_display_cookie_match&&Pa(b,d);e=!0}Qa(a)&&(Oa(b,a,d),e=!0)}catch(Ua){}b=e}else b=!1;return b};}).call(this);\n";
    s.className = 'utils-script';
    document.head.appendChild(s);
    setTimeout(function() {
        window.dispatchEvent && window.dispatchEvent(new CustomEvent("onPartnersLoad"));
        ;
    }, 0);
})();
!function() {
    function t(t, e) {
        e = e || {
            bubbles: !1,
            cancelable: !1,
            detail: void 0
        };
        var n = document.createEvent("CustomEvent");
        return n.initCustomEvent(t, e.bubbles, e.cancelable, e.detail), n
    }
    return "function" == typeof window.CustomEvent ? !1 : (t.prototype = window.Event.prototype, void (window.CustomEvent = t))
}();

