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
            760,
            20
          ],
          "text": "bp_bridge | trusted backend route only | raw bridge events are not printed because star URLs may be signed",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "r-cmd",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            45,
            160,
            22
          ],
          "text": "r sc_bridge_commands",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "node",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            80,
            210,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "node.script maxBridge.js",
          "textfile": {
            "filename": "maxBridge.js",
            "flags": 0,
            "embed": 0,
            "autowatch": 1
          },
          "saved_object_attributes": {
            "autostart": 0,
            "defer": 0,
            "node_bin_path": "",
            "npm_bin_path": "",
            "watch": 0
          }
        }
      },
      {
        "box": {
          "id": "s-events",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            120,
            150,
            22
          ],
          "text": "s sc_bridge_events",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "m-start",
          "maxclass": "message",
          "patching_rect": [
            250,
            45,
            90,
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
          "id": "m-stop",
          "maxclass": "message",
          "patching_rect": [
            350,
            45,
            80,
            22
          ],
          "text": "script stop",
          "numinlets": 2,
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
            160,
            780,
            20
          ],
          "text": "Receives sc_bridge_commands; emits sc_bridge_events for controller. Use node.script console status, not raw URL debug printing.",
          "numinlets": 1,
          "numoutlets": 0
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "r-cmd",
            0
          ],
          "destination": [
            "node",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "m-start",
            0
          ],
          "destination": [
            "node",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "m-stop",
            0
          ],
          "destination": [
            "node",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "node",
            0
          ],
          "destination": [
            "s-events",
            0
          ]
        }
      }
    ]
  }
}
