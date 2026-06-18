{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 4,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 34.0, 77.0, 1639.0, 908.0 ],
        "boxes": [
            {
                "box": {
                    "id": "topDemoButton",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 721.0, 225.0, 34.0, 34.0 ]
                }
            },
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 1120.0, 20.0 ],
                    "text": "SONIC CONSTELLATION MAIN | modular Stage 2 integration | verified backend contract preserved | fallback: constellation_synth.maxpat"
                }
            },
            {
                "box": {
                    "id": "label-0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 26.0, 241.0, 520.0, 20.0 ],
                    "text": "Bridge: Node-for-Max backend contract"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-0",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_bridge.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 26.0, 265.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 606.0, 203.0, 520.0, 20.0 ],
                    "text": "Controller: verified Stage 1 sequencing"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-1",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_controller.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 606.0, 265.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1186.0, 241.0, 520.0, 20.0 ],
                    "text": "Star Bank: buffers s_0..s_6 and original playback"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-2",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_star_bank.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1186.0, 265.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 26.0, 521.0, 520.0, 20.0 ],
                    "text": "Shared Analysis: pitch/amplitude"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-3",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_analysis.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 26.0, 545.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 606.0, 521.0, 520.0, 20.0 ],
                    "text": "Hyerin Mapping: pitch color and amplitude intensity"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-4",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_hyerin_mapping.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 606.0, 545.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1186.0, 521.0, 520.0, 20.0 ],
                    "text": "Native Voice Engine: conservative support layer"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-5",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_voice_engine.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1186.0, 545.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 26.0, 801.0, 520.0, 20.0 ],
                    "text": "Eunmin Timbre: register branches"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-6",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_eunmin_timbre.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 26.0, 825.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 606.0, 801.0, 520.0, 20.0 ],
                    "text": "Janice Response: onset gestures"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-7",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_janice_response.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 606.0, 825.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1186.0, 801.0, 520.0, 20.0 ],
                    "text": "Taewan Visuals: Jitter and optional effects"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-8",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_taewan_visuals.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1186.0, 825.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 26.0, 1081.0, 520.0, 20.0 ],
                    "text": "Arrangement Mix: final stereo bus"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-9",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_arrangement_mix.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 26.0, 1105.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 606.0, 1081.0, 520.0, 20.0 ],
                    "text": "Recorder: sfrecord and output gate"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-10",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_recorder.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 606.0, 1105.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "label-11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1186.0, 1081.0, 520.0, 20.0 ],
                    "text": "Diagnostics: manual tests and local star controls"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 1,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "bp-11",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bp_diagnostics.maxpat",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1186.0, 1105.0, 520.0, 220.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "topControls",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 52.0, 980.0, 20.0 ],
                    "text": "DEMO CONTROLS: use these instead of opening bpatchers. Click left to right for real backend flow."
                }
            },
            {
                "box": {
                    "id": "topStart",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 82.0, 116.0, 22.0 ],
                    "text": "script start"
                }
            },
            {
                "box": {
                    "id": "topDiag",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 82.0, 172.0, 22.0 ],
                    "text": "recorder_diagnostic"
                }
            },
            {
                "box": {
                    "id": "topFetch",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 355.0, 82.0, 116.0, 22.0 ],
                    "text": "fetchPending"
                }
            },
            {
                "box": {
                    "id": "topDownload",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 495.0, 82.0, 124.0, 22.0 ],
                    "text": "downloadStars"
                }
            },
            {
                "box": {
                    "id": "topMark",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 82.0, 148.0, 22.0 ],
                    "text": "markSynthesizing"
                }
            },
            {
                "box": {
                    "id": "topSynth",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 825.0, 82.0, 100.0, 22.0 ],
                    "text": "synthesize"
                }
            },
            {
                "box": {
                    "id": "topClear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 950.0, 82.0, 90.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "topBridgeSend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 122.0, 160.0, 22.0 ],
                    "text": "s sc_bridge_commands"
                }
            },
            {
                "box": {
                    "id": "topControllerSend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 122.0, 190.0, 22.0 ],
                    "text": "s sc_controller_commands"
                }
            },
            {
                "box": {
                    "id": "topLevels",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1120.0, 52.0, 260.0, 20.0 ],
                    "text": "LAYER QUICK CONTROLS"
                }
            },
            {
                "box": {
                    "id": "topVoiceOff",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1120.0, 82.0, 45.0, 22.0 ],
                    "text": "0."
                }
            },
            {
                "box": {
                    "id": "topVoiceOn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1165.0, 82.0, 45.0, 22.0 ],
                    "text": "0.18"
                }
            },
            {
                "box": {
                    "id": "topEunOff",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1230.0, 82.0, 45.0, 22.0 ],
                    "text": "0."
                }
            },
            {
                "box": {
                    "id": "topEunOn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1275.0, 82.0, 45.0, 22.0 ],
                    "text": "0.18"
                }
            },
            {
                "box": {
                    "id": "topJanOff",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1340.0, 82.0, 45.0, 22.0 ],
                    "text": "0."
                }
            },
            {
                "box": {
                    "id": "topJanOn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1385.0, 82.0, 45.0, 22.0 ],
                    "text": "0.12"
                }
            },
            {
                "box": {
                    "id": "topTaeOff",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1450.0, 82.0, 45.0, 22.0 ],
                    "text": "0."
                }
            },
            {
                "box": {
                    "id": "topTaeOn",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1495.0, 82.0, 45.0, 22.0 ],
                    "text": "0.08"
                }
            },
            {
                "box": {
                    "id": "topVoiceLabel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1120.0, 112.0, 90.0, 20.0 ],
                    "text": "voice off/on"
                }
            },
            {
                "box": {
                    "id": "topEunLabel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1230.0, 112.0, 100.0, 20.0 ],
                    "text": "Eunmin off/on"
                }
            },
            {
                "box": {
                    "id": "topJanLabel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1340.0, 112.0, 100.0, 20.0 ],
                    "text": "Janice off/on"
                }
            },
            {
                "box": {
                    "id": "topTaeLabel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1450.0, 112.0, 100.0, 20.0 ],
                    "text": "Taewan off/on"
                }
            },
            {
                "box": {
                    "id": "topVoiceLevel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1120.0, 142.0, 130.0, 22.0 ],
                    "text": "s sc_voice_level"
                }
            },
            {
                "box": {
                    "id": "topEunLevel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1230.0, 142.0, 140.0, 22.0 ],
                    "text": "s sc_eunmin_level"
                }
            },
            {
                "box": {
                    "id": "topJanLevel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1370.0, 142.0, 135.0, 22.0 ],
                    "text": "s sc_janice_level"
                }
            },
            {
                "box": {
                    "id": "topTaeLevel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1510.0, 142.0, 135.0, 22.0 ],
                    "text": "s sc_taewan_level"
                }
            },
            {
                "box": {
                    "id": "topRunFull",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 38.0, 170.0, 120.0, 22.0 ],
                    "text": "run_full_flow"
                }
            },
            {
                "box": {
                    "id": "topRunNote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 163.0, 171.0, 560.0, 20.0 ],
                    "text": "ONE CLICK: starts fetch -> download -> mark -> synthesize. Use after script start."
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "topDemoNote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 712.0, 166.0, 760.0, 23.0 ],
                    "text": "ONE-CLICK DEMO: click the button; it starts Node-for-Max, then runs fetch -> download -> mark -> synthesize."
                }
            },
            {
                "box": {
                    "id": "topDemoTrig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 776.0, 231.0, 50.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "topDemoStart",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 841.0, 202.0, 105.0, 22.0 ],
                    "text": "script start"
                }
            },
            {
                "box": {
                    "id": "topDemoDelay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 848.5, 237.0, 90.0, 22.0 ],
                    "text": "delay 1800"
                }
            },
            {
                "box": {
                    "id": "topDemoRun",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 955.0, 237.0, 115.0, 22.0 ],
                    "text": "run_full_flow"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "topControllerSend", 0 ],
                    "midpoints": [ 959.5, 117.0, 239.5, 117.0 ],
                    "source": [ "topClear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topDemoTrig", 0 ],
                    "midpoints": [ 730.5, 261.0, 771.0, 261.0, 771.0, 228.0, 785.5, 228.0 ],
                    "source": [ "topDemoButton", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topDemoRun", 0 ],
                    "midpoints": [ 858.0, 261.0, 951.0, 261.0, 951.0, 234.0, 964.5, 234.0 ],
                    "source": [ "topDemoDelay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topControllerSend", 0 ],
                    "midpoints": [ 964.5, 261.0, 708.0, 261.0, 708.0, 234.0, 558.0, 234.0, 558.0, 204.0, 159.0, 204.0, 159.0, 156.0, 216.0, 156.0, 216.0, 117.0, 239.5, 117.0 ],
                    "source": [ "topDemoRun", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topBridgeSend", 0 ],
                    "midpoints": [ 850.5, 225.0, 756.0, 225.0, 756.0, 261.0, 708.0, 261.0, 708.0, 234.0, 558.0, 234.0, 558.0, 204.0, 24.0, 204.0, 24.0, 117.0, 49.5, 117.0 ],
                    "source": [ "topDemoStart", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topDemoDelay", 0 ],
                    "midpoints": [ 785.5, 255.0, 843.0, 255.0, 843.0, 234.0, 858.0, 234.0 ],
                    "source": [ "topDemoTrig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topDemoStart", 0 ],
                    "midpoints": [ 816.5, 255.0, 756.0, 255.0, 756.0, 261.0, 708.0, 261.0, 708.0, 234.0, 603.0, 234.0, 603.0, 198.0, 850.5, 198.0 ],
                    "source": [ "topDemoTrig", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topControllerSend", 0 ],
                    "midpoints": [ 179.5, 114.0, 239.5, 114.0 ],
                    "source": [ "topDiag", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topBridgeSend", 0 ],
                    "midpoints": [ 504.5, 156.0, 27.0, 156.0, 27.0, 117.0, 49.5, 117.0 ],
                    "source": [ "topDownload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topEunLevel", 0 ],
                    "midpoints": [ 1239.5, 105.0, 1227.0, 105.0, 1227.0, 135.0, 1239.5, 135.0 ],
                    "source": [ "topEunOff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topEunLevel", 0 ],
                    "midpoints": [ 1284.5, 105.0, 1227.0, 105.0, 1227.0, 135.0, 1239.5, 135.0 ],
                    "source": [ "topEunOn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topBridgeSend", 0 ],
                    "midpoints": [ 364.5, 105.0, 216.0, 105.0, 216.0, 156.0, 27.0, 156.0, 27.0, 117.0, 49.5, 117.0 ],
                    "source": [ "topFetch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topJanLevel", 0 ],
                    "midpoints": [ 1349.5, 105.0, 1335.0, 105.0, 1335.0, 135.0, 1379.5, 135.0 ],
                    "source": [ "topJanOff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topJanLevel", 0 ],
                    "midpoints": [ 1394.5, 105.0, 1335.0, 105.0, 1335.0, 135.0, 1379.5, 135.0 ],
                    "source": [ "topJanOn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topBridgeSend", 0 ],
                    "midpoints": [ 659.5, 156.0, 27.0, 156.0, 27.0, 117.0, 49.5, 117.0 ],
                    "source": [ "topMark", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topControllerSend", 0 ],
                    "midpoints": [ 47.5, 195.0, 24.0, 195.0, 24.0, 156.0, 216.0, 156.0, 216.0, 117.0, 239.5, 117.0 ],
                    "source": [ "topRunFull", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topBridgeSend", 0 ],
                    "midpoints": [ 49.5, 105.0, 49.5, 105.0 ],
                    "source": [ "topStart", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topControllerSend", 0 ],
                    "midpoints": [ 834.5, 117.0, 239.5, 117.0 ],
                    "source": [ "topSynth", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topTaeLevel", 0 ],
                    "midpoints": [ 1459.5, 105.0, 1446.0, 105.0, 1446.0, 135.0, 1519.5, 135.0 ],
                    "source": [ "topTaeOff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topTaeLevel", 0 ],
                    "midpoints": [ 1504.5, 105.0, 1551.0, 105.0, 1551.0, 138.0, 1519.5, 138.0 ],
                    "source": [ "topTaeOn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topVoiceLevel", 0 ],
                    "midpoints": [ 1129.5, 105.0, 1116.0, 105.0, 1116.0, 135.0, 1129.5, 135.0 ],
                    "source": [ "topVoiceOff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "topVoiceLevel", 0 ],
                    "midpoints": [ 1174.5, 105.0, 1116.0, 105.0, 1116.0, 135.0, 1129.5, 135.0 ],
                    "source": [ "topVoiceOn", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}