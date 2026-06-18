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
      60,
      60,
      980,
      430
    ],
    "gridsize": [
      15,
      15
    ],
    "boxes": [
      {
        "box": {
          "id": "c0",
          "maxclass": "comment",
          "patching_rect": [
            10,
            10,
            900,
            20
          ],
          "text": "bp_diagnostics | manual controls only | diagnostics isolated from real synthesis/upload",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "fetch",
          "maxclass": "message",
          "patching_rect": [
            10,
            45,
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
          "id": "download",
          "maxclass": "message",
          "patching_rect": [
            115,
            45,
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
          "id": "mark",
          "maxclass": "message",
          "patching_rect": [
            235,
            45,
            130,
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
          "id": "synth",
          "maxclass": "message",
          "patching_rect": [
            375,
            45,
            90,
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
          "id": "diag",
          "maxclass": "message",
          "patching_rect": [
            475,
            45,
            155,
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
          "id": "clear",
          "maxclass": "message",
          "patching_rect": [
            640,
            45,
            55,
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
          "id": "sctrl",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            90,
            180,
            22
          ],
          "text": "s sc_controller_commands",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sbridge",
          "maxclass": "newobj",
          "patching_rect": [
            225,
            90,
            165,
            22
          ],
          "text": "s sc_bridge_commands",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            10,
            130,
            850,
            20
          ],
          "text": "Local file buttons load max/downloads/star_N.wav via Node path resolver, then playstar N tests buffer playback.",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "load0",
          "maxclass": "message",
          "patching_rect": [
            10,
            170,
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
          "id": "play0",
          "maxclass": "message",
          "patching_rect": [
            270,
            170,
            80,
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
          "id": "load1",
          "maxclass": "message",
          "patching_rect": [
            10,
            198,
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
          "id": "play1",
          "maxclass": "message",
          "patching_rect": [
            270,
            198,
            80,
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
          "id": "load2",
          "maxclass": "message",
          "patching_rect": [
            10,
            226,
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
          "id": "play2",
          "maxclass": "message",
          "patching_rect": [
            270,
            226,
            80,
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
          "id": "load3",
          "maxclass": "message",
          "patching_rect": [
            10,
            254,
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
          "id": "play3",
          "maxclass": "message",
          "patching_rect": [
            270,
            254,
            80,
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
          "id": "load4",
          "maxclass": "message",
          "patching_rect": [
            10,
            282,
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
          "id": "play4",
          "maxclass": "message",
          "patching_rect": [
            270,
            282,
            80,
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
          "id": "load5",
          "maxclass": "message",
          "patching_rect": [
            10,
            310,
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
          "id": "play5",
          "maxclass": "message",
          "patching_rect": [
            270,
            310,
            80,
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
          "id": "load6",
          "maxclass": "message",
          "patching_rect": [
            10,
            338,
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
          "id": "play6",
          "maxclass": "message",
          "patching_rect": [
            270,
            338,
            80,
            22
          ],
          "text": "playstar 6",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "mStarDefault",
          "maxclass": "message",
          "patching_rect": [
            10,
            405,
            150,
            22
          ],
          "text": "0.72",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "mStarDefaultSend",
          "maxclass": "newobj",
          "patching_rect": [
            180,
            405,
            130,
            22
          ],
          "text": "s sc_star_level",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "mVoiceDefault",
          "maxclass": "message",
          "patching_rect": [
            10,
            435,
            150,
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
          "id": "mVoiceDefaultSend",
          "maxclass": "newobj",
          "patching_rect": [
            180,
            435,
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
          "id": "mEunminDefault",
          "maxclass": "message",
          "patching_rect": [
            10,
            465,
            150,
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
          "id": "mEunminDefaultSend",
          "maxclass": "newobj",
          "patching_rect": [
            180,
            465,
            130,
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
          "id": "mJaniceDefault",
          "maxclass": "message",
          "patching_rect": [
            10,
            495,
            150,
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
          "id": "mJaniceDefaultSend",
          "maxclass": "newobj",
          "patching_rect": [
            180,
            495,
            130,
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
          "id": "mTaewanDefault",
          "maxclass": "message",
          "patching_rect": [
            10,
            525,
            150,
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
          "id": "mTaewanDefaultSend",
          "maxclass": "newobj",
          "patching_rect": [
            180,
            525,
            130,
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
          "id": "mLayersOff",
          "maxclass": "message",
          "patching_rect": [
            350,
            435,
            150,
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
          "id": "mLayersOffSend",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            435,
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
          "id": "mEunminOff",
          "maxclass": "message",
          "patching_rect": [
            350,
            465,
            150,
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
          "id": "mEunminOffSend",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            465,
            130,
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
          "id": "mJaniceOff",
          "maxclass": "message",
          "patching_rect": [
            350,
            495,
            150,
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
          "id": "mJaniceOffSend",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            495,
            130,
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
          "id": "mTaewanOff",
          "maxclass": "message",
          "patching_rect": [
            350,
            525,
            150,
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
          "id": "mTaewanOffSend",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            525,
            130,
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
          "id": "levelNote",
          "maxclass": "comment",
          "patching_rect": [
            10,
            375,
            790,
            22
          ],
          "text": "Layer level presets: left column restores conservative defaults; right column mutes transformation/optional layers for baseline voice checks.",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "runFull",
          "maxclass": "message",
          "patching_rect": [
            705,
            45,
            115,
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
          "id": "runFullNote",
          "maxclass": "comment",
          "patching_rect": [
            705,
            75,
            310,
            22
          ],
          "text": "One-click full flow: script start first, then run_full_flow.",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "runDemoNote",
          "maxclass": "comment",
          "patching_rect": [
            705,
            105,
            520,
            22
          ],
          "text": "ONE-CLICK DEMO: starts bridge, waits, then runs the full backend flow automatically."
        }
      },
      {
        "box": {
          "id": "runDemoButton",
          "maxclass": "button",
          "patching_rect": [
            705,
            135,
            32,
            32
          ]
        }
      },
      {
        "box": {
          "id": "runDemoTrig",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            140,
            50,
            22
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "runDemoStart",
          "maxclass": "message",
          "patching_rect": [
            815,
            126,
            105,
            22
          ],
          "text": "script start"
        }
      },
      {
        "box": {
          "id": "runDemoDelay",
          "maxclass": "newobj",
          "patching_rect": [
            815,
            160,
            90,
            22
          ],
          "text": "delay 1800"
        }
      },
      {
        "box": {
          "id": "runDemoRun",
          "maxclass": "message",
          "patching_rect": [
            925,
            160,
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
            "fetch",
            0
          ],
          "destination": [
            "sbridge",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "download",
            0
          ],
          "destination": [
            "sbridge",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mark",
            0
          ],
          "destination": [
            "sbridge",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "synth",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "diag",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clear",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load0",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play0",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load1",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play1",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load2",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play2",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load3",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play3",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load4",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play4",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load5",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play5",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load6",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play6",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mStarDefault",
            0
          ],
          "destination": [
            "mStarDefaultSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mVoiceDefault",
            0
          ],
          "destination": [
            "mVoiceDefaultSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mEunminDefault",
            0
          ],
          "destination": [
            "mEunminDefaultSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mJaniceDefault",
            0
          ],
          "destination": [
            "mJaniceDefaultSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mTaewanDefault",
            0
          ],
          "destination": [
            "mTaewanDefaultSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mLayersOff",
            0
          ],
          "destination": [
            "mLayersOffSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mEunminOff",
            0
          ],
          "destination": [
            "mEunminOffSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mJaniceOff",
            0
          ],
          "destination": [
            "mJaniceOffSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mTaewanOff",
            0
          ],
          "destination": [
            "mTaewanOffSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "runFull",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "runDemoButton",
            0
          ],
          "destination": [
            "runDemoTrig",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "runDemoTrig",
            1
          ],
          "destination": [
            "runDemoStart",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "runDemoStart",
            0
          ],
          "destination": [
            "sbridge",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "runDemoTrig",
            0
          ],
          "destination": [
            "runDemoDelay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "runDemoDelay",
            0
          ],
          "destination": [
            "runDemoRun",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "runDemoRun",
            0
          ],
          "destination": [
            "sctrl",
            0
          ]
        }
      }
    ]
  }
}