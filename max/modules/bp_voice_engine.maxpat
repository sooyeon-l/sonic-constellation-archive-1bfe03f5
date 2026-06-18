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
            850,
            20
          ],
          "text": "bp_voice_engine | native Max support layer; keeps diagnostics separate from real original voices",
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
            80,
            430,
            22
          ],
          "numinlets": 2,
          "numoutlets": 9,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route setfreq setsubfreq setpan setfilter setnoise setenv alloff setvoicegain"
        }
      },
      {
        "box": {
          "id": "osc",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            120,
            85,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "cycle~ 440"
        }
      },
      {
        "box": {
          "id": "sub",
          "maxclass": "newobj",
          "patching_rect": [
            110,
            120,
            85,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "cycle~ 220"
        }
      },
      {
        "box": {
          "id": "noise",
          "maxclass": "newobj",
          "patching_rect": [
            210,
            120,
            65,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "noise~"
        }
      },
      {
        "box": {
          "id": "ngain",
          "maxclass": "newobj",
          "patching_rect": [
            285,
            120,
            60,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0."
        }
      },
      {
        "box": {
          "id": "sum1",
          "maxclass": "newobj",
          "patching_rect": [
            70,
            165,
            40,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "sum2",
          "maxclass": "newobj",
          "patching_rect": [
            130,
            165,
            40,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "env",
          "maxclass": "newobj",
          "patching_rect": [
            210,
            165,
            75,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "line~ 0."
        }
      },
      {
        "box": {
          "id": "vca",
          "maxclass": "newobj",
          "patching_rect": [
            130,
            210,
            45,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "gain",
          "maxclass": "newobj",
          "patching_rect": [
            130,
            250,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.08"
        }
      },
      {
        "box": {
          "id": "send",
          "maxclass": "newobj",
          "patching_rect": [
            130,
            290,
            145,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "text": "send~ sc_voice_mix"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            10,
            335,
            820,
            20
          ],
          "text": "This layer is quiet by default; recorder_diagnostic temporarily raises setvoicegain and alloff hard-mutes it afterward.",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "offenv",
          "maxclass": "message",
          "patching_rect": [
            610,
            120,
            40,
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
          "id": "offnoise",
          "maxclass": "message",
          "patching_rect": [
            610,
            155,
            40,
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
          "id": "offfreq",
          "maxclass": "message",
          "patching_rect": [
            610,
            190,
            40,
            22
          ],
          "text": "0.",
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
            "osc",
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
            "sub",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            4
          ],
          "destination": [
            "ngain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            5
          ],
          "destination": [
            "env",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc",
            0
          ],
          "destination": [
            "sum1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sub",
            0
          ],
          "destination": [
            "sum1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noise",
            0
          ],
          "destination": [
            "ngain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sum1",
            0
          ],
          "destination": [
            "sum2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ngain",
            0
          ],
          "destination": [
            "sum2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sum2",
            0
          ],
          "destination": [
            "vca",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "env",
            0
          ],
          "destination": [
            "vca",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "vca",
            0
          ],
          "destination": [
            "gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gain",
            0
          ],
          "destination": [
            "send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            6
          ],
          "destination": [
            "offenv",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            6
          ],
          "destination": [
            "offnoise",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            6
          ],
          "destination": [
            "offfreq",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "offenv",
            0
          ],
          "destination": [
            "env",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "offnoise",
            0
          ],
          "destination": [
            "ngain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "offfreq",
            0
          ],
          "destination": [
            "osc",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "offfreq",
            0
          ],
          "destination": [
            "sub",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            7
          ],
          "destination": [
            "gain",
            1
          ]
        }
      }
    ]
  }
}
