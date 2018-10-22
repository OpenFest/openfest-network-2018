# IP ranges assignments

## VLANs
ID | IP/Range | Name | Notes
---|----------|------|---------
10 | single ip | external | Provided by ???
20 | 10.20.0.0/24 | mgmt |
21 | 10.21.0.0/22 | wired | wired clients / workshop
22 | 10.22.0.0/22 | wireless | ap
23 | 10.23.0.0/24 | video | video team
24 | 10.24.0.0/24 | overflow | overflow TV's
25 | 10.25.0.0/24 | reception | Reception related

## Assignments

### MGMT
IP | Name | Notes
---|------|------
.1 | eric | router/services
.2 | eagle | backup
.11 | coresw | CORE
.21 | vocsw-A | video team switch room A
.22 | vocsw-B | video team switch room B
.27 | vocsw-C | video team switch room B
.23 | nocsw | NOC/team switch
.24 | wssw1 | workshop area switch
.25 | wssw2 | workshop area switch
.26 | receptionsw | reception area switch
.28 | connectionsw | special connection switch (not confirmed)
.29 | fl2sw | Second floor trunk switch
.50 | ap-cf-f-l | ap conf floor left foaier
.51 | ap-cf-f-r | ap conf floor right foaier
.52 | ap-cf-mr-1 | ap conf floor main room
.53 | ap-cf-mr-2 | ap conf floor main room
.54 | ap-cf-mr-3 | ap conf floor main room
.55 | ap-cf-mr-4 | ap conf floor main room
.56 | ap-cf-sr-1 | ap conf floor second room
.57 | ap-cf-sr-2 | ap conf floor second room
.58 | ap-cf-ch   | ap conf floor chillout area
.59 | ap-cf-qws  | ap conf floor quiet workshop area
.60 | ap-ws-ws1  | ap workshop floor workshop area
.61 | ap-ws-ws2  | ap workshop floor workshop area
.62 | ap-ws-noc  | ap workshop floor NOC/team room
.63 | ap-spare-1 | Spare AP#1
.64 | ap-spare-2 | Spare AP#2
.65 | ap-spare-3 | Spare AP#3

### Video
IP | Name | Notes
---|------|------
.1 | eric |
.5 | videosw-A | main room Blackmagic video switcher
.6 | scaler-A | Atlona scaler in room A
.7 | videosw-B | second room Blackmagic video switcher
.8 | fbox-camera | FOSDEM cambox in room C
.9 | fbox-slides | FOSDEM slidebox in room C
.21 | stream-A | main room streamer
.22 | stream-B | second room streamer
.23 | stream-C | third room streamer/control
.31 | control-A-1 | main room laptop/controller ???
.32 | control-A-2 | main room laptop/controller ???
.35 | icom-A-1 | RPI intercom receiver 1 - main room
.36 | icom-A-2 | RPI intercom receiver 1 - main room
.37 | icom-A-3 | RPI intercom receiver 1 - main room
.41 | control-B-1 | second room laptop/controller ???
.42 | control-B-2 | second room laptop/controller ???
.45 | icom-B-1 | RPI intercom receiver 1 - second room
.46 | icom-B-2 | RPI intercom receiver 1 - second room
.47 | icom-B-3 | RPI intercom receiver 1 - second room

### Overflow
IP | Name | Notes
---|------|------
.1 | eric |
.11 | tv-1 | overflow RPI

### Wired
IP | Name | Notes
---|------|------
0.1 | eric |
0.20 | presenter-A | presenter wired connection in main room
0.30 | presenter-B | presenter wired connection in second room
0.40 | presenter-C | presenter wired connection in second room

### Reception
IP | Name | Notes
---|------|------
.1 | eric |
.11 | printer-1 | printer reception
