{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      74.0,
      68.0,
      1450.0,
      1100.0
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15.0,
      15.0
    ],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "lefttoolbarpinned": 0,
    "toptoolbarpinned": 0,
    "tallnewobj": 0,
    "boxanimatetime": 200,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0.0,
    "description": "Sonic Constellation synthesis patch",
    "digest": "",
    "tags": "",
    "style": "",
    "subpatcher_template": "",
    "assistshowspatchername": 0,
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "text": "SONIC CONSTELLATION  \u2605  constellation_synth.maxpat  |  sfrecord~ control: open <file>  \u2192  int 1 (start)  \u2192  int 0 (stop)  |  run  npm install  in patch folder before first use",
          "patching_rect": [
            10.0,
            12.0,
            1200.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "comment",
          "text": "1. NODE BRIDGE  |  'not ready'? \u2192 open Terminal, cd to patch folder, npm install, reopen patch",
          "patching_rect": [
            10.0,
            38.0,
            800.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "text": "node.script maxBridge.js",
          "patching_rect": [
            10.0,
            62.0,
            225.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-lb",
          "maxclass": "newobj",
          "text": "loadbang",
          "patching_rect": [
            10.0,
            98.0,
            70.0,
            22.0
          ],
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-d",
          "maxclass": "newobj",
          "text": "delay 1000",
          "patching_rect": [
            90.0,
            98.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-ss",
          "maxclass": "message",
          "text": "script start",
          "patching_rect": [
            192.0,
            98.0,
            92.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-ssb",
          "maxclass": "message",
          "text": "script start",
          "patching_rect": [
            295.0,
            98.0,
            92.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-ssc",
          "maxclass": "comment",
          "text": "\u2190 click here if 'not ready'",
          "patching_rect": [
            400.0,
            102.0,
            200.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "message",
          "text": "fetchPending",
          "patching_rect": [
            10.0,
            134.0,
            120.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "message",
          "text": "startAuto 5000 test_synth.wav",
          "patching_rect": [
            140.0,
            134.0,
            240.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "message",
          "text": "stopAuto",
          "patching_rect": [
            390.0,
            134.0,
            80.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "text": "print bridge_debug",
          "patching_rect": [
            10.0,
            170.0,
            145.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "comment",
          "text": "2. STAR DATA PARSER",
          "patching_rect": [
            305.0,
            38.0,
            200.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "text": "js synthEngine.js",
          "patching_rect": [
            305.0,
            62.0,
            185.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "comment",
          "text": "MANUAL CONTROLS  (uploadSynth needs fetchPending first \u2014 expected when testing locally)",
          "patching_rect": [
            550.0,
            38.0,
            480.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "message",
          "text": "test_metadata",
          "patching_rect": [
            550.0,
            62.0,
            120.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "message",
          "text": "synthesize",
          "patching_rect": [
            680.0,
            62.0,
            92.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "message",
          "text": "start_record",
          "patching_rect": [
            550.0,
            92.0,
            108.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "message",
          "text": "stop_record",
          "patching_rect": [
            668.0,
            92.0,
            100.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "message",
          "text": "clear",
          "patching_rect": [
            550.0,
            122.0,
            55.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "comment",
          "text": "3/4.  SYNTH COMMAND ROUTER  |  sfrecord~ int message: 1 = start recording,  0 = stop recording  (from Max 9 help file)",
          "patching_rect": [
            810.0,
            38.0,
            640.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "text": "route setfreq setsubfreq setpan setfilter setnoise setenv record_open record_start record_stop",
          "patching_rect": [
            810.0,
            62.0,
            600.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 11,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "text": "prepend open",
          "patching_rect": [
            810.0,
            98.0,
            95.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-m1",
          "maxclass": "message",
          "text": "1",
          "patching_rect": [
            916.0,
            98.0,
            30.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mc1",
          "maxclass": "comment",
          "text": "int 1 = start",
          "patching_rect": [
            956.0,
            102.0,
            100.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-m0",
          "maxclass": "message",
          "text": "0",
          "patching_rect": [
            810.0,
            134.0,
            30.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mc0",
          "maxclass": "comment",
          "text": "int 0 = stop",
          "patching_rect": [
            850.0,
            138.0,
            100.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "comment",
          "text": "5.  SYNTHESIS LAYERS  \u2014  main osc \u00b7 sub octave \u00b7 filtered noise",
          "patching_rect": [
            10.0,
            208.0,
            500.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "text": "cycle~ 440",
          "patching_rect": [
            10.0,
            232.0,
            80.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "text": "cycle~ 220",
          "patching_rect": [
            100.0,
            232.0,
            80.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "text": "noise~",
          "patching_rect": [
            220.0,
            232.0,
            60.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "newobj",
          "text": "lores~ 500 0.1",
          "patching_rect": [
            285.0,
            232.0,
            115.0,
            22.0
          ],
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "newobj",
          "text": "*~ 0.6",
          "patching_rect": [
            10.0,
            272.0,
            60.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "newobj",
          "text": "*~ 0.2",
          "patching_rect": [
            100.0,
            272.0,
            60.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "newobj",
          "text": "*~ 0.15",
          "patching_rect": [
            285.0,
            272.0,
            70.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            55.0,
            312.0,
            40.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            55.0,
            352.0,
            40.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "comment",
          "text": "Amplitude Envelope",
          "patching_rect": [
            155.0,
            310.0,
            165.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-32",
          "maxclass": "newobj",
          "text": "line~ 0.",
          "patching_rect": [
            155.0,
            332.0,
            75.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "newobj",
          "text": "*~",
          "patching_rect": [
            55.0,
            392.0,
            40.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "comment",
          "text": "6.  FX / SPACE  \u2014  delay",
          "patching_rect": [
            10.0,
            422.0,
            220.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "newobj",
          "text": "tapin~ 2000",
          "patching_rect": [
            55.0,
            445.0,
            95.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "newobj",
          "text": "tapout~ 400",
          "patching_rect": [
            55.0,
            482.0,
            95.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "newobj",
          "text": "*~ 0.25",
          "patching_rect": [
            165.0,
            482.0,
            72.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "newobj",
          "text": "+~",
          "patching_rect": [
            55.0,
            522.0,
            40.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "comment",
          "text": "Pan  L=(1-x)  R=x",
          "patching_rect": [
            10.0,
            558.0,
            180.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-40",
          "maxclass": "newobj",
          "text": "!- 1.",
          "patching_rect": [
            55.0,
            578.0,
            55.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "newobj",
          "text": "*~ 0.5",
          "patching_rect": [
            55.0,
            605.0,
            60.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "newobj",
          "text": "*~ 0.5",
          "patching_rect": [
            130.0,
            605.0,
            60.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "comment",
          "text": "7.  RECORDER  \u2014  open <file>  then  int 1 (start)  /  int 0 (stop)",
          "patching_rect": [
            10.0,
            642.0,
            420.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "newobj",
          "text": "sfrecord~ 2",
          "patching_rect": [
            10.0,
            665.0,
            105.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-45",
          "maxclass": "newobj",
          "text": "dac~ 1 2",
          "patching_rect": [
            158.0,
            665.0,
            72.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "comment",
          "text": "8.  UPLOAD  \u2014  js outlet 1 \u2192 node.script \u2192 uploadSynth \u2192 Supabase \u2192 website  (requires fetchPending first to set currentConstellation)",
          "patching_rect": [
            10.0,
            700.0,
            780.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "manual-downloadStars",
          "maxclass": "message",
          "patching_rect": [
            10.0,
            168.0,
            110.0,
            22.0
          ],
          "text": "downloadStars",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-markSynth",
          "maxclass": "message",
          "patching_rect": [
            130.0,
            168.0,
            120.0,
            22.0
          ],
          "text": "markSynthesizing",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-c",
          "maxclass": "comment",
          "patching_rect": [
            265.0,
            172.0,
            520.0,
            20.0
          ],
          "text": "Manual fallback: fetchPending \u2192 downloadStars \u2192 markSynthesizing \u2192 synthesize"
        }
      },
      {
        "box": {
          "id": "auto-c0",
          "maxclass": "comment",
          "patching_rect": [
            10.0,
            300.0,
            820.0,
            20.0
          ],
          "text": "AUTO WORKER \u2014 full website pipeline: fetch \u2192 downloadStars \u2192 markSynthesizing \u2192 synthesize \u2192 uploadSynth \u2192 ready"
        }
      },
      {
        "box": {
          "id": "auto-toggle",
          "maxclass": "toggle",
          "patching_rect": [
            10.0,
            330.0,
            24.0,
            24.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "auto-metro",
          "maxclass": "newobj",
          "patching_rect": [
            50.0,
            330.0,
            80.0,
            22.0
          ],
          "text": "metro 5000",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-onebang",
          "maxclass": "newobj",
          "patching_rect": [
            145.0,
            330.0,
            70.0,
            22.0
          ],
          "text": "onebang",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-fetch",
          "maxclass": "message",
          "patching_rect": [
            230.0,
            330.0,
            95.0,
            22.0
          ],
          "text": "fetchPending",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-c1",
          "maxclass": "comment",
          "patching_rect": [
            340.0,
            333.0,
            640.0,
            20.0
          ],
          "text": "Turn on. onebang prevents repeated fetches while one constellation is being processed."
        }
      },
      {
        "box": {
          "id": "auto-route",
          "maxclass": "newobj",
          "patching_rect": [
            10.0,
            380.0,
            345.0,
            22.0
          ],
          "text": "route status stars_downloaded ready error no_pending",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-status",
          "maxclass": "newobj",
          "patching_rect": [
            10.0,
            420.0,
            300.0,
            22.0
          ],
          "text": "route pending_synthesis synthesizing ready failed",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
            "",
            "",
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-dl-delay",
          "maxclass": "newobj",
          "patching_rect": [
            10.0,
            465.0,
            70.0,
            22.0
          ],
          "text": "delay 500",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-dl",
          "maxclass": "message",
          "patching_rect": [
            95.0,
            465.0,
            105.0,
            22.0
          ],
          "text": "downloadStars",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-ms-delay",
          "maxclass": "newobj",
          "patching_rect": [
            220.0,
            465.0,
            70.0,
            22.0
          ],
          "text": "delay 500",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-ms",
          "maxclass": "message",
          "patching_rect": [
            305.0,
            465.0,
            115.0,
            22.0
          ],
          "text": "markSynthesizing",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-syn-delay",
          "maxclass": "newobj",
          "patching_rect": [
            440.0,
            465.0,
            70.0,
            22.0
          ],
          "text": "delay 500",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-syn",
          "maxclass": "message",
          "patching_rect": [
            525.0,
            465.0,
            75.0,
            22.0
          ],
          "text": "synthesize",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "auto-c2",
          "maxclass": "comment",
          "patching_rect": [
            10.0,
            505.0,
            900.0,
            20.0
          ],
          "text": "pending_synthesis \u2192 downloadStars | stars_downloaded \u2192 markSynthesizing | synthesizing \u2192 synthesize | ready/error/no_pending \u2192 re-arm"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-lb",
            0
          ],
          "destination": [
            "obj-d",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-d",
            0
          ],
          "destination": [
            "obj-ss",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ss",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ssb",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-6",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-11",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-12",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-13",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-15",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            0
          ],
          "destination": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            1
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            0
          ],
          "destination": [
            "obj-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            1
          ],
          "destination": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            2
          ],
          "destination": [
            "obj-40",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            2
          ],
          "destination": [
            "obj-42",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            3
          ],
          "destination": [
            "obj-25",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            4
          ],
          "destination": [
            "obj-28",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            5
          ],
          "destination": [
            "obj-32",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            6
          ],
          "destination": [
            "obj-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-18",
            0
          ],
          "destination": [
            "obj-44",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            7
          ],
          "destination": [
            "obj-m1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-m1",
            0
          ],
          "destination": [
            "obj-44",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            8
          ],
          "destination": [
            "obj-m0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-m0",
            0
          ],
          "destination": [
            "obj-44",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-40",
            0
          ],
          "destination": [
            "obj-41",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-22",
            0
          ],
          "destination": [
            "obj-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-23",
            0
          ],
          "destination": [
            "obj-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-24",
            0
          ],
          "destination": [
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-25",
            0
          ],
          "destination": [
            "obj-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-26",
            0
          ],
          "destination": [
            "obj-29",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-27",
            0
          ],
          "destination": [
            "obj-29",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-29",
            0
          ],
          "destination": [
            "obj-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-28",
            0
          ],
          "destination": [
            "obj-30",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-30",
            0
          ],
          "destination": [
            "obj-33",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-32",
            0
          ],
          "destination": [
            "obj-33",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-33",
            0
          ],
          "destination": [
            "obj-35",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-33",
            0
          ],
          "destination": [
            "obj-38",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-35",
            0
          ],
          "destination": [
            "obj-36",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-36",
            0
          ],
          "destination": [
            "obj-37",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-37",
            0
          ],
          "destination": [
            "obj-38",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-38",
            0
          ],
          "destination": [
            "obj-41",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-38",
            0
          ],
          "destination": [
            "obj-42",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-41",
            0
          ],
          "destination": [
            "obj-44",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-42",
            0
          ],
          "destination": [
            "obj-44",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-41",
            0
          ],
          "destination": [
            "obj-45",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-42",
            0
          ],
          "destination": [
            "obj-45",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "manual-downloadStars",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "manual-markSynth",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-toggle",
            0
          ],
          "destination": [
            "auto-metro",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-metro",
            0
          ],
          "destination": [
            "auto-onebang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-onebang",
            0
          ],
          "destination": [
            "auto-fetch",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-fetch",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "auto-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-route",
            0
          ],
          "destination": [
            "auto-status",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-status",
            0
          ],
          "destination": [
            "auto-dl-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-dl-delay",
            0
          ],
          "destination": [
            "auto-dl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-dl",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-route",
            1
          ],
          "destination": [
            "auto-ms-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-ms-delay",
            0
          ],
          "destination": [
            "auto-ms",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-ms",
            0
          ],
          "destination": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-status",
            1
          ],
          "destination": [
            "auto-syn-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-syn-delay",
            0
          ],
          "destination": [
            "auto-syn",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-syn",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-route",
            2
          ],
          "destination": [
            "auto-onebang",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-route",
            3
          ],
          "destination": [
            "auto-onebang",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-route",
            4
          ],
          "destination": [
            "auto-onebang",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-status",
            2
          ],
          "destination": [
            "auto-onebang",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "auto-status",
            3
          ],
          "destination": [
            "auto-onebang",
            1
          ]
        }
      }
    ]
  }
}