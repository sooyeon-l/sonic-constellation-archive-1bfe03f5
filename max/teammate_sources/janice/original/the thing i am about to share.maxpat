{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 3,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 285.0, 99.0, 1151.0, 678.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 631.0345158576965, 151.0, 75.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 745.1613231897354, 149.46237218379974, 100.0, 22.0 ],
                    "text": "peakamp~ 5"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 458.5, 364.5161451101303, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 577.4193803071976, 303.0, 31.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 458.5, 303.0, 48.0, 22.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 467.25, 261.0, 36.0, 22.0 ],
                    "text": "< 0.1"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 484.5, 222.0, 29.5, 22.0 ],
                    "text": "f 3"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 1001.0, 303.0, 48.0, 22.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1206.0, 262.0, 150.0, 20.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1001.0, 261.0, 42.0, 22.0 ],
                    "text": "> 0.05"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 994.0, 209.0, 29.5, 22.0 ],
                    "text": "f 3"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 994.0, 151.0, 75.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1154.0, 317.0, 100.0, 22.0 ],
                    "text": "peakamp~ 1"
                }
            },
            {
                "box": {
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "Macintosh HD:/Users/janjan/Music/Music/Media.localized/Music/snxhiug/Unknown Album/Vacation On My Mind.mp3",
                                "filename": "Vacation On My Mind.mp3",
                                "filekind": "audiofile",
                                "id": "u758009851",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            }
                        ]
                    },
                    "id": "obj-10",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 984.0, 56.0, 150.0, 30.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1113.0, 342.0, 31.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "id": "obj-147",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 1041.0, 565.0, 29.5, 22.0 ],
                    "text": "t i i"
                }
            },
            {
                "box": {
                    "id": "obj-148",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1041.0, 520.0, 32.0, 22.0 ],
                    "text": "+ 36"
                }
            },
            {
                "box": {
                    "id": "obj-149",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1007.5269261598587, 380.6451780796051, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-150",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1041.0, 465.0, 66.0, 22.0 ],
                    "text": "random 61"
                }
            },
            {
                "box": {
                    "id": "obj-151",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1097.0, 1256.0, 136.0, 47.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[3]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[3]"
                }
            },
            {
                "box": {
                    "id": "obj-152",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1449.0, 1008.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 41.243469593372815, 0.06814809163411459, 0, 192.66191652987894, 0.5866666348775228, 0, 485.18212806503686, 1.0, 0, 836.2128238801379, 1.0, 0, 975.9999999999982, 0.0, 0 ],
                    "classic_curve": 1,
                    "domain": 976.0,
                    "id": "obj-153",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1435.0, 960.0, 59.91305589675903, 40.21739053726196 ]
                }
            },
            {
                "box": {
                    "id": "obj-154",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1266.0, 1002.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 41.243469593372815, 0.06814809163411459, 0, 658.6836926514897, 0.07999958938596949, 0, 971.3853579176252, 0.790370348294576, 0 ],
                    "classic_curve": 1,
                    "domain": 976.0,
                    "id": "obj-155",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1252.0, 947.0, 64.13043355941772, 46.73912954330444 ]
                }
            },
            {
                "box": {
                    "id": "obj-156",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1172.0, 999.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 41.243469593372815, 0.06814809163411459, 0, 192.66191652987894, 0.5866666348775228, 0, 483.63133729850364, 1.0, 0, 699.3046809921025, 1.0, 0, 971.3853579176252, 0.790370348294576, 0 ],
                    "classic_curve": 1,
                    "domain": 976.0,
                    "id": "obj-157",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1154.0, 949.0, 66.30434656143188, 41.55073952674866 ]
                }
            },
            {
                "box": {
                    "id": "obj-158",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1082.0, 995.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 41.243469593372815, 0.06814809163411459, 0, 392.465281875518, 0.0, 0, 582.0236372237508, 0.47555551846822103, 0, 975.9999999999982, 0.0, 0 ],
                    "classic_curve": 1,
                    "domain": 976.0,
                    "id": "obj-159",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1066.0, 940.0, 74.99999856948853, 45.65217304229736 ]
                }
            },
            {
                "box": {
                    "id": "obj-160",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 995.0, 988.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 41.243469593372815, 0.06814809163411459, 0, 192.66191652987894, 0.5866666348775228, 0, 531.5508215782492, 1.0, 0, 971.3853579176252, 0.790370348294576, 0 ],
                    "classic_curve": 1,
                    "domain": 976.0,
                    "id": "obj-161",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 984.0, 940.0, 64.13043355941772, 36.95652103424072 ]
                }
            },
            {
                "box": {
                    "id": "obj-162",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1291.0, 1031.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-163",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1197.0, 1027.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-164",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1120.0, 1020.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-165",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 954.0, 1029.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-166",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1047.0, 1034.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-167",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1599.0, 863.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-168",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1599.0, 892.0, 81.0, 22.0 ],
                    "text": "setdomain $1"
                }
            },
            {
                "box": {
                    "id": "obj-169",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1562.0, 867.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-170",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1583.0, 1033.0, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 41.243469593372865, 0.06814809163411459, 0, 192.66191652987894, 0.5866666348775228, 0, 531.5508215782492, 1.0, 0, 582.0236372237508, 0.47555551846822103, 0, 975.9999999999965, 0.0, 0 ],
                    "classic_curve": 1,
                    "domain": 976.0,
                    "id": "obj-171",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1562.0, 967.0, 97.05801212787628, 46.246344566345215 ]
                }
            },
            {
                "box": {
                    "id": "obj-172",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1116.0, 1120.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-173",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1350.0, 688.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-174",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1478.0, 867.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-175",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1322.0, 879.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-176",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1225.0, 868.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-177",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1093.0, 861.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-178",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 991.0, 861.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-179",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1409.0, 736.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-180",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1297.0, 731.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-181",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1191.0, 736.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-182",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1066.0, 731.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-183",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1179.0, 765.0, 29.5, 22.0 ],
                    "text": "* 3."
                }
            },
            {
                "box": {
                    "id": "obj-184",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1400.0, 770.0, 29.5, 22.0 ],
                    "text": "* 5."
                }
            },
            {
                "box": {
                    "id": "obj-185",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1284.0, 765.0, 29.5, 22.0 ],
                    "text": "* 4."
                }
            },
            {
                "box": {
                    "id": "obj-186",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1057.0, 761.0, 29.5, 22.0 ],
                    "text": "* 2."
                }
            },
            {
                "box": {
                    "id": "obj-187",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1400.0, 886.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-188",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1273.5, 892.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-189",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1188.0, 899.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-190",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1061.0, 886.0, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-191",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 941.0, 906.0, 29.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-192",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1391.0, 838.0, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-193",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1066.0, 838.0, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-194",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 972.0, 838.0, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-195",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1011.0, 727.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-196",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1011.0, 695.0, 34.0, 22.0 ],
                    "text": "mtof"
                }
            },
            {
                "box": {
                    "id": "obj-197",
                    "maxclass": "kslider",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1034.0, 615.0, 336.0, 53.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-198",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1282.0, 838.0, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-199",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 840.350869178772, 1445.6140213012695, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-200",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1191.0, 838.0, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-135",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 1548.33329641819, 456.0, 100.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 359.0, 1003.0, 100.0, 40.0 ],
                    "preset_data": [
                        {
                            "number": 1,
                            "data": [ 5, "obj-89", "kslider", "int", 40, 5, "obj-94", "number", "float", 82.40689086914062, 5, "obj-109", "number", "float", 6.190000057220459, 5, "obj-110", "number", "float", -1.899999976158142, 5, "obj-111", "number", "float", 4.679999828338623, 5, "obj-112", "number", "float", 1.75, 5, "obj-113", "number", "float", 0.07599999755620956, 5, "obj-114", "number", "float", 6.429999828338623, 5, "obj-115", "number", "float", 20.0, 5, "obj-116", "number", "float", 0.6470000147819519, 5, "obj-117", "number", "float", 6.739999771118164, 5, "obj-3", "number", "float", 105.0, 4, "obj-29", "function", "clear", 7, "obj-29", "function", "add", 16.94531896203126, 0.06814809163411459, 0, 7, "obj-29", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-29", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-29", "function", "add", 239.13061324459463, 0.47555551846822103, 0, 7, "obj-29", "function", "add", 400.9999999999998, 0.0, 0, 5, "obj-29", "function", "domain", 401.0, 6, "obj-29", "function", "range", 0.0, 1.0, 5, "obj-29", "function", "mode", 0, 5, "obj-40", "number", "int", 401, 4, "obj-47", "function", "clear", 7, "obj-47", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-47", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-47", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-47", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-47", "function", "domain", 401.0, 6, "obj-47", "function", "range", 0.0, 1.0, 5, "obj-47", "function", "mode", 0, 4, "obj-49", "function", "clear", 7, "obj-49", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-49", "function", "add", 92.43207195294255, 1.0, 0, 7, "obj-49", "function", "add", 239.13061324459463, 0.47555551846822103, 0, 7, "obj-49", "function", "add", 375.5396910668863, 1.0, 0, 7, "obj-49", "function", "add", 401.0, 0.0, 0, 5, "obj-49", "function", "domain", 401.0, 6, "obj-49", "function", "range", 0.0, 1.0, 5, "obj-49", "function", "mode", 0, 4, "obj-51", "function", "clear", 7, "obj-51", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-51", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-51", "function", "add", 147.87365906869186, 0.31698646532994873, 0, 7, "obj-51", "function", "add", 302.94411904510866, 0.07530542180102624, 0, 7, "obj-51", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-51", "function", "domain", 401.0, 6, "obj-51", "function", "range", 0.0, 1.0, 5, "obj-51", "function", "mode", 0, 4, "obj-53", "function", "clear", 7, "obj-53", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-53", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-53", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-53", "function", "domain", 401.0, 6, "obj-53", "function", "range", 0.0, 1.0, 5, "obj-53", "function", "mode", 0, 4, "obj-55", "function", "clear", 7, "obj-55", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-55", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-55", "function", "add", 343.5669491556715, 1.0, 0, 7, "obj-55", "function", "add", 401.0, 0.0, 0, 5, "obj-55", "function", "domain", 401.0, 6, "obj-55", "function", "range", 0.0, 1.0, 5, "obj-55", "function", "mode", 0, 5, "obj-79", "live.gain~", "float", -27.19951057434082 ]
                        },
                        {
                            "number": 2,
                            "data": [ 5, "obj-89", "kslider", "int", 64, 5, "obj-94", "number", "float", 329.6275634765625, 5, "obj-109", "number", "float", 6.190000057220459, 5, "obj-110", "number", "float", -1.899999976158142, 5, "obj-111", "number", "float", 4.679999828338623, 5, "obj-112", "number", "float", 1.75, 5, "obj-113", "number", "float", 0.07599999755620956, 5, "obj-114", "number", "float", 6.429999828338623, 5, "obj-115", "number", "float", 20.0, 5, "obj-116", "number", "float", 0.6470000147819519, 5, "obj-117", "number", "float", 6.739999771118164, 5, "obj-3", "number", "float", 38.0, 4, "obj-29", "function", "clear", 7, "obj-29", "function", "add", 16.94531896203126, 0.06814809163411459, 0, 7, "obj-29", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-29", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-29", "function", "add", 239.13061324459463, 0.47555551846822103, 0, 7, "obj-29", "function", "add", 400.9999999999998, 0.0, 0, 5, "obj-29", "function", "domain", 401.0, 6, "obj-29", "function", "range", 0.0, 1.0, 5, "obj-29", "function", "mode", 0, 5, "obj-40", "number", "int", 401, 4, "obj-47", "function", "clear", 7, "obj-47", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-47", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-47", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-47", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-47", "function", "domain", 401.0, 6, "obj-47", "function", "range", 0.0, 1.0, 5, "obj-47", "function", "mode", 0, 4, "obj-49", "function", "clear", 7, "obj-49", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-49", "function", "add", 92.43207195294255, 1.0, 0, 7, "obj-49", "function", "add", 239.13061324459463, 0.47555551846822103, 0, 7, "obj-49", "function", "add", 375.5396910668863, 1.0, 0, 7, "obj-49", "function", "add", 401.0, 0.0, 0, 5, "obj-49", "function", "domain", 401.0, 6, "obj-49", "function", "range", 0.0, 1.0, 5, "obj-49", "function", "mode", 0, 4, "obj-51", "function", "clear", 7, "obj-51", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-51", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-51", "function", "add", 147.87365906869186, 0.31698646532994873, 0, 7, "obj-51", "function", "add", 302.94411904510866, 0.07530542180102624, 0, 7, "obj-51", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-51", "function", "domain", 401.0, 6, "obj-51", "function", "range", 0.0, 1.0, 5, "obj-51", "function", "mode", 0, 4, "obj-53", "function", "clear", 7, "obj-53", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-53", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-53", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-53", "function", "domain", 401.0, 6, "obj-53", "function", "range", 0.0, 1.0, 5, "obj-53", "function", "mode", 0, 4, "obj-55", "function", "clear", 7, "obj-55", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-55", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-55", "function", "add", 343.5669491556715, 1.0, 0, 7, "obj-55", "function", "add", 401.0, 0.0, 0, 5, "obj-55", "function", "domain", 401.0, 6, "obj-55", "function", "range", 0.0, 1.0, 5, "obj-55", "function", "mode", 0, 5, "obj-79", "live.gain~", "float", -27.19951057434082 ]
                        },
                        {
                            "number": 3,
                            "data": [ 5, "obj-89", "kslider", "int", 64, 5, "obj-94", "number", "float", 329.6275634765625, 5, "obj-109", "number", "float", 6.190000057220459, 5, "obj-110", "number", "float", -1.899999976158142, 5, "obj-111", "number", "float", 4.679999828338623, 5, "obj-112", "number", "float", 1.75, 5, "obj-113", "number", "float", 0.07599999755620956, 5, "obj-114", "number", "float", 6.429999828338623, 5, "obj-115", "number", "float", 20.0, 5, "obj-116", "number", "float", 0.6470000147819519, 5, "obj-117", "number", "float", 6.739999771118164, 5, "obj-3", "number", "float", 38.0, 4, "obj-29", "function", "clear", 7, "obj-29", "function", "add", 16.94531896203126, 0.06814809163411459, 0, 7, "obj-29", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-29", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-29", "function", "add", 239.13061324459463, 0.47555551846822103, 0, 7, "obj-29", "function", "add", 248.57904621064384, 0.27688056870493477, 0, 7, "obj-29", "function", "add", 400.9999999999998, 0.0, 0, 5, "obj-29", "function", "domain", 401.0, 6, "obj-29", "function", "range", 0.0, 1.0, 5, "obj-29", "function", "mode", 0, 5, "obj-40", "number", "int", 401, 4, "obj-47", "function", "clear", 7, "obj-47", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-47", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-47", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-47", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-47", "function", "domain", 401.0, 6, "obj-47", "function", "range", 0.0, 1.0, 5, "obj-47", "function", "mode", 0, 4, "obj-49", "function", "clear", 7, "obj-49", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-49", "function", "add", 92.43207195294255, 1.0, 0, 7, "obj-49", "function", "add", 239.13061324459463, 0.47555551846822103, 0, 7, "obj-49", "function", "add", 375.5396910668863, 1.0, 0, 7, "obj-49", "function", "add", 401.0, 0.0, 0, 5, "obj-49", "function", "domain", 401.0, 6, "obj-49", "function", "range", 0.0, 1.0, 5, "obj-49", "function", "mode", 0, 4, "obj-51", "function", "clear", 7, "obj-51", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-51", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-51", "function", "add", 147.87365906869186, 0.31698646532994873, 0, 7, "obj-51", "function", "add", 302.94411904510866, 0.07530542180102624, 0, 7, "obj-51", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-51", "function", "domain", 401.0, 6, "obj-51", "function", "range", 0.0, 1.0, 5, "obj-51", "function", "mode", 0, 4, "obj-53", "function", "clear", 7, "obj-53", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-53", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-53", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-53", "function", "domain", 401.0, 6, "obj-53", "function", "range", 0.0, 1.0, 5, "obj-53", "function", "mode", 0, 4, "obj-55", "function", "clear", 7, "obj-55", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-55", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-55", "function", "add", 343.5669491556715, 1.0, 0, 7, "obj-55", "function", "add", 401.0, 0.0, 0, 5, "obj-55", "function", "domain", 401.0, 6, "obj-55", "function", "range", 0.0, 1.0, 5, "obj-55", "function", "mode", 0, 5, "obj-79", "live.gain~", "float", -27.19951057434082, 5, "obj-197", "kslider", "int", 54, 5, "obj-195", "number", "float", 184.99720764160156, 5, "obj-182", "number", "float", 12.5, 5, "obj-181", "number", "float", -5.699999809265137, 5, "obj-180", "number", "float", 4.300000190734863, 5, "obj-179", "number", "float", 3.0999999046325684, 5, "obj-178", "number", "float", -0.8500000238418579, 5, "obj-177", "number", "float", -0.27000001072883606, 5, "obj-176", "number", "float", 2.5999999046325684, 5, "obj-175", "number", "float", 1.2799999713897705, 5, "obj-174", "number", "float", 20.299999237060547, 5, "obj-173", "number", "float", 36.0, 4, "obj-171", "function", "clear", 7, "obj-171", "function", "add", 41.243469593372865, 0.06814809163411459, 0, 7, "obj-171", "function", "add", 192.66191652987894, 0.5866666348775228, 0, 7, "obj-171", "function", "add", 531.5508215782492, 1.0, 0, 7, "obj-171", "function", "add", 582.0236372237508, 0.47555551846822103, 0, 7, "obj-171", "function", "add", 975.9999999999965, 0.0, 0, 5, "obj-171", "function", "domain", 976.0, 6, "obj-171", "function", "range", 0.0, 1.0, 5, "obj-171", "function", "mode", 0, 5, "obj-167", "number", "int", 976, 4, "obj-161", "function", "clear", 7, "obj-161", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-161", "function", "add", 192.66191652987894, 0.5866666348775228, 0, 7, "obj-161", "function", "add", 531.5508215782492, 1.0, 0, 7, "obj-161", "function", "add", 971.3853579176252, 0.790370348294576, 0, 5, "obj-161", "function", "domain", 976.0, 6, "obj-161", "function", "range", 0.0, 1.0, 5, "obj-161", "function", "mode", 0, 4, "obj-159", "function", "clear", 7, "obj-159", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-159", "function", "add", 392.465281875518, 0.0, 0, 7, "obj-159", "function", "add", 582.0236372237508, 0.47555551846822103, 0, 7, "obj-159", "function", "add", 975.9999999999982, 0.0, 0, 5, "obj-159", "function", "domain", 976.0, 6, "obj-159", "function", "range", 0.0, 1.0, 5, "obj-159", "function", "mode", 0, 4, "obj-157", "function", "clear", 7, "obj-157", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-157", "function", "add", 192.66191652987894, 0.5866666348775228, 0, 7, "obj-157", "function", "add", 483.63133729850364, 1.0, 0, 7, "obj-157", "function", "add", 699.3046809921025, 1.0, 0, 7, "obj-157", "function", "add", 971.3853579176252, 0.790370348294576, 0, 5, "obj-157", "function", "domain", 976.0, 6, "obj-157", "function", "range", 0.0, 1.0, 5, "obj-157", "function", "mode", 0, 4, "obj-155", "function", "clear", 7, "obj-155", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-155", "function", "add", 658.6836926514897, 0.07999958938596949, 0, 7, "obj-155", "function", "add", 971.3853579176252, 0.790370348294576, 0, 5, "obj-155", "function", "domain", 976.0, 6, "obj-155", "function", "range", 0.0, 1.0, 5, "obj-155", "function", "mode", 0, 4, "obj-153", "function", "clear", 7, "obj-153", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-153", "function", "add", 192.66191652987894, 0.5866666348775228, 0, 7, "obj-153", "function", "add", 485.18212806503686, 1.0, 0, 7, "obj-153", "function", "add", 836.2128238801379, 1.0, 0, 7, "obj-153", "function", "add", 975.9999999999982, 0.0, 0, 5, "obj-153", "function", "domain", 976.0, 6, "obj-153", "function", "range", 0.0, 1.0, 5, "obj-153", "function", "mode", 0, 5, "obj-151", "live.gain~", "float", -13.877348899841309 ]
                        },
                        {
                            "number": 4,
                            "data": [ 5, "obj-89", "kslider", "int", 89, 5, "obj-94", "number", "float", 1396.9129638671875, 5, "obj-109", "number", "float", -9.899999618530273, 5, "obj-110", "number", "float", -1.899999976158142, 5, "obj-111", "number", "float", 5.730000019073486, 5, "obj-112", "number", "float", 1.75, 5, "obj-113", "number", "float", 0.07599999755620956, 5, "obj-114", "number", "float", 6.429999828338623, 5, "obj-115", "number", "float", 20.0, 5, "obj-116", "number", "float", 0.6470000147819519, 5, "obj-117", "number", "float", 6.739999771118164, 5, "obj-3", "number", "float", 52.0, 4, "obj-29", "function", "clear", 7, "obj-29", "function", "add", 16.94531896203126, 0.06814809163411459, 0, 7, "obj-29", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-29", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-29", "function", "add", 239.13061324459463, 0.47555551846822103, 0, 7, "obj-29", "function", "add", 400.9999999999998, 0.0, 0, 5, "obj-29", "function", "domain", 401.0, 6, "obj-29", "function", "range", 0.0, 1.0, 5, "obj-29", "function", "mode", 0, 5, "obj-40", "number", "int", 401, 4, "obj-47", "function", "clear", 7, "obj-47", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-47", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-47", "function", "add", 218.3933191115554, 1.0, 0, 7, "obj-47", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-47", "function", "domain", 401.0, 6, "obj-47", "function", "range", 0.0, 1.0, 5, "obj-47", "function", "mode", 0, 4, "obj-49", "function", "clear", 7, "obj-49", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-49", "function", "add", 92.43207195294255, 1.0, 0, 7, "obj-49", "function", "add", 239.13061324459463, 0.47555551846822103, 0, 7, "obj-49", "function", "add", 375.5396910668863, 1.0, 0, 7, "obj-49", "function", "add", 401.0, 0.0, 0, 5, "obj-49", "function", "domain", 401.0, 6, "obj-49", "function", "range", 0.0, 1.0, 5, "obj-49", "function", "mode", 0, 4, "obj-51", "function", "clear", 7, "obj-51", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-51", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-51", "function", "add", 147.87365906869186, 0.31698646532994873, 0, 7, "obj-51", "function", "add", 302.94411904510866, 0.07530542180102624, 0, 7, "obj-51", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-51", "function", "domain", 401.0, 6, "obj-51", "function", "range", 0.0, 1.0, 5, "obj-51", "function", "mode", 0, 4, "obj-53", "function", "clear", 7, "obj-53", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-53", "function", "add", 247.5504295509692, 0.0, 0, 7, "obj-53", "function", "add", 399.1040251280408, 0.790370348294576, 0, 5, "obj-53", "function", "domain", 401.0, 6, "obj-53", "function", "range", 0.0, 1.0, 5, "obj-53", "function", "mode", 0, 4, "obj-55", "function", "clear", 7, "obj-55", "function", "add", 16.94531896203125, 0.06814809163411459, 0, 7, "obj-55", "function", "add", 79.15720136114899, 0.5866666348775228, 0, 7, "obj-55", "function", "add", 343.5669491556715, 1.0, 0, 7, "obj-55", "function", "add", 401.0, 0.0, 0, 5, "obj-55", "function", "domain", 401.0, 6, "obj-55", "function", "range", 0.0, 1.0, 5, "obj-55", "function", "mode", 0, 5, "obj-79", "live.gain~", "float", -27.19951057434082, 5, "obj-197", "kslider", "int", 56, 5, "obj-195", "number", "float", 207.65234375, 5, "obj-182", "number", "float", 12.5, 5, "obj-181", "number", "float", -5.699999809265137, 5, "obj-180", "number", "float", 4.300000190734863, 5, "obj-179", "number", "float", 3.0999999046325684, 5, "obj-178", "number", "float", -0.8500000238418579, 5, "obj-177", "number", "float", -0.27000001072883606, 5, "obj-176", "number", "float", 2.5999999046325684, 5, "obj-175", "number", "float", 1.2799999713897705, 5, "obj-174", "number", "float", 20.299999237060547, 5, "obj-173", "number", "float", 30.0, 4, "obj-171", "function", "clear", 7, "obj-171", "function", "add", 41.243469593372865, 0.06814809163411459, 0, 7, "obj-171", "function", "add", 192.66191652987894, 0.5866666348775228, 0, 7, "obj-171", "function", "add", 531.5508215782492, 1.0, 0, 7, "obj-171", "function", "add", 582.0236372237508, 0.47555551846822103, 0, 7, "obj-171", "function", "add", 975.9999999999965, 0.0, 0, 5, "obj-171", "function", "domain", 976.0, 6, "obj-171", "function", "range", 0.0, 1.0, 5, "obj-171", "function", "mode", 0, 5, "obj-167", "number", "int", 976, 4, "obj-161", "function", "clear", 7, "obj-161", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-161", "function", "add", 192.66191652987894, 0.5866666348775228, 0, 7, "obj-161", "function", "add", 531.5508215782492, 1.0, 0, 7, "obj-161", "function", "add", 971.3853579176252, 0.790370348294576, 0, 5, "obj-161", "function", "domain", 976.0, 6, "obj-161", "function", "range", 0.0, 1.0, 5, "obj-161", "function", "mode", 0, 4, "obj-159", "function", "clear", 7, "obj-159", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-159", "function", "add", 392.465281875518, 0.0, 0, 7, "obj-159", "function", "add", 582.0236372237508, 0.47555551846822103, 0, 7, "obj-159", "function", "add", 975.9999999999982, 0.0, 0, 5, "obj-159", "function", "domain", 976.0, 6, "obj-159", "function", "range", 0.0, 1.0, 5, "obj-159", "function", "mode", 0, 4, "obj-157", "function", "clear", 7, "obj-157", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-157", "function", "add", 192.66191652987894, 0.5866666348775228, 0, 7, "obj-157", "function", "add", 483.63133729850364, 1.0, 0, 7, "obj-157", "function", "add", 699.3046809921025, 1.0, 0, 7, "obj-157", "function", "add", 971.3853579176252, 0.790370348294576, 0, 5, "obj-157", "function", "domain", 976.0, 6, "obj-157", "function", "range", 0.0, 1.0, 5, "obj-157", "function", "mode", 0, 4, "obj-155", "function", "clear", 7, "obj-155", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-155", "function", "add", 658.6836926514897, 0.07999958938596949, 0, 7, "obj-155", "function", "add", 971.3853579176252, 0.790370348294576, 0, 5, "obj-155", "function", "domain", 976.0, 6, "obj-155", "function", "range", 0.0, 1.0, 5, "obj-155", "function", "mode", 0, 4, "obj-153", "function", "clear", 7, "obj-153", "function", "add", 41.243469593372815, 0.06814809163411459, 0, 7, "obj-153", "function", "add", 192.66191652987894, 0.5866666348775228, 0, 7, "obj-153", "function", "add", 485.18212806503686, 1.0, 0, 7, "obj-153", "function", "add", 836.2128238801379, 1.0, 0, 7, "obj-153", "function", "add", 975.9999999999982, 0.0, 0, 5, "obj-153", "function", "domain", 976.0, 6, "obj-153", "function", "range", 0.0, 1.0, 5, "obj-153", "function", "mode", 0, 5, "obj-151", "live.gain~", "float", -24.83713722229004, 5, "obj-10", "playlist~", "preset_count", 1, 7, "obj-10", "playlist~", "preset_clipstate", 1, "filekind", "audiofile", 7, "obj-10", "playlist~", "preset_clipstate", 1, "absolutepath", "Macintosh HD:/Users/janjan/Music/Music/Media.localized/Music/snxhiug/Unknown Album/Vacation On My Mind.mp3", 7, "obj-10", "playlist~", "preset_clipstate", 1, "filename", "Vacation On My Mind.mp3", 7, "obj-10", "playlist~", "preset_clipstate", 1, "loop", 1, 8, "obj-10", "playlist~", "preset_clipstate", 1, "selection", -1.0, -1.0, 7, "obj-10", "playlist~", "preset_clipstate", 1, "id", "u758009851", 7, "obj-10", "playlist~", "preset_content", 1, "loop", 1, 4, "obj-10", "playlist~", "preset_execute" ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-133",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 463.0, 559.0, 29.5, 22.0 ],
                    "text": "t i i"
                }
            },
            {
                "box": {
                    "id": "obj-132",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 459.0, 511.0, 32.0, 22.0 ],
                    "text": "+ 36"
                }
            },
            {
                "box": {
                    "id": "obj-129",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 459.0, 459.0, 66.0, 22.0 ],
                    "text": "random 61"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 612.0689976215363, 1303.4483442306519, 136.0, 47.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 601.7241694927216, 1024.137984752655, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 16.94531896203125, 0.06814809163411459, 0, 79.15720136114899, 0.5866666348775228, 0, 343.5669491556715, 1.0, 0, 401.0, 0.0, 0 ],
                    "classic_curve": 1,
                    "domain": 401.0,
                    "id": "obj-55",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 587.9310653209686, 977.5862581729889, 59.91305589675903, 40.21739053726196 ]
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 493.10347414016724, 1024.137984752655, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 16.94531896203125, 0.06814809163411459, 0, 247.5504295509692, 0.0, 0, 399.1040251280408, 0.790370348294576, 0 ],
                    "classic_curve": 1,
                    "domain": 401.0,
                    "id": "obj-53",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 475.8620939254761, 970.6897060871124, 64.13043355941772, 46.73912954330444 ]
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 396.55174493789673, 1022.4138467311859, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 16.94531896203125, 0.06814809163411459, 0, 79.15720136114899, 0.5866666348775228, 0, 147.87365906869186, 0.31698646532994873, 0, 302.94411904510866, 0.07530542180102624, 0, 399.1040251280408, 0.790370348294576, 0 ],
                    "classic_curve": 1,
                    "domain": 401.0,
                    "id": "obj-51",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 381.0345027446747, 972.4138441085815, 66.30434656143188, 41.55073952674866 ]
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 305.17242980003357, 1020.6897087097168, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 16.94531896203125, 0.06814809163411459, 0, 92.43207195294255, 1.0, 0, 239.13061324459463, 0.47555551846822103, 0, 375.5396910668863, 1.0, 0, 401.0, 0.0, 0 ],
                    "classic_curve": 1,
                    "domain": 401.0,
                    "id": "obj-49",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 293.10346364974976, 965.5172920227051, 74.99999856948853, 45.65217304229736 ]
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 218.96552872657776, 1013.7931566238403, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 16.94531896203125, 0.06814809163411459, 0, 79.15720136114899, 0.5866666348775228, 0, 218.3933191115554, 1.0, 0, 399.1040251280408, 0.790370348294576, 0 ],
                    "classic_curve": 1,
                    "domain": 401.0,
                    "id": "obj-47",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 210.34483861923218, 965.5172920227051, 64.13043355941772, 36.95652103424072 ]
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 515.5172684192657, 1053.44833111763, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 422.4138152599335, 1050.0000550746918, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 344.82760429382324, 1044.8276410102844, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 181.0344922542572, 1051.724193096161, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 274.1379454135895, 1058.6207451820374, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 782.7586617469788, 894.8276331424713, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 782.7586617469788, 922.4138414859772, 81.0, 22.0 ],
                    "text": "setdomain $1"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 746.5517632961273, 896.5517711639404, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 767.2414195537567, 1065.5172972679138, 34.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "addpoints": [ 16.94531896203126, 0.06814809163411459, 0, 79.15720136114899, 0.5866666348775228, 0, 218.3933191115554, 1.0, 0, 400.9999999999998, 0.0, 0 ],
                    "classic_curve": 1,
                    "domain": 401.0,
                    "id": "obj-29",
                    "maxclass": "function",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 746.5517632961273, 996.5517764091492, 97.05801212787628, 46.246344566345215 ]
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 343.1034662723541, 1144.8276462554932, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 574.1379611492157, 713.7931408882141, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-117",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 662.0690002441406, 896.5517711639404, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-116",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 546.5517528057098, 901.7241852283478, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-115",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 448.2758855819702, 891.3793570995331, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-114",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 317.2413959503174, 884.4828050136566, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-113",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 217.24139070510864, 884.4828050136566, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-112",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 636.2069299221039, 758.6207294464111, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-111",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 522.4138205051422, 756.896591424942, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-110",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 415.517263174057, 758.6207294464111, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-109",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 293.10346364974976, 756.896591424942, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 405.1724350452423, 791.3793518543243, 29.5, 22.0 ],
                    "text": "* 3."
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 624.1379637718201, 793.1034898757935, 29.5, 22.0 ],
                    "text": "* 5."
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 510.3448543548584, 791.3793518543243, 29.5, 22.0 ],
                    "text": "* 4."
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 281.03449749946594, 784.4827997684479, 29.5, 22.0 ],
                    "text": "* 2."
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 631.0345158576965, 934.482807636261, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 510.3448543548584, 934.482807636261, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 412.0689871311188, 922.4138414859772, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 286.2069115638733, 908.6207373142242, 50.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 165.51725006103516, 929.3103935718536, 29.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 617.2414116859436, 863.7931487560272, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 289.6551876068115, 860.344872713089, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 196.55173444747925, 860.344872713089, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-94",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 236.20690894126892, 751.7241773605347, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 236.20690894126892, 717.2414169311523, 34.0, 22.0 ],
                    "text": "mtof"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "kslider",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 258.62070322036743, 641.3793439865112, 336.0, 53.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 505.17244029045105, 863.7931487560272, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 415.517263174057, 860.344872713089, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 0,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "order": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "source": [ "obj-105", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "source": [ "obj-107", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-108", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 1 ],
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 1 ],
                    "source": [ "obj-110", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 1 ],
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-107", 1 ],
                    "source": [ "obj-112", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 1 ],
                    "source": [ "obj-113", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-99", 1 ],
                    "source": [ "obj-114", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 1 ],
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 1 ],
                    "source": [ "obj-116", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 1 ],
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-132", 0 ],
                    "source": [ "obj-129", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-133", 0 ],
                    "source": [ "obj-132", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "obj-133", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-197", 0 ],
                    "source": [ "obj-147", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-147", 0 ],
                    "source": [ "obj-148", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-150", 0 ],
                    "source": [ "obj-149", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-148", 0 ],
                    "source": [ "obj-150", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-199", 1 ],
                    "order": 0,
                    "source": [ "obj-151", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-199", 0 ],
                    "order": 1,
                    "source": [ "obj-151", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-162", 1 ],
                    "source": [ "obj-152", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-152", 0 ],
                    "source": [ "obj-153", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-163", 1 ],
                    "source": [ "obj-154", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-154", 0 ],
                    "source": [ "obj-155", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-164", 1 ],
                    "source": [ "obj-156", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-156", 0 ],
                    "source": [ "obj-157", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-166", 1 ],
                    "source": [ "obj-158", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-158", 0 ],
                    "source": [ "obj-159", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-165", 1 ],
                    "source": [ "obj-160", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-160", 0 ],
                    "source": [ "obj-161", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-172", 0 ],
                    "source": [ "obj-162", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-172", 0 ],
                    "source": [ "obj-163", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-172", 0 ],
                    "source": [ "obj-164", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-172", 0 ],
                    "source": [ "obj-165", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-172", 0 ],
                    "source": [ "obj-166", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-168", 0 ],
                    "source": [ "obj-167", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-153", 0 ],
                    "order": 1,
                    "source": [ "obj-168", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-155", 0 ],
                    "order": 2,
                    "source": [ "obj-168", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "order": 3,
                    "source": [ "obj-168", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-159", 0 ],
                    "order": 4,
                    "source": [ "obj-168", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-161", 0 ],
                    "order": 5,
                    "source": [ "obj-168", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-171", 0 ],
                    "order": 0,
                    "source": [ "obj-168", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-153", 0 ],
                    "order": 1,
                    "source": [ "obj-169", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-155", 0 ],
                    "order": 2,
                    "source": [ "obj-169", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "order": 3,
                    "source": [ "obj-169", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-159", 0 ],
                    "order": 4,
                    "source": [ "obj-169", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-161", 0 ],
                    "order": 5,
                    "source": [ "obj-169", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-171", 0 ],
                    "order": 0,
                    "source": [ "obj-169", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-172", 1 ],
                    "source": [ "obj-170", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-170", 0 ],
                    "source": [ "obj-171", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-151", 1 ],
                    "order": 0,
                    "source": [ "obj-172", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-151", 0 ],
                    "order": 1,
                    "source": [ "obj-172", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-187", 1 ],
                    "source": [ "obj-174", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-188", 1 ],
                    "source": [ "obj-175", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-189", 1 ],
                    "source": [ "obj-176", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-190", 1 ],
                    "source": [ "obj-177", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-191", 1 ],
                    "source": [ "obj-178", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-184", 1 ],
                    "source": [ "obj-179", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-149", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-185", 1 ],
                    "source": [ "obj-180", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-183", 1 ],
                    "source": [ "obj-181", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-186", 1 ],
                    "source": [ "obj-182", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-200", 0 ],
                    "source": [ "obj-183", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-192", 0 ],
                    "source": [ "obj-184", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-198", 0 ],
                    "source": [ "obj-185", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-193", 0 ],
                    "source": [ "obj-186", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-162", 0 ],
                    "source": [ "obj-187", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-163", 0 ],
                    "source": [ "obj-188", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-164", 0 ],
                    "source": [ "obj-189", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-166", 0 ],
                    "source": [ "obj-190", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-165", 0 ],
                    "source": [ "obj-191", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-187", 0 ],
                    "source": [ "obj-192", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-190", 0 ],
                    "source": [ "obj-193", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-191", 0 ],
                    "source": [ "obj-194", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-183", 0 ],
                    "order": 2,
                    "source": [ "obj-195", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-184", 0 ],
                    "order": 0,
                    "source": [ "obj-195", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-185", 0 ],
                    "order": 1,
                    "source": [ "obj-195", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-186", 0 ],
                    "order": 3,
                    "source": [ "obj-195", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-194", 0 ],
                    "order": 4,
                    "source": [ "obj-195", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-169", 0 ],
                    "order": 0,
                    "source": [ "obj-196", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-195", 0 ],
                    "order": 1,
                    "source": [ "obj-196", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-173", 0 ],
                    "source": [ "obj-197", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-196", 0 ],
                    "source": [ "obj-197", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-188", 0 ],
                    "source": [ "obj-198", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-150", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-189", 0 ],
                    "source": [ "obj-200", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 1 ],
                    "order": 0,
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "order": 1,
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-129", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-129", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-29", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 1 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "order": 0,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "order": 5,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "order": 4,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "order": 3,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "order": 2,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 1,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "order": 0,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "order": 5,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "order": 4,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "order": 3,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "order": 2,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 1,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 1 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-47", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 1 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-49", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 1 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-51", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 1 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-53", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 1 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-55", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-199", 1 ],
                    "order": 0,
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-199", 0 ],
                    "order": 1,
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-89", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "order": 0,
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "order": 1,
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "order": 3,
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "order": 1,
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-107", 0 ],
                    "order": 0,
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "order": 2,
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "order": 4,
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-99", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-99", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-151": [ "live.gain~[3]", "live.gain~", 0 ],
            "obj-79": [ "live.gain~", "live.gain~", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}