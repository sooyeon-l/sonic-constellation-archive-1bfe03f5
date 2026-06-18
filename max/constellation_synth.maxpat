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
      74,
      68,
      1450,
      1100
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15,
      15
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
    "devicewidth": 0,
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
          "text": "SONIC CONSTELLATION  ★  constellation_synth.maxpat  |  sfrecord~ control: open <file>  →  int 1 (start)  →  int 0 (stop)  |  run  npm install  in patch folder before first use",
          "patching_rect": [
            10,
            12,
            1200,
            20
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "comment",
          "text": "1. NODE BRIDGE  |  'not ready'? → open Terminal, cd to patch folder, npm install, reopen patch",
          "patching_rect": [
            10,
            38,
            800,
            20
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
            10,
            62,
            225,
            22
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
            10,
            98,
            70,
            22
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
            90,
            98,
            90,
            22
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
            192,
            98,
            92,
            22
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
            295,
            98,
            92,
            22
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
          "text": "← click here if 'not ready'",
          "patching_rect": [
            400,
            102,
            200,
            16
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
            10,
            134,
            120,
            22
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
          "text": "startAuto 5000 output/test_synth.wav",
          "patching_rect": [
            140,
            134,
            240,
            22
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
            390,
            134,
            80,
            22
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
            10,
            170,
            145,
            22
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
            305,
            38,
            200,
            20
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
            305,
            62,
            185,
            22
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
          "text": "MANUAL CONTROLS  (uploadSynth needs fetchPending first — expected when testing locally)",
          "patching_rect": [
            550,
            38,
            480,
            20
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
            550,
            62,
            120,
            22
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
            680,
            62,
            92,
            22
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
            550,
            92,
            108,
            22
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
            668,
            92,
            100,
            22
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
            550,
            122,
            55,
            22
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
          "id": "obj-rec-diag",
          "maxclass": "message",
          "text": "recorder_diagnostic",
          "patching_rect": [
            615,
            122,
            155,
            22
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
            810,
            38,
            640,
            20
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "text": "route setfreq setsubfreq setpan setfilter setnoise setenv record_open record_start record_stop dsp_start loadstar playstar",
          "patching_rect": [
            810,
            62,
            600,
            22
          ],
          "numinlets": 2,
          "numoutlets": 13,
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
            810,
            98,
            95,
            22
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
            916,
            98,
            30,
            22
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
            956,
            102,
            100,
            16
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
            810,
            134,
            30,
            22
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
            945,
            138,
            100,
            16
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "obj-dsp-start",
          "maxclass": "message",
          "text": "; dsp start",
          "patching_rect": [
            850,
            134,
            85,
            22
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
          "id": "obj-21",
          "maxclass": "comment",
          "text": "5.  SYNTHESIS LAYERS  —  main osc · sub octave · filtered noise",
          "patching_rect": [
            10,
            208,
            500,
            20
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
            10,
            232,
            80,
            22
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
            100,
            232,
            80,
            22
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
            220,
            232,
            60,
            22
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
            285,
            232,
            115,
            22
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
            10,
            272,
            60,
            22
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
            100,
            272,
            60,
            22
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
            285,
            272,
            70,
            22
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
            55,
            312,
            40,
            22
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
            55,
            352,
            40,
            22
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
            155,
            310,
            165,
            20
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
            155,
            332,
            75,
            22
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
            55,
            392,
            40,
            22
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
          "text": "6.  FX / SPACE  —  delay",
          "patching_rect": [
            10,
            422,
            220,
            20
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
            55,
            445,
            95,
            22
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
            55,
            482,
            95,
            22
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
            165,
            482,
            72,
            22
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
            55,
            522,
            40,
            22
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
            10,
            558,
            180,
            20
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
            55,
            578,
            55,
            22
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
            55,
            605,
            60,
            22
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
            130,
            605,
            60,
            22
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
          "text": "7.  RECORDER  —  open <file>  then  int 1 (start)  /  int 0 (stop)",
          "patching_rect": [
            10,
            642,
            420,
            20
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
            10,
            665,
            105,
            22
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
            158,
            665,
            72,
            22
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
          "text": "8.  UPLOAD  —  js outlet 1 → node.script → uploadSynth → Supabase → website  (requires fetchPending first to set currentConstellation)",
          "patching_rect": [
            10,
            700,
            780,
            20
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
            10,
            168,
            110,
            22
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
            130,
            168,
            120,
            22
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
            265,
            172,
            520,
            20
          ],
          "text": "Manual fallback: fetchPending → downloadStars → markSynthesizing → synthesize"
        }
      },
      {
        "box": {
          "id": "auto-c0",
          "maxclass": "comment",
          "patching_rect": [
            10,
            300,
            820,
            20
          ],
          "text": "AUTO WORKER — full website pipeline: fetch → downloadStars → markSynthesizing → synthesize → uploadSynth → ready"
        }
      },
      {
        "box": {
          "id": "auto-toggle",
          "maxclass": "toggle",
          "patching_rect": [
            10,
            330,
            24,
            24
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
            50,
            330,
            80,
            22
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
            145,
            330,
            70,
            22
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
            230,
            330,
            95,
            22
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
            340,
            333,
            640,
            20
          ],
          "text": "Turn on. onebang prevents repeated fetches while one constellation is being processed."
        }
      },
      {
        "box": {
          "id": "auto-route",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            380,
            345,
            22
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
            10,
            420,
            300,
            22
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
            10,
            465,
            70,
            22
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
            95,
            465,
            105,
            22
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
            220,
            465,
            70,
            22
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
            305,
            465,
            115,
            22
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
            440,
            465,
            70,
            22
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
            525,
            465,
            75,
            22
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
            10,
            505,
            900,
            20
          ],
          "text": "pending_synthesis → downloadStars | stars_downloaded → markSynthesizing | synthesizing → synthesize | ready/error/no_pending → re-arm"
        }
      },
      {
        "box": {
          "id": "star-bank-comment",
          "maxclass": "comment",
          "patching_rect": [
            810,
            180,
            760,
            20
          ],
          "text": "CURRENT PATCH STAR BUFFER BANK  |  loadstar <index> <path> -> buffer~ s_0..s_6  |  playstar <index> -> play~",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "route-loadstar",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            208,
            220,
            22
          ],
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route 0 1 2 3 4 5 6"
        }
      },
      {
        "box": {
          "id": "route-playstar",
          "maxclass": "newobj",
          "patching_rect": [
            1060,
            208,
            220,
            22
          ],
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route 0 1 2 3 4 5 6"
        }
      },
      {
        "box": {
          "id": "manual-star-comment",
          "maxclass": "comment",
          "patching_rect": [
            810,
            505,
            780,
            20
          ],
          "text": "Manual star tests: load downloaded WAVs, play a single buffer, then use start_record/stop_record to record real star audio.",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "star0-replace",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            240,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "star0-buffer",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            240,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_0"
        }
      },
      {
        "box": {
          "id": "star0-start",
          "maxclass": "message",
          "patching_rect": [
            1060,
            240,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star0-play",
          "maxclass": "newobj",
          "patching_rect": [
            1122,
            240,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_0"
        }
      },
      {
        "box": {
          "id": "star0-gain",
          "maxclass": "newobj",
          "patching_rect": [
            1212,
            240,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "manual-load-star0",
          "maxclass": "message",
          "patching_rect": [
            810,
            532,
            245,
            22
          ],
          "text": "load_local_star 0 downloads/star_0.wav",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-play-star0",
          "maxclass": "message",
          "patching_rect": [
            1068,
            532,
            82,
            22
          ],
          "text": "playstar 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star1-replace",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            274,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "star1-buffer",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            274,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_1"
        }
      },
      {
        "box": {
          "id": "star1-start",
          "maxclass": "message",
          "patching_rect": [
            1060,
            274,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star1-play",
          "maxclass": "newobj",
          "patching_rect": [
            1122,
            274,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_1"
        }
      },
      {
        "box": {
          "id": "star1-gain",
          "maxclass": "newobj",
          "patching_rect": [
            1212,
            274,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "manual-load-star1",
          "maxclass": "message",
          "patching_rect": [
            810,
            558,
            245,
            22
          ],
          "text": "load_local_star 1 downloads/star_1.wav",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-play-star1",
          "maxclass": "message",
          "patching_rect": [
            1068,
            558,
            82,
            22
          ],
          "text": "playstar 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star2-replace",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            308,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "star2-buffer",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            308,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_2"
        }
      },
      {
        "box": {
          "id": "star2-start",
          "maxclass": "message",
          "patching_rect": [
            1060,
            308,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star2-play",
          "maxclass": "newobj",
          "patching_rect": [
            1122,
            308,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_2"
        }
      },
      {
        "box": {
          "id": "star2-gain",
          "maxclass": "newobj",
          "patching_rect": [
            1212,
            308,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "manual-load-star2",
          "maxclass": "message",
          "patching_rect": [
            810,
            584,
            245,
            22
          ],
          "text": "load_local_star 2 downloads/star_2.wav",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-play-star2",
          "maxclass": "message",
          "patching_rect": [
            1068,
            584,
            82,
            22
          ],
          "text": "playstar 2",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star3-replace",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            342,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "star3-buffer",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            342,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_3"
        }
      },
      {
        "box": {
          "id": "star3-start",
          "maxclass": "message",
          "patching_rect": [
            1060,
            342,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star3-play",
          "maxclass": "newobj",
          "patching_rect": [
            1122,
            342,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_3"
        }
      },
      {
        "box": {
          "id": "star3-gain",
          "maxclass": "newobj",
          "patching_rect": [
            1212,
            342,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "manual-load-star3",
          "maxclass": "message",
          "patching_rect": [
            810,
            610,
            245,
            22
          ],
          "text": "load_local_star 3 downloads/star_3.wav",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-play-star3",
          "maxclass": "message",
          "patching_rect": [
            1068,
            610,
            82,
            22
          ],
          "text": "playstar 3",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star4-replace",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            376,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "star4-buffer",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            376,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_4"
        }
      },
      {
        "box": {
          "id": "star4-start",
          "maxclass": "message",
          "patching_rect": [
            1060,
            376,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star4-play",
          "maxclass": "newobj",
          "patching_rect": [
            1122,
            376,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_4"
        }
      },
      {
        "box": {
          "id": "star4-gain",
          "maxclass": "newobj",
          "patching_rect": [
            1212,
            376,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "manual-load-star4",
          "maxclass": "message",
          "patching_rect": [
            810,
            636,
            245,
            22
          ],
          "text": "load_local_star 4 downloads/star_4.wav",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-play-star4",
          "maxclass": "message",
          "patching_rect": [
            1068,
            636,
            82,
            22
          ],
          "text": "playstar 4",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star5-replace",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            410,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "star5-buffer",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            410,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_5"
        }
      },
      {
        "box": {
          "id": "star5-start",
          "maxclass": "message",
          "patching_rect": [
            1060,
            410,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star5-play",
          "maxclass": "newobj",
          "patching_rect": [
            1122,
            410,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_5"
        }
      },
      {
        "box": {
          "id": "star5-gain",
          "maxclass": "newobj",
          "patching_rect": [
            1212,
            410,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "manual-load-star5",
          "maxclass": "message",
          "patching_rect": [
            810,
            662,
            245,
            22
          ],
          "text": "load_local_star 5 downloads/star_5.wav",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-play-star5",
          "maxclass": "message",
          "patching_rect": [
            1068,
            662,
            82,
            22
          ],
          "text": "playstar 5",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star6-replace",
          "maxclass": "newobj",
          "patching_rect": [
            810,
            444,
            110,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "star6-buffer",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            444,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_6"
        }
      },
      {
        "box": {
          "id": "star6-start",
          "maxclass": "message",
          "patching_rect": [
            1060,
            444,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "star6-play",
          "maxclass": "newobj",
          "patching_rect": [
            1122,
            444,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_6"
        }
      },
      {
        "box": {
          "id": "star6-gain",
          "maxclass": "newobj",
          "patching_rect": [
            1212,
            444,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "manual-load-star6",
          "maxclass": "message",
          "patching_rect": [
            810,
            688,
            245,
            22
          ],
          "text": "load_local_star 6 downloads/star_6.wav",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "manual-play-star6",
          "maxclass": "message",
          "patching_rect": [
            1068,
            688,
            82,
            22
          ],
          "text": "playstar 6",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
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
            "obj-rec-diag",
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
            "obj-17",
            9
          ],
          "destination": [
            "obj-dsp-start",
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
      },
      {
        "patchline": {
          "source": [
            "route-loadstar",
            0
          ],
          "destination": [
            "star0-replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star0-replace",
            0
          ],
          "destination": [
            "star0-buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route-playstar",
            0
          ],
          "destination": [
            "star0-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star0-start",
            0
          ],
          "destination": [
            "star0-play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star0-play",
            0
          ],
          "destination": [
            "star0-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star0-gain",
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
            "manual-load-star0",
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
            "manual-play-star0",
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
            "route-loadstar",
            1
          ],
          "destination": [
            "star1-replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star1-replace",
            0
          ],
          "destination": [
            "star1-buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route-playstar",
            1
          ],
          "destination": [
            "star1-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star1-start",
            0
          ],
          "destination": [
            "star1-play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star1-play",
            0
          ],
          "destination": [
            "star1-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star1-gain",
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
            "manual-load-star1",
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
            "manual-play-star1",
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
            "route-loadstar",
            2
          ],
          "destination": [
            "star2-replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star2-replace",
            0
          ],
          "destination": [
            "star2-buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route-playstar",
            2
          ],
          "destination": [
            "star2-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star2-start",
            0
          ],
          "destination": [
            "star2-play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star2-play",
            0
          ],
          "destination": [
            "star2-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star2-gain",
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
            "manual-load-star2",
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
            "manual-play-star2",
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
            "route-loadstar",
            3
          ],
          "destination": [
            "star3-replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star3-replace",
            0
          ],
          "destination": [
            "star3-buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route-playstar",
            3
          ],
          "destination": [
            "star3-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star3-start",
            0
          ],
          "destination": [
            "star3-play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star3-play",
            0
          ],
          "destination": [
            "star3-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star3-gain",
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
            "manual-load-star3",
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
            "manual-play-star3",
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
            "route-loadstar",
            4
          ],
          "destination": [
            "star4-replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star4-replace",
            0
          ],
          "destination": [
            "star4-buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route-playstar",
            4
          ],
          "destination": [
            "star4-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star4-start",
            0
          ],
          "destination": [
            "star4-play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star4-play",
            0
          ],
          "destination": [
            "star4-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star4-gain",
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
            "manual-load-star4",
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
            "manual-play-star4",
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
            "route-loadstar",
            5
          ],
          "destination": [
            "star5-replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star5-replace",
            0
          ],
          "destination": [
            "star5-buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route-playstar",
            5
          ],
          "destination": [
            "star5-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star5-start",
            0
          ],
          "destination": [
            "star5-play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star5-play",
            0
          ],
          "destination": [
            "star5-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star5-gain",
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
            "manual-load-star5",
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
            "manual-play-star5",
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
            "route-loadstar",
            6
          ],
          "destination": [
            "star6-replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star6-replace",
            0
          ],
          "destination": [
            "star6-buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route-playstar",
            6
          ],
          "destination": [
            "star6-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star6-start",
            0
          ],
          "destination": [
            "star6-play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star6-play",
            0
          ],
          "destination": [
            "star6-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "star6-gain",
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
            "manual-load-star6",
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
            "manual-play-star6",
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
            "obj-17",
            10
          ],
          "destination": [
            "route-loadstar",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            11
          ],
          "destination": [
            "route-playstar",
            0
          ]
        }
      }
    ]
  }
}
