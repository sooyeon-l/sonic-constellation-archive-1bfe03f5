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
      1180,
      720
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
          "text": "bp_recorder | verified open/start/stop only; upload is gated in maxBridge verifyRecording",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "r",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            45,
            150,
            22
          ],
          "text": "r sc_synth_commands",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "route",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            85,
            310,
            22
          ],
          "numinlets": 2,
          "numoutlets": 5,
          "outlettype": [
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route record_open record_start record_stop dsp_start"
        }
      },
      {
        "box": {
          "id": "open",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            125,
            95,
            22
          ],
          "text": "prepend open",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "m1",
          "maxclass": "message",
          "patching_rect": [
            120,
            125,
            30,
            22
          ],
          "text": "1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "m0",
          "maxclass": "message",
          "patching_rect": [
            165,
            125,
            30,
            22
          ],
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "dsp",
          "maxclass": "message",
          "patching_rect": [
            210,
            125,
            85,
            22
          ],
          "text": "; dsp start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "rinl",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            180,
            130,
            22
          ],
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "receive~ sc_final_l"
        }
      },
      {
        "box": {
          "id": "rinr",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            180,
            130,
            22
          ],
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "receive~ sc_final_r"
        }
      },
      {
        "box": {
          "id": "rec",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            225,
            100,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "text": "sfrecord~ 2"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            10,
            270,
            900,
            20
          ],
          "text": "Expected sequence: absolute path -> open, 1, MSP signal, 0, verifyRecording, uploadSynth only after recording_verified.",
          "numinlets": 1,
          "numoutlets": 0
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "r",
            0
          ],
          "destination": [
            "route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            0
          ],
          "destination": [
            "open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "open",
            0
          ],
          "destination": [
            "rec",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            1
          ],
          "destination": [
            "m1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "m1",
            0
          ],
          "destination": [
            "rec",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            2
          ],
          "destination": [
            "m0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "m0",
            0
          ],
          "destination": [
            "rec",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            3
          ],
          "destination": [
            "dsp",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rinl",
            0
          ],
          "destination": [
            "rec",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rinr",
            0
          ],
          "destination": [
            "rec",
            1
          ]
        }
      }
    ]
  }
}
