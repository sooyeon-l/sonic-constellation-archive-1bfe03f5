{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 8,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      40,
      40,
      1840,
      1300
    ],
    "gridsize": [
      15,
      15
    ],
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "patching_rect": [
            20,
            15,
            1120,
            22
          ],
          "text": "SONIC CONSTELLATION MAIN | modular Stage 2 integration | verified backend contract preserved | fallback: constellation_synth.maxpat",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "label-0",
          "maxclass": "comment",
          "patching_rect": [
            40,
            196,
            520,
            20
          ],
          "text": "Bridge: Node-for-Max backend contract",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-0",
          "maxclass": "bpatcher",
          "name": "bp_bridge.maxpat",
          "patching_rect": [
            40,
            220,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-1",
          "maxclass": "comment",
          "patching_rect": [
            620,
            196,
            520,
            20
          ],
          "text": "Controller: verified Stage 1 sequencing",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-1",
          "maxclass": "bpatcher",
          "name": "bp_controller.maxpat",
          "patching_rect": [
            620,
            220,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-2",
          "maxclass": "comment",
          "patching_rect": [
            1200,
            196,
            520,
            20
          ],
          "text": "Star Bank: buffers s_0..s_6 and original playback",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-2",
          "maxclass": "bpatcher",
          "name": "bp_star_bank.maxpat",
          "patching_rect": [
            1200,
            220,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-3",
          "maxclass": "comment",
          "patching_rect": [
            40,
            476,
            520,
            20
          ],
          "text": "Shared Analysis: pitch/amplitude",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-3",
          "maxclass": "bpatcher",
          "name": "bp_analysis.maxpat",
          "patching_rect": [
            40,
            500,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-4",
          "maxclass": "comment",
          "patching_rect": [
            620,
            476,
            520,
            20
          ],
          "text": "Hyerin Mapping: pitch color and amplitude intensity",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-4",
          "maxclass": "bpatcher",
          "name": "bp_hyerin_mapping.maxpat",
          "patching_rect": [
            620,
            500,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-5",
          "maxclass": "comment",
          "patching_rect": [
            1200,
            476,
            520,
            20
          ],
          "text": "Native Voice Engine: conservative support layer",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-5",
          "maxclass": "bpatcher",
          "name": "bp_voice_engine.maxpat",
          "patching_rect": [
            1200,
            500,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-6",
          "maxclass": "comment",
          "patching_rect": [
            40,
            756,
            520,
            20
          ],
          "text": "Eunmin Timbre: register branches",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-6",
          "maxclass": "bpatcher",
          "name": "bp_eunmin_timbre.maxpat",
          "patching_rect": [
            40,
            780,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-7",
          "maxclass": "comment",
          "patching_rect": [
            620,
            756,
            520,
            20
          ],
          "text": "Janice Response: onset gestures",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-7",
          "maxclass": "bpatcher",
          "name": "bp_janice_response.maxpat",
          "patching_rect": [
            620,
            780,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-8",
          "maxclass": "comment",
          "patching_rect": [
            1200,
            756,
            520,
            20
          ],
          "text": "Taewan Visuals: Jitter and optional effects",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-8",
          "maxclass": "bpatcher",
          "name": "bp_taewan_visuals.maxpat",
          "patching_rect": [
            1200,
            780,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-9",
          "maxclass": "comment",
          "patching_rect": [
            40,
            1036,
            520,
            20
          ],
          "text": "Arrangement Mix: final stereo bus",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-9",
          "maxclass": "bpatcher",
          "name": "bp_arrangement_mix.maxpat",
          "patching_rect": [
            40,
            1060,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-10",
          "maxclass": "comment",
          "patching_rect": [
            620,
            1036,
            520,
            20
          ],
          "text": "Recorder: sfrecord and output gate",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-10",
          "maxclass": "bpatcher",
          "name": "bp_recorder.maxpat",
          "patching_rect": [
            620,
            1060,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "label-11",
          "maxclass": "comment",
          "patching_rect": [
            1200,
            1036,
            520,
            20
          ],
          "text": "Diagnostics: manual tests and local star controls",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "bp-11",
          "maxclass": "bpatcher",
          "name": "bp_diagnostics.maxpat",
          "patching_rect": [
            1200,
            1060,
            520,
            220
          ],
          "numinlets": 0,
          "numoutlets": 0,
          "args": [],
          "border": 1,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "embed": 0,
          "lockeddragscroll": 0,
          "offset": [
            0,
            0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "topControls",
          "maxclass": "comment",
          "patching_rect": [
            40,
            52,
            980,
            22
          ],
          "text": "DEMO CONTROLS: use these instead of opening bpatchers. Click left to right for real backend flow.",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topStart",
          "maxclass": "message",
          "patching_rect": [
            40,
            82,
            116,
            22
          ],
          "text": "script start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topDiag",
          "maxclass": "message",
          "patching_rect": [
            170,
            82,
            172,
            22
          ],
          "text": "recorder_diagnostic",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topFetch",
          "maxclass": "message",
          "patching_rect": [
            355,
            82,
            116,
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
          "id": "topDownload",
          "maxclass": "message",
          "patching_rect": [
            495,
            82,
            124,
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
          "id": "topMark",
          "maxclass": "message",
          "patching_rect": [
            650,
            82,
            148,
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
          "id": "topSynth",
          "maxclass": "message",
          "patching_rect": [
            825,
            82,
            100,
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
          "id": "topClear",
          "maxclass": "message",
          "patching_rect": [
            950,
            82,
            90,
            22
          ],
          "text": "clear",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topBridgeSend",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            122,
            160,
            22
          ],
          "text": "s sc_bridge_commands",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topControllerSend",
          "maxclass": "newobj",
          "patching_rect": [
            230,
            122,
            190,
            22
          ],
          "text": "s sc_controller_commands",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topLevels",
          "maxclass": "comment",
          "patching_rect": [
            1120,
            52,
            260,
            22
          ],
          "text": "LAYER QUICK CONTROLS",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topVoiceOff",
          "maxclass": "message",
          "patching_rect": [
            1120,
            82,
            45,
            22
          ],
          "text": "0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topVoiceOn",
          "maxclass": "message",
          "patching_rect": [
            1165,
            82,
            45,
            22
          ],
          "text": "0.18",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topEunOff",
          "maxclass": "message",
          "patching_rect": [
            1230,
            82,
            45,
            22
          ],
          "text": "0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topEunOn",
          "maxclass": "message",
          "patching_rect": [
            1275,
            82,
            45,
            22
          ],
          "text": "0.18",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topJanOff",
          "maxclass": "message",
          "patching_rect": [
            1340,
            82,
            45,
            22
          ],
          "text": "0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topJanOn",
          "maxclass": "message",
          "patching_rect": [
            1385,
            82,
            45,
            22
          ],
          "text": "0.12",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topTaeOff",
          "maxclass": "message",
          "patching_rect": [
            1450,
            82,
            45,
            22
          ],
          "text": "0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topTaeOn",
          "maxclass": "message",
          "patching_rect": [
            1495,
            82,
            45,
            22
          ],
          "text": "0.08",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topVoiceLabel",
          "maxclass": "comment",
          "patching_rect": [
            1120,
            112,
            90,
            22
          ],
          "text": "voice off/on",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topEunLabel",
          "maxclass": "comment",
          "patching_rect": [
            1230,
            112,
            100,
            22
          ],
          "text": "Eunmin off/on",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topJanLabel",
          "maxclass": "comment",
          "patching_rect": [
            1340,
            112,
            100,
            22
          ],
          "text": "Janice off/on",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topTaeLabel",
          "maxclass": "comment",
          "patching_rect": [
            1450,
            112,
            100,
            22
          ],
          "text": "Taewan off/on",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topVoiceLevel",
          "maxclass": "newobj",
          "patching_rect": [
            1120,
            142,
            130,
            22
          ],
          "text": "s sc_voice_level",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topEunLevel",
          "maxclass": "newobj",
          "patching_rect": [
            1230,
            142,
            140,
            22
          ],
          "text": "s sc_eunmin_level",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topJanLevel",
          "maxclass": "newobj",
          "patching_rect": [
            1370,
            142,
            135,
            22
          ],
          "text": "s sc_janice_level",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topTaeLevel",
          "maxclass": "newobj",
          "patching_rect": [
            1510,
            142,
            135,
            22
          ],
          "text": "s sc_taewan_level",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topRunFull",
          "maxclass": "message",
          "patching_rect": [
            40,
            162,
            120,
            22
          ],
          "text": "run_full_flow",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "topRunNote",
          "maxclass": "comment",
          "patching_rect": [
            170,
            162,
            560,
            22
          ],
          "text": "ONE CLICK: starts fetch -> download -> mark -> synthesize. Use after script start.",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "topDemoNote",
          "maxclass": "comment",
          "patching_rect": [
            740,
            158,
            760,
            22
          ],
          "fontsize": 14,
          "text": "ONE-CLICK DEMO: click the button; it starts Node-for-Max, then runs fetch -> download -> mark -> synthesize."
        }
      },
      {
        "box": {
          "id": "topDemoButton",
          "maxclass": "button",
          "patching_rect": [
            740,
            188,
            34,
            34
          ]
        }
      },
      {
        "box": {
          "id": "topDemoTrig",
          "maxclass": "newobj",
          "patching_rect": [
            790,
            194,
            50,
            22
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "topDemoStart",
          "maxclass": "message",
          "patching_rect": [
            855,
            180,
            105,
            22
          ],
          "text": "script start"
        }
      },
      {
        "box": {
          "id": "topDemoDelay",
          "maxclass": "newobj",
          "patching_rect": [
            855,
            214,
            90,
            22
          ],
          "text": "delay 1800"
        }
      },
      {
        "box": {
          "id": "topDemoRun",
          "maxclass": "message",
          "patching_rect": [
            965,
            214,
            115,
            22
          ],
          "text": "run_full_flow"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "topStart",
            0
          ],
          "destination": [
            "topBridgeSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topDiag",
            0
          ],
          "destination": [
            "topControllerSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topFetch",
            0
          ],
          "destination": [
            "topBridgeSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topDownload",
            0
          ],
          "destination": [
            "topBridgeSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topMark",
            0
          ],
          "destination": [
            "topBridgeSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topSynth",
            0
          ],
          "destination": [
            "topControllerSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topClear",
            0
          ],
          "destination": [
            "topControllerSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topVoiceOff",
            0
          ],
          "destination": [
            "topVoiceLevel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topVoiceOn",
            0
          ],
          "destination": [
            "topVoiceLevel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topEunOff",
            0
          ],
          "destination": [
            "topEunLevel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topEunOn",
            0
          ],
          "destination": [
            "topEunLevel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topJanOff",
            0
          ],
          "destination": [
            "topJanLevel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topJanOn",
            0
          ],
          "destination": [
            "topJanLevel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topTaeOff",
            0
          ],
          "destination": [
            "topTaeLevel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topTaeOn",
            0
          ],
          "destination": [
            "topTaeLevel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topRunFull",
            0
          ],
          "destination": [
            "topControllerSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topDemoButton",
            0
          ],
          "destination": [
            "topDemoTrig",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topDemoTrig",
            1
          ],
          "destination": [
            "topDemoStart",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topDemoStart",
            0
          ],
          "destination": [
            "topBridgeSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topDemoTrig",
            0
          ],
          "destination": [
            "topDemoDelay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topDemoDelay",
            0
          ],
          "destination": [
            "topDemoRun",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "topDemoRun",
            0
          ],
          "destination": [
            "topControllerSend",
            0
          ]
        }
      }
    ]
  }
}