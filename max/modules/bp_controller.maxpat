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
            840,
            20
          ],
          "text": "bp_controller | keeps Stage 1 fetch/download/synthesize/verify/upload sequence | js ../synthEngine.js",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "r-bridge",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            45,
            140,
            22
          ],
          "text": "r sc_bridge_events",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "r-manual",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            45,
            170,
            22
          ],
          "text": "r sc_controller_commands",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "js",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            85,
            170,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "text": "js ../synthEngine.js"
        }
      },
      {
        "box": {
          "id": "s-synth",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            125,
            160,
            22
          ],
          "text": "s sc_synth_commands",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s-bridge",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            125,
            170,
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
            165,
            800,
            20
          ],
          "text": "Preserves star IDs/order from bridge; oscillator diagnostic remains isolated from real synthesis.",
          "numinlets": 1,
          "numoutlets": 0
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "r-bridge",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r-manual",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            0
          ],
          "destination": [
            "s-synth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            1
          ],
          "destination": [
            "s-bridge",
            0
          ]
        }
      }
    ]
  }
}
