-- MVStore
CREATE ALIAS IF NOT EXISTS READ_BLOB_MAP FOR 'org.h2.tools.Recover.readBlobMap';
CREATE ALIAS IF NOT EXISTS READ_CLOB_MAP FOR 'org.h2.tools.Recover.readClobMap';
-- LOB
CREATE TABLE IF NOT EXISTS INFORMATION_SCHEMA.LOB_BLOCKS(LOB_ID BIGINT, SEQ INT, DATA VARBINARY, PRIMARY KEY(LOB_ID, SEQ));
-- lobMap.size: 0
-- lobData.size: 0
-- Layout
-- chunk.33cc = chunk:33cc,block:1e,len:6,pages:14,livePages:a,max:6d30,liveMax:5700,map:20d,next:24,root:cf30000158818,time:1d04d0f7e,unusedAtVersion:3d80,version:33cc,toc:5d75,occupancy:81f80e
-- chunk.3de9 = chunk:3de9,block:33,len:2,pages:6,livePages:2,max:2300,liveMax:e00,map:20d,next:35,root:f7a4000033045,time:1d0c618c4,unusedAtVersion:3de9,version:3de9,toc:1f25,occupancy:39
-- chunk.3dea = chunk:3dea,block:9,len:2,pages:5,livePages:1,max:1d00,liveMax:800,map:20d,next:35,root:f7a800001ff45,time:1d0c62d6a,unusedAtVersion:3dea,version:3dea,toc:1a63,occupancy:1d
-- chunk.3deb = chunk:3deb,block:35,len:4,pages:d,livePages:8,max:4000,liveMax:2840,map:20d,next:39,root:f7ac00008f8c5,time:1d0c63012,unusedAtVersion:3deb,version:3deb,toc:3648,occupancy:081d
-- chunk.3dec = chunk:3dec,block:b,len:2,pages:7,livePages:2,max:2040,liveMax:880,map:20d,next:d,root:f7b0000023f45,time:1d0c63243,unusedAtVersion:3def,version:3dec,toc:1b64,occupancy:75
-- chunk.3ded = chunk:3ded,block:d,len:2,pages:8,livePages:3,max:1e40,liveMax:700,map:20d,next:f,root:f7b400001f205,time:1d0c63471,unusedAtVersion:3def,version:3ded,toc:1a2d,occupancy:e5
-- chunk.3dee = chunk:3dee,block:f,len:2,pages:4,livePages:1,max:1540,liveMax:100,map:20d,next:39,root:f7b8000002c05,time:1d0c6369b,unusedAtVersion:3dee,version:3dee,toc:13dc,occupancy:0d
-- chunk.3def = chunk:3def,block:11,len:2,pages:7,livePages:2,max:1a50,liveMax:6c0,map:20d,next:39,root:f7bc00001c645,time:1d0c64e62,unusedAtVersion:3df5,version:3def,toc:197b,occupancy:75
-- chunk.3df0 = chunk:3df0,block:39,len:3,pages:a,livePages:4,max:2980,liveMax:1480,map:20d,next:3c,root:f7c000004d9c5,time:1d0c6508f,unusedAtVersion:3df3,version:3df0,toc:25c8,occupancy:a903
-- chunk.3df1 = chunk:3df1,block:3c,len:2,pages:6,livePages:1,max:16a0,liveMax:80,map:20d,next:3e,root:f7c4000006c07,time:1d0c65d4b,unusedAtVersion:3df2,version:3df1,toc:1431,occupancy:3d
-- chunk.3df2 = chunk:3df2,block:13,len:1,pages:5,livePages:2,max:5b0,liveMax:50,map:20d,next:1d,root:f7c8000003b47,time:1d0c66a56,unusedAtVersion:3df2,version:3df2,toc:5ac,occupancy:1c
-- chunk.3df3 = chunk:3df3,block:2b,len:2,pages:8,livePages:3,max:2080,liveMax:940,map:20d,next:3e,root:f7cc000025b45,time:1d0c67500,unusedAtVersion:3dfa,version:3df3,toc:1bcd,occupancy:e5
-- chunk.3df4 = chunk:3df4,block:3e,len:2,pages:5,livePages:1,max:1f00,liveMax:800,map:20d,next:40,root:f7d000001fd45,time:1d0c67e79,unusedAtVersion:3df4,version:3df4,toc:1a55,occupancy:1d
-- chunk.3df5 = chunk:3df5,block:40,len:3,pages:7,livePages:1,max:2540,liveMax:600,map:20d,next:43,root:f7d4000036945,time:1d0c68a6d,unusedAtVersion:3dfe,version:3df5,toc:2005,occupancy:77
-- chunk.3df6 = chunk:3df6,block:14,len:2,pages:a,livePages:7,max:1c70,liveMax:830,map:20d,next:43,root:f7d800001c785,time:1d0c68e91,unusedAtVersion:3df6,version:3df6,toc:197e,occupancy:8003
-- chunk.3df7 = chunk:3df7,block:16,len:2,pages:5,livePages:1,max:1d00,liveMax:800,map:20d,next:43,root:f7dc00001ff45,time:1d0c69456,unusedAtVersion:3df7,version:3df7,toc:1a5d,occupancy:1d
-- chunk.3df8 = chunk:3df8,block:18,len:2,pages:5,livePages:1,max:1d00,liveMax:800,map:20d,next:43,root:f7e000001ff45,time:1d0c69683,unusedAtVersion:3df9,version:3df8,toc:1a5d,occupancy:1d
-- chunk.3df9 = chunk:3df9,block:1a,len:2,pages:5,livePages:1,max:1980,liveMax:80,map:20d,next:1c,root:f7e4000006c05,time:1d0c698ad,unusedAtVersion:3dfa,version:3df9,toc:1411,occupancy:1d
-- chunk.3dfa = chunk:3dfa,block:1c,len:2,pages:5,livePages:1,max:2100,liveMax:800,map:20d,next:24,root:f7e800001ff45,time:1d0c6a640,unusedAtVersion:3dfa,version:3dfa,toc:1a5e,occupancy:1d
-- chunk.3dfb = chunk:3dfb,block:24,len:3,pages:b,livePages:7,max:34c0,liveMax:1bc0,map:20d,next:43,root:f7ec0000631c5,time:1d0c6aad4,unusedAtVersion:3dfd,version:3dfb,toc:2b26,occupancy:4007
-- chunk.3dfc = chunk:3dfc,block:27,len:2,pages:6,livePages:3,max:1d70,liveMax:930,map:20d,next:29,root:f7f0000020d45,time:1d0c6b0e4,unusedAtVersion:3dfc,version:3dfc,toc:1a95,occupancy:38
-- chunk.3dfd = chunk:3dfd,block:29,len:2,pages:4,livePages:1,max:14a0,liveMax:60,map:20d,next:2d,root:f7f4000004145,time:1d0c6be47,unusedAtVersion:3dfd,version:3dfd,toc:1366,occupancy:0e
-- chunk.3dfe = chunk:3dfe,block:2d,len:2,pages:5,livePages:2,max:1760,liveMax:120,map:20d,next:2f,root:f7f8000006605,time:1d0c6c459,unusedAtVersion:3dfe,version:3dfe,toc:13f9,occupancy:1c
-- chunk.e50 = chunk:e50,block:5,len:7,pages:1a,livePages:1,max:6fc0,liveMax:400,map:123,root:394000016c454,time:15ea0905b,unusedAtVersion:e53,version:e50,toc:5eb7,occupancy:ffffff01
-- meta.id = 1
-- root.1 = f7f0000002c03
-- root.10 = f7f8000002c0b
-- root.11a = f7c8000002c02
-- root.11b = f7c8000003500
-- root.132 = f7d8000012303
-- root.133 = f7d800001b141
-- root.167 = f7d8000002c14
-- root.168 = f7d8000010146
-- root.16b = f7d8000011384
-- root.2 = f7ac000002c0b
-- root.5 = f7fc000002c05
-- root.b = f7ec000002c0b
-- root.cd = f7ec00004a245
-- root.ce = f7ec00005e086
-- root.e = f7f4000002c06
-- root.f = f7ac00007e6d4
-- Meta
-- map.10 = name:index.21,createVersion:3,key:8b890d13,val:c64c3cce
-- map.112 = name:table.33,createVersion:e0c,key:8fa25204,val:5eaca19a
-- map.113 = name:index.36,createVersion:e0c,key:8b898172,val:c618c7a7
-- map.114 = name:index.8,createVersion:e0c,key:8b898902,val:c618c7a7
-- map.11a = name:table.11,createVersion:e28,key:8fa25204,val:5eb2888f
-- map.11b = name:index.38,createVersion:e28,key:8b890d13,val:ff751ef4
-- map.132 = name:table.40,createVersion:f61,key:8fa25204,val:5eaca19a
-- map.133 = name:index.41,createVersion:f61,key:8b898172,val:eb82481b
-- map.167 = name:table.22,createVersion:fb6,key:8fa25204,val:42dc6ef9
-- map.168 = name:index.44,createVersion:fb6,key:8b8da7d9,val:b0c703b2
-- map.16b = name:index.46,createVersion:fb6,key:8b8dab97,val:b0c703b2
-- map.2 = name:_
-- map.20b = name:undoLog.1,createVersion:30d1
-- map.20c = name:undoLog.2,createVersion:30d1
-- map.20d = name:undoLog.3,createVersion:30d3
-- map.3 = name:openTransactions
-- map.5 = name:table.0,key:8fa25204,val:5803b3f1
-- map.6 = name:lobMap,key:8fa25204,val:f4470498
-- map.7 = name:tempLobMap,key:8fa25204,val:59a6a071
-- map.8 = name:lobRef,key:eabe0274,val:1377b1a0
-- map.9 = name:lobData,key:8fa25204,val:59a6a071
-- map.b = name:table.3,createVersion:2,key:8fa25204,val:5eb2888f
-- map.cd = name:table.4,createVersion:93f,key:8fa25204,val:c6a36c75
-- map.ce = name:index.24,createVersion:93f,key:8b8bdddd,val:f0289834
-- map.e = name:table.12,createVersion:2,key:8fa25204,val:5eb2888f
-- map.f = name:table.16,createVersion:2,key:8fa25204,val:32b6e533
-- name._ = 2
-- name.index.21 = 10
-- name.index.24 = ce
-- name.index.36 = 113
-- name.index.38 = 11b
-- name.index.41 = 133
-- name.index.44 = 168
-- name.index.46 = 16b
-- name.index.8 = 114
-- name.lobData = 9
-- name.lobMap = 6
-- name.lobRef = 8
-- name.openTransactions = 3
-- name.table.0 = 5
-- name.table.11 = 11a
-- name.table.12 = e
-- name.table.16 = f
-- name.table.22 = 167
-- name.table.3 = b
-- name.table.33 = 112
-- name.table.4 = cd
-- name.table.40 = 132
-- name.tempLobMap = 7
-- name.undoLog.1 = 20b
-- name.undoLog.2 = 20c
-- name.undoLog.3 = 20d
-- Types
-- 10b87ff6 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 110620d = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 11574592 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 12214f2f = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 13234ac9 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 135e49b2 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 1377b1a0 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 13e1e816 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 15186ce0 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 15d5a01e = org.h2.mvstore.tx.VersionedValueType@15d5a01e
-- 1640f20f = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 17c53dfb = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 17d2b646 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 182cc69e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 1c92a549 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 1e477944 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 1fd37440 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 213835b6 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 22aee519 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 247bbfba = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 25109608 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 2513155a = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 25b74370 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 261275ae = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 26d028f7 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 2707c790 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 27438750 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 27502e5c = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 278de2b2 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 2913ca3e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 29d3d0fb = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 2a4e939a = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 2d4f67e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 2dd3d39d = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 2e929182 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 30af23fd = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 30c7be6f = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 314f59b = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 315b5913 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 31ab4859 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 31d4b3e8 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 32b6e533 = org.h2.mvstore.tx.VersionedValueType@32b6e533
-- 33215ffb = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 3348c987 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 352e5a82 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 3562e7c7 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 36525ab = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 38022758 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 3a2bb026 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 3b0ed98a = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 3dda8a2e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 3eb9c575 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 3f0c6b3c = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 3f322610 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 416a4275 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 42576db9 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 42dc6ef9 = org.h2.mvstore.tx.VersionedValueType@42dc6ef9
-- 42ff9a77 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 4403bff8 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 47fa3671 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 481ed95c = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 48632f69 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 48ae9e8b = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 4afcae7 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 4b343b6d = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 4bdb04c8 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 4d4b019e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 4eb63dc8 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 50bf795f = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 51132514 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 5423a17 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 543b0737 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 5597ca3 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 5803b3f1 = org.h2.mvstore.tx.VersionedValueType@5803b3f1
-- 58182b96 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 59a2d756 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 59a6a071 = org.h2.mvstore.type.ByteArrayDataType@59a6a071
-- 5a48d186 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 5bb97fe7 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 5d221b20 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 5eaca19a = org.h2.mvstore.tx.VersionedValueType@5eaca19a
-- 5eb2888f = org.h2.mvstore.tx.VersionedValueType@5eb2888f
-- 6029f2a4 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 60816371 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 63262071 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 65fc8edc = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 66d2885c = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 6cd2cb2 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 6cf047cf = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 6dcf7b6a = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 6e948f1c = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 6eaa6b0c = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 6f289728 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 708769b7 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7198ab9a = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 72324965 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7254838 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7540160e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 756c67cd = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 75d97e18 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7645e64 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7657d90b = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7740b0ab = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 79308a2 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7bf65e0f = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7c0de229 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7c226095 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7de6549d = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7ea07516 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 7ec13984 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 81008a59 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 811c0840 = org.h2.mvstore.tx.VersionedValueType@811c0840
-- 8428a87a = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 8584f431 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 8819964e = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 8ac512e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 8b890d13 = org.h2.mvstore.db.RowDataType@8b890d13
-- 8b898172 = org.h2.mvstore.db.RowDataType@8b898172
-- 8b898902 = org.h2.mvstore.db.RowDataType@8b898902
-- 8b8aed9f = org.h2.mvstore.db.RowDataType@8b8aed9f
-- 8b8af15d = org.h2.mvstore.db.RowDataType@8b8af15d
-- 8b8b61fe = org.h2.mvstore.db.RowDataType@8b8b61fe
-- 8b8b65bc = org.h2.mvstore.db.RowDataType@8b8b65bc
-- 8b8b697e = org.h2.mvstore.db.RowDataType@8b8b697e
-- 8b8bd65d = org.h2.mvstore.db.RowDataType@8b8bd65d
-- 8b8bda1b = org.h2.mvstore.db.RowDataType@8b8bda1b
-- 8b8bdddd = org.h2.mvstore.db.RowDataType@8b8bdddd
-- 8b8c4abc = org.h2.mvstore.db.RowDataType@8b8c4abc
-- 8b8c4e7a = org.h2.mvstore.db.RowDataType@8b8c4e7a
-- 8b8cbf1b = org.h2.mvstore.db.RowDataType@8b8cbf1b
-- 8b8cc2d9 = org.h2.mvstore.db.RowDataType@8b8cc2d9
-- 8b8d337a = org.h2.mvstore.db.RowDataType@8b8d337a
-- 8b8d3738 = org.h2.mvstore.db.RowDataType@8b8d3738
-- 8b8da7d9 = org.h2.mvstore.db.RowDataType@8b8da7d9
-- 8b8dab97 = org.h2.mvstore.db.RowDataType@8b8dab97
-- 8c995a38 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 8d23a6f8 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 8e82f289 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 8f735ce8 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 8fa25204 = org.h2.mvstore.type.LongDataType@8fa25204
-- 91383296 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 915d7c4 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- 92c1bb1f = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 9451cf1b = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 976ce0d7 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 97c41719 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 98708cf0 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 9b8db0a6 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 9d255432 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 9d58a207 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 9d9513e5 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 9e0fb603 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- 9ee089a6 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a057eaa3 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a07b9b60 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a0e2f376 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a27b3dc5 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a2df0d5 = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- a357c3e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- a36c5465 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a4a326f4 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a5bce4d9 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a709c40b = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a8ddd9f3 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a919edfb = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- a9366f47 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ab9bf878 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- abfab4ea = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ae458082 = org.h2.mvstore.tx.VersionedValueType@ae458082
-- aecdd361 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- b0c703b2 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- b3e90532 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- b5127fca = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- b5baee1f = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- b61dad1f = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- b8f4f604 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- b9cbcaa1 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ba131a46 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- bb91e662 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- bbaf0272 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c023e18e = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c2e93b28 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c2feb095 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c37b7f61 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c46cc8fc = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c583f298 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c618c7a7 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c64c3cce = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c665c4dc = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c6a36c75 = org.h2.mvstore.tx.VersionedValueType@c6a36c75
-- c6a692e = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- c6da6578 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c71ac241 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- c9a92827 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- cae8f92e = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- cb7cf42a = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- cd174bf0 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d062f1cd = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d079b779 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d1944789 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d21ec556 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d25fd30a = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d2a885cc = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d3f6a1dc = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d42bef63 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d62f78f5 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d65ea8c5 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d7ef7b10 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- d951e440 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- dbc5c4c5 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- dc2e5aaa = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- dd97dc40 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- df0ef150 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- df167dbb = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e015d7ec = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e0596aa9 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e460d47d = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e490c537 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e4ef3e86 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e594ae93 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e5fc3301 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e61ad295 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e67344e9 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- e8e10740 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ea09ab7e = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ea37e652 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- eabe0274 = org.h2.mvstore.db.LobStorageMap$BlobReference$Type@eabe0274
-- eb82481b = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ed39aa36 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ee3554e4 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ef103d48 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- efe49ab = org.h2.mvstore.db.NullValueDataType@3ac3fd8b
-- f0289834 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f02b1b66 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f08cce1e = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f14032d4 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f23c4afe = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f25aa7b7 = org.h2.mvstore.tx.VersionedValueType@f25aa7b7
-- f26ba332 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f2780a3e = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f2b66fdc = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f329f8c0 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f3eba599 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f403b8d8 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f4470498 = org.h2.mvstore.db.LobStorageMap$BlobMeta$Type@f4470498
-- f7956877 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- f8e85ef3 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- fba91cec = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- fc284750 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- fce85d95 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- ff751ef4 = org.h2.mvstore.tx.VersionedValueType@eff870e5
-- Tables
---- Schema SET ----
SET CREATE_BUILD 224;
---- Table Data ----
CREATE TABLE O_22(C0 VARCHAR, C1 VARCHAR, C2 VARCHAR, C3 VARCHAR, C4 VARCHAR, C5 VARCHAR, C6 VARCHAR, C7 VARCHAR, C8 VARCHAR, C9 VARCHAR, C10 VARCHAR, C11 VARCHAR);
INSERT INTO O_22 VALUES(43, '[Aeropuerto Internacional Ezeiza (Bs As), AU Tte. Gral. Pablo Riccheri Km 33,5,, Argentina, Provincia de Buenos Aires, Ezeiza]', DATE '2025-11-30', DATE '2025-11-30', 10, 1, 36.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(58, NULL, DATE '2025-12-20', DATE '2025-12-18', 22, 1, 114.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(60, NULL, DATE '2025-12-31', DATE '2025-12-31', 12, 1, 58.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(63, NULL, DATE '2025-12-25', DATE '2025-12-18', 21, 1, 576.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(65, NULL, DATE '2025-12-25', DATE '2025-12-23', 11, 1, 114.0, '123', '10/29', 'Carlos A. Tevez', '1234123412341234', 'TARJETA');
INSERT INTO O_22 VALUES(66, NULL, DATE '2025-12-22', DATE '2025-12-17', 9, 1, 150.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(68, NULL, DATE '2025-12-31', DATE '2025-12-31', 23, 1, 118.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(69, NULL, DATE '2025-12-13', DATE '2025-12-11', 23, 1, 177.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(73, NULL, DATE '2026-01-15', DATE '2026-01-02', 9, 1, 350.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(75, NULL, DATE '2026-01-23', DATE '2026-01-16', 22, 1, 304.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(76, NULL, DATE '2025-12-28', DATE '2025-12-28', 5, 1, 28.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(77, NULL, DATE '2025-12-31', DATE '2025-12-30', 21, 1, 144.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(78, NULL, DATE '2026-01-18', DATE '2026-01-04', 24, 24, 630.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(79, NULL, DATE '2025-12-31', DATE '2025-12-31', 5, 24, 28.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(80, NULL, DATE '2026-07-04', DATE '2026-07-04', 12, 24, 58.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(81, NULL, DATE '2025-12-29', DATE '2025-12-29', 23, 24, 118.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(82, NULL, DATE '2025-12-29', DATE '2025-12-29', 12, 24, 58.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(83, NULL, DATE '2025-12-27', DATE '2025-12-27', 12, 24, 58.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(84, NULL, DATE '2025-12-26', DATE '2025-12-26', 22, 24, 76.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(86, NULL, DATE '2025-12-31', DATE '2025-12-24', 36, 24, 464.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
INSERT INTO O_22 VALUES(87, NULL, DATE '2025-12-31', DATE '2025-12-25', 33, 1, 203.0, NULL, NULL, NULL, NULL, 'EFECTIVO');
CREATE TABLE O_11(C0 VARCHAR, C1 VARCHAR);
INSERT INTO O_11 VALUES(1, 22);
INSERT INTO O_11 VALUES(1, 9);
INSERT INTO O_11 VALUES(1, 1);
INSERT INTO O_11 VALUES(24, 24);
INSERT INTO O_11 VALUES(1, 21);
INSERT INTO O_11 VALUES(1, 25);
CREATE TABLE O_12(C0 VARCHAR, C1 VARCHAR);
INSERT INTO O_12 VALUES(1, 'Lujo');
INSERT INTO O_12 VALUES(3, 'Hatchback');
INSERT INTO O_12 VALUES(5, 'Deportivo');
INSERT INTO O_12 VALUES(6, 'SUV');
INSERT INTO O_12 VALUES(8, U&'Econ\00f3mico');
INSERT INTO O_12 VALUES(15, 'Compacto');
INSERT INTO O_12 VALUES(17, 'Pick-up');
CREATE TABLE O_3(C0 VARCHAR, C1 VARCHAR);
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295789/s0dprrp581dyxarkuq86.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295791/osadqzw0jxuokxgxos1g.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295792/p0nptpptpyblbpphglgg.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295793/ntudchuoh8eqluy51zvs.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295795/gma4oxzuiyrmc8korwz8.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295796/jgbnzezbibfjj4lncfx8.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295797/u8gpcb7yztbdm4eaaaiy.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295799/m1wwaso2iaf4jdngbdek.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295800/uluuxtyjkmv7v4kzhyvz.webp');
INSERT INTO O_3 VALUES(24, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295801/gffsmljmkgnhwfzdn5st.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996497/aodao8ulwk8vnxewtmhb.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996498/j9jseokqlf0bm5fo30sr.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996500/uokcwfjjantwtcycv5xx.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996502/iuc8cbnblfbqr5sriwqt.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996503/imyolnbiibfqwvwyoofn.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996505/n7plzz99ealyltqu1fs7.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996506/d63bysozldevqkchwfet.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996508/w7zdrwxuvrycbkkiegoh.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996509/bfpbsr7lpm2iqy1tr5lw.webp');
INSERT INTO O_3 VALUES(10, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996511/i5wluplcrkv2a9apdfgo.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765291275/fu2rhlleib0nrxp6gprk.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765291277/xmojpef5v5lucg6juwrl.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765291278/id9djbkwifks7nlyifyr.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765291280/n0lo7yq6dz4hy5jeskjg.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765291281/o2xthtancocg4gnkn4br.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765291283/i0gevgq6xg79k1szlzzm.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765295972/yjpobjytpjwvvarvk4zh.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996703/pzinqbugs7qesrzcq7iv.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996706/ic1jqo5rk3rn2yorbesm.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996710/bqyqtrma25l40hiysqeh.webp');
INSERT INTO O_3 VALUES(5, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996714/uk8lvhfrrzlutz6pkypr.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996937/imtzy6nnxq4ueum1ukb1.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996939/qvjit4p1nx4hhezajxkk.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996940/flhymvwmvm1oxl3nezlx.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996942/ntfeljun5d5sggpmav6w.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996943/fuxba5twg9zda1g3gic1.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996945/hxiblwh5m6cbassrfnnv.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996947/ip3pobwedvwjpnhkvx18.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996948/nxtmchdtod5lxuyplj4p.webp');
INSERT INTO O_3 VALUES(30, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996949/r0e0r9toyndjvnbp7qas.webp');
INSERT INTO O_3 VALUES(32, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997387/f1h5qg0yy0trm70xzmw5.webp');
INSERT INTO O_3 VALUES(32, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997389/fps1e0zwwcgojhvmrdkp.webp');
INSERT INTO O_3 VALUES(32, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997391/iadpkjmwc1b7lhwff7mf.webp');
INSERT INTO O_3 VALUES(32, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997392/vabyt7u0oenrnmdnn1qs.webp');
INSERT INTO O_3 VALUES(32, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997394/j4wtm7hkkobjuovhuxvl.webp');
INSERT INTO O_3 VALUES(32, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997395/qlg4cshyyfntvn7fmuoh.webp');
INSERT INTO O_3 VALUES(32, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997398/psovdrxzbnacxccxdrit.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997100/y9eb23hi94f5u73lsy4o.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997102/hoqcbiju3qisol9ztp2k.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997103/krangjfjd8ukdr9ad2e6.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997105/vy4obfj46dyaignecq6i.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997106/q2eopef9kisfddthbrzr.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997107/wks8fyy6gbf4jzgqcbiu.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997108/icnkrxsyize0qhjofbbu.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997110/ixz1exblvhdwestgcozf.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997111/oj2xeokmydhycxxof19l.webp');
INSERT INTO O_3 VALUES(31, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997113/ucfjcwy1ta48rduap15d.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996086/pwv8ik15vkwgh2clyomb.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996087/in2yhaep8bb5innypjmc.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996089/ebcymyc5mpbwxylz46ea.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996090/utlnl4fipxw2zd20pwav.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996092/fsopp9aryolsnksuj1ta.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996094/riooi4x45npghowilemv.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996095/bzd6e1kop75hurvfkt2a.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996097/k4l6zdezg5g64voatnt9.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996098/xgywe8o1ekgd01q4sdk7.webp');
INSERT INTO O_3 VALUES(29, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765996100/d2sp9ozvkjhf9yzslan4.webp');
INSERT INTO O_3 VALUES(28, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995954/hhecwsfc4duakpe9t60n.webp');
INSERT INTO O_3 VALUES(28, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995955/vhuc7uqdqw7ovz7gufnj.webp');
INSERT INTO O_3 VALUES(28, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995956/mzipudtulsflssi8shlt.webp');
INSERT INTO O_3 VALUES(28, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995957/cagicaulvqedj6kc1qpx.webp');
INSERT INTO O_3 VALUES(28, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995959/cwwv345neerfsdyzorpr.webp');
INSERT INTO O_3 VALUES(28, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995960/dojeqfgj929um8ruduoa.webp');
INSERT INTO O_3 VALUES(27, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995718/fppzup7xeehl5bymunid.webp');
INSERT INTO O_3 VALUES(27, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995719/yt1jgmr1tcwi2srjzwlm.webp');
INSERT INTO O_3 VALUES(27, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995721/rawuxfoqof99hy7bkfjf.webp');
INSERT INTO O_3 VALUES(27, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995722/wbsyer8o3icq5haeevds.webp');
INSERT INTO O_3 VALUES(27, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995724/ea2hmndq6qavlt5rat7i.webp');
INSERT INTO O_3 VALUES(27, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995726/vpykdsodau4umou4tt6s.webp');
INSERT INTO O_3 VALUES(27, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995728/e40qtwtqqlydgit5bf2b.webp');
INSERT INTO O_3 VALUES(27, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995730/zmzg5junom4xpviawxwk.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995516/oin3a8tqqplttwep8efo.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995517/ojdht3x24oltxwwifn30.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995519/ldwyykjymwssaksxgkgr.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995520/yxktgzp3bokkpdoumb4k.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995522/w18kpzrffplekt51mv1o.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995523/ydjruy5cybphzbt6d9ki.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995524/y1gf9x2t5hgluij0i1qa.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995526/niifylnj1m7ctrzmje60.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995527/qbdkijl4aeoeclnnmg7x.webp');
INSERT INTO O_3 VALUES(26, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995529/x8fkod2semqumau8hnwn.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995093/dhckezgalbji9puf6kv7.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995095/g3maweb8lxc29q5bpefj.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995096/m1ap0s2vlehudloq1kte.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995097/qwgm1mdo8fdbfposigrv.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995099/rmefkyoyswlks1irdvh4.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995100/mzrihzbhdse9yyfd2l1s.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995102/ptdshto7iujaq9ceazyj.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995104/imesl41ej3nw9batyfmg.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995105/xuqfmbdwioma2xvoujse.webp');
INSERT INTO O_3 VALUES(25, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765995107/s9npy6hbkuqpioyc6jmb.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998146/walc5uqpm9hoxo1cp9tb.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998147/jyzmngdxft9fwrkiwqgl.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998148/iqcpxj7sqgwm72eyfopk.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998149/dmzx19gjim1wajzkqonw.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998151/vlbodw5enppycm2wjhjv.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998152/kb9oyuy7wuy8x2vbn4vy.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998153/dg7a2epk0rsp1gvzij4q.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998155/gh5htetykgj6435145sq.webp');
INSERT INTO O_3 VALUES(1, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998156/fms9jcceuu9bf9tsk0kk.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998324/q0vzsfqvfaojyb5f1ba9.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998325/dmdyysfe5vlaxnbekpgz.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998327/a0ggtllzxer1xtztckss.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998328/ahlua47fj9oileol1yzh.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998330/igdkmdutkcyzo0vvj9rm.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998332/xysfuku7q1zz5f4il5id.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998334/hevpslkj802910px0yl4.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998335/rgcrkunccwihfcx4ralw.webp');
INSERT INTO O_3 VALUES(33, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998337/nes1da5chzw1dovxyf3e.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998941/jupdixbu6wgmyau7nep9.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998942/vzjuvzkw81pviepmb9h7.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998944/muwzczmlamwonacnq659.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998946/woqclhhzhfdxh5z8ahjj.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998947/vsygr3a7w8cyniagr3vy.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998949/xxak7nselbaf2uycyx9h.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998950/kdlkt37bwriqxvblekfw.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998952/iepeazqcsxejdrh8pwzc.webp');
INSERT INTO O_3 VALUES(36, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998953/l1e1wvmd91hfmzgyxjox.webp');
INSERT INTO O_3 VALUES(35, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998688/yf9m4voxmqftrukrrc6m.webp');
INSERT INTO O_3 VALUES(35, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998689/aovpg3jxzs0kjouzlwpv.webp');
INSERT INTO O_3 VALUES(35, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998692/xzv1bhnekkyn2apn7pre.webp');
INSERT INTO O_3 VALUES(35, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998693/zpra11pgspk6zidfvnzv.webp');
INSERT INTO O_3 VALUES(35, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998695/i9noiaxua3tb9nxpceof.webp');
INSERT INTO O_3 VALUES(35, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998696/hnbtn4eqd3chkjokmncz.webp');
INSERT INTO O_3 VALUES(35, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998697/il2pkptyr9dmptm8wlaw.webp');
INSERT INTO O_3 VALUES(35, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998699/fl4ihxrx6t8xuohpcvts.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999302/wno0xp2fjuioehyk8uqu.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999304/udfpcd0siy16wn2xyfhi.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999304/hdatkqrw5jt3bogwqgji.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999306/htohetlfevmulcxlwax5.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999307/fe5pljncga0jjmxfsf62.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999308/g9awele8ciauginhmvxc.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999309/q4saituwtnuaqeajeyll.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999311/iopstppdpiphkbo3l7vb.webp');
INSERT INTO O_3 VALUES(37, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999312/w8jqpptlvohid3mwad3w.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999459/i0mch2w0pdwks6fs5g78.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999460/slw3te2zyeu5d3x3cdaf.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999461/jdm0a2rpc87koq1yysex.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999463/ef4phhp1ajro9eaxsl52.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999465/u2zw7y8jhnd7rxarvewf.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999466/ho22nzbdcdoi88ewelhw.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999467/x3hkdruoxiecjmvsyyx8.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999468/tdni5r7sdeugzkwcqr0s.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999469/ofp4ylyr4kzflfupwjmd.webp');
INSERT INTO O_3 VALUES(38, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999470/xuqd7vjgsxnxezd7s6zv.webp');
INSERT INTO O_3 VALUES(39, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999698/gbmjhlycknq00lfh88hk.webp');
INSERT INTO O_3 VALUES(39, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999700/pd2maiadubmklr527xss.webp');
INSERT INTO O_3 VALUES(39, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999701/x2v9ktakdcl6pmqje38v.webp');
INSERT INTO O_3 VALUES(39, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999703/xffl1iejgqczz9wyl6mi.webp');
INSERT INTO O_3 VALUES(39, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999704/c0kjbfdpesdkkaby36xu.webp');
INSERT INTO O_3 VALUES(39, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999706/pxk9ggx9mtwyccup4yfd.webp');
INSERT INTO O_3 VALUES(39, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999707/v3ab9pibnjw6mmekopzc.webp');
INSERT INTO O_3 VALUES(39, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999708/npo952hryrxpjosvzaw3.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999939/mrup2wtrqxmndkzxvdqw.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999940/bvtf7piayfe1v5ch5tix.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999942/zafmowdhgvhfmikiukyy.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999943/fnssnowlbl9ed6u2wrof.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999945/e4m35kcidlop9xk4kfxh.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999946/lpqfxwioixw4l7dktrkh.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999948/nwv6njjjndeadrbh51ft.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999951/mobuakutdkds3yzjxvoi.webp');
INSERT INTO O_3 VALUES(40, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765999952/vvjff4pmtfvfzt22a3hb.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000139/nypqzckoye1rn4ir4wsl.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000141/xc9rvnygv7qb97gljoa2.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000142/vrunzmw5tpjwmixp03l4.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000143/vk8xwrweurpolrkwxboe.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000145/jawtoibftxkocf7i5gi1.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000147/vk2cvahjzqlbjrgymkne.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000148/ik8hracuqhmml8sdctln.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000150/qcwqzala3yaimv3njdg8.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000151/rasyb1j03x6hogfcks8x.webp');
INSERT INTO O_3 VALUES(9, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000153/zsinjeffaumsfihyuv5n.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000646/ploo7ydvekaidqclqygu.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000647/nwxsalitmvmhzottsign.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000649/eqaz4unoleb0kiifmutx.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000650/gdkti7vh5zmv6efk44z9.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000651/qqbaofoz3fjc5p90dx5m.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000652/fsrb9gmziqmzeanq4ad1.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000654/p6fhefom39d8uatdrkgd.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000655/zzlokkbfhgudrzrrri18.webp');
INSERT INTO O_3 VALUES(41, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000656/rejjy6efowqeud2thwza.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000783/bwuct9jhjk2qzqzkktwl.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000784/i4vsz1jrgwkmbgxwfeqz.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000786/wsetfmjmld8jtcbdvxnx.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000788/urw5rawpkcoxtytttjpw.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000790/p9ny9j137awb15uhwhf4.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000792/h6c8xm3ft9n8wuptyyps.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000793/pqiuuyr7ioskiwkterfk.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000795/fu0cgvnl1i3olsuke3th.webp');
INSERT INTO O_3 VALUES(42, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000796/kiqjaiy5fxwxhcgw32oj.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000924/dhtz9e4ybgljewuko2xy.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000926/o2sylq2sn3qfbubw975q.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000927/jtd90nyvnnfy9nft3oai.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000928/qwx7sxhhei9xgugwcw5g.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000932/bfayt7em2lzli0whj8g5.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000934/izu3trj6jyneqte3hx3u.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000935/mettrtbjqlhcrslxivdf.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000937/qipzum6acf6ze0qeweqi.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000938/c2qoceww1aze246jxjoo.webp');
INSERT INTO O_3 VALUES(43, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766000939/qvthhylqmepq8fx2hsbo.webp');
INSERT INTO O_3 VALUES(44, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001070/gphciufmncwobad1b0jt.webp');
INSERT INTO O_3 VALUES(44, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001072/ysramrhkg0izjsfndxen.webp');
INSERT INTO O_3 VALUES(44, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001073/eawrtfclki9jkmxooncy.webp');
INSERT INTO O_3 VALUES(44, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001074/wvotn0tczqzy5aghy04a.webp');
INSERT INTO O_3 VALUES(44, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001075/gujzomxnkuq8jwauekkx.webp');
INSERT INTO O_3 VALUES(44, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001077/ovccxuipf2rttug0bmqt.webp');
INSERT INTO O_3 VALUES(44, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001078/i3kskr3oam41bx9ktu09.webp');
INSERT INTO O_3 VALUES(44, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001079/ec7zmqexbg8lldbmyiqx.webp');
INSERT INTO O_3 VALUES(22, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1763655001/zy7v61mfivelusghz1le.webp');
INSERT INTO O_3 VALUES(22, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1763655002/ekirmaklx607mk88rzmc.webp');
INSERT INTO O_3 VALUES(22, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1763655003/puq5szbgdz9lkgmm9vsw.webp');
INSERT INTO O_3 VALUES(22, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1763655004/rx19tfqdbns3sq5pokfn.webp');
INSERT INTO O_3 VALUES(22, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1763655006/q3bchdq8m8j2krdtsvpl.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001471/xbojdhfywwzxgokiiitj.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001472/l2hmjpcsf16pyebmk2n6.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001474/urjamcjlj9tug1jedbao.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001475/ckc2pb9bjgahnfogwu12.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001477/vlcmvbiwh2sc3bidncwz.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001478/mqwdspjx5opnrrcnezp5.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001480/plrdmz6b5mxt9rorgwom.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001481/s1xfpsi1jg8pdqx1p9wb.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001482/u55pfd1mqo6afdbkzrds.webp');
INSERT INTO O_3 VALUES(21, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001484/fospdcsfvmcntsxqmb5w.webp');
INSERT INTO O_3 VALUES(12, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001712/skkz9st8rtlfpypdpko6.webp');
INSERT INTO O_3 VALUES(12, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001713/mwiiik3mnm0vaadjshia.webp');
INSERT INTO O_3 VALUES(12, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001715/d0xwq8kmeur0fdem9wig.webp');
INSERT INTO O_3 VALUES(12, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001716/k6jho7crlzn3z9jlu74c.webp');
INSERT INTO O_3 VALUES(12, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001717/rgunyrnipjutq9vktsm2.webp');
INSERT INTO O_3 VALUES(12, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001720/hxkcr9m1skirit2v0rir.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001951/veac4w3nchaehulz0o1r.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001953/xkmwvrjpharercchmtnn.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001954/bnstwpf8j6cqxstuzdbc.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001956/u7ngtwfkxrorm4qvygx7.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001957/ywthl31foxl0e1ovahl5.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001959/xinhpzxospbbc4eclu94.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001961/cwm71mol0hbstdvrzosj.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001962/ffq6nzix6s5i7yirpjb5.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001963/rprx9e21uxivu9g6l4ze.webp');
INSERT INTO O_3 VALUES(11, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1766001964/rwanathavlqwiu3zukxi.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998507/zfl61kceglfzsfizubfg.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998508/lwyckmf9jrp7iqodbikq.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998510/xpf2zqrlp8yepnfogwbs.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998512/rnprwe7denqiz0bz6oej.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998514/q4gifmnnbz3gufjbmita.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998515/ths5shl4u7mqvhoc0evr.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998516/ceccxrrqu6uyvyzzggz2.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998518/mf924yesbnusevwqxvkg.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998519/lqzp1j2bghbxcp04qdqu.webp');
INSERT INTO O_3 VALUES(34, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765998521/rsko3gnjgamt3b7n06jt.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997892/grfnxsheuzabdzfiuzsb.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997894/kc2ddrbpxsmuhkkag0bx.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997895/eu9jeozess8mmoqzbrst.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997896/psaw7ynvuoihk5wkok8j.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997898/smzkpyc52moz9ygxlncg.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997899/scow69jrtufahvigxhlu.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997900/o1jslbovg0mfe6wir2ad.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997902/q3pmeyx35bceyc0y7w7y.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997903/vggjvyms3akconmmaik3.webp');
INSERT INTO O_3 VALUES(23, 'https://res.cloudinary.com/dshvpcyud/image/upload/v1765997904/pmmtmxb442c8zphgveom.webp');
CREATE TABLE O_4(C0 VARCHAR, C1 VARCHAR, C2 VARCHAR, C3 VARCHAR, C4 VARCHAR, C5 VARCHAR, C6 VARCHAR, C7 VARCHAR);
INSERT INTO O_4 VALUES(1, 'Peugeot', ARRAY ['Color: Gris', 'Combustible: Nafta', 'Motor: 1.0', 'Puertas: 5', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Autom\00e1tica'], U&'Peugeot 2008 1.0T Allure 2025\000aSUV Compacta', '2008 1.0T Allure', 50000, 6, 19);
INSERT INTO O_4 VALUES(5, 'Peugeot', ARRAY ['Color: Blanco', 'Combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 5', 'Motor: 1.2'], 'Peugeot 208 1.2 Like 2020 ', '208 1.2 Like ', 50, 15, 14);
INSERT INTO O_4 VALUES(9, 'BMW', ARRAY ['Color: Blanco', 'Combustible: Nafta', U&'Transmisi\00f3n: Autom\00e1tica', 'Puertas: 4', 'Motor: 2.0'], 'BMW Serie 3 2.0 320i Sedan Sportline 2025', 'Serie 3 2.0 320i Sedan Sportline', 55, 1, 60);
INSERT INTO O_4 VALUES(10, 'Volkswagen', ARRAY ['Color: Negro', 'Combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 5', 'Motor: 1.6'], 'Volkswagen Gol Trend 1.6 Pack Iii 101cv', 'Gol Trend 1.6 Pack Iii 101cv', NULL, 15, 18);
INSERT INTO O_4 VALUES(11, 'Peugeot', ARRAY ['Color: Azul', 'Tipo de combustible: Nafta', U&'Transmisi\00f3n: Autom\00e1tica', 'Puertas: 5', 'Motor: 1.6'], 'Peugeot 3008 1.6 Gt Pack 180Cv 2025', '3008 1.6 Gt Pack 180Cv', NULL, 6, 65);
INSERT INTO O_4 VALUES(12, 'Mini', ARRAY ['Color: Gris', 'Combustible: Nafta', U&'Transmisi\00f3n: Autom\00e1tica', 'Puertas: 5', 'Motor: 2.0'], 'Mini Cooper S 2.0 F65 Classic 204Cv 5P 2025', 'Cooper S 2.0 F65 Classic 204Cv 5P', NULL, 3, 41);
INSERT INTO O_4 VALUES(21, 'Mercedes-Benz', ARRAY [' Color: Negro', 'Combustible: Nafta', 'Motor: 3.0', 'Puertas: 5', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Autom\00e1tica'], 'Mercedes-Benz Clase GLK 3.0 Glk300 4matic Sport 231cv At 2012', 'Clase GLK 3.0 Glk300 4matic Sport 231cv At', NULL, 6, 32);
INSERT INTO O_4 VALUES(22, 'Mercedes-Benz', ARRAY ['Color: gris', 'Puertas: 4', U&'Sensor de estacionamiento: S\00ed', 'Combustible: Nafta'], 'Mercedes-Benz Clase C 3.0 C350 2011', 'Clase C 3.0 C350', NULL, 1, 38);
INSERT INTO O_4 VALUES(23, 'Chevrolet ', ARRAY [' Color: Blanco', U&'Combustible: Di\00e9sel', 'Motor: 2.8', 'Puertas: 4', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Autom\00e1tica'], 'Chevrolet S-10 2.8 Cd Ltz 4X4 207Cv At 2025', 'S-10 2.8 Cd Ltz 4X4 207Cv At', NULL, 17, 59);
INSERT INTO O_4 VALUES(24, 'BAIC', ARRAY [U&'Tipo de combustible: H\00edbrido/Nafta', 'Puertas: 5', U&'Transmisi\00f3n: autom\00e1tica', 'Sensor de estacionamiento: Si'], 'BAIC BJ30 1.5T Bj30 2Wd Hybrid negra', 'BJ30 1.5T Bj30 2Wd Hybrid', NULL, 6, 42);
INSERT INTO O_4 VALUES(25, 'Fiat', ARRAY ['Color: Blanco', 'Tipo de combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 5', 'Motor: 1.0', U&'A\00f1o: 2017'], 'Fiat Moby 1.0 Easy 2017', 'Mobi 1.0 Easy', NULL, 8, 22);
INSERT INTO O_4 VALUES(26, 'Renault', ARRAY ['Color: Gris', 'Combustible: Nafta', 'Motor: 1.0', 'Puertas: 5', 'Sensor de estacionamiento: Si', U&'Transmisi\00f3n: Manual'], 'Renault Kwid 1.0 Sce 66Cv 2025', 'Kwid 1.0 Sce 66Cv', NULL, 8, 22);
INSERT INTO O_4 VALUES(27, 'Chevrolet', ARRAY ['Color: Plateado', 'Combustible: Nafta', 'Motor: 1.4', 'Puertas: 5', 'Sensor de estacionamiento: Si', U&'Transmisi\00f3n: Manual'], 'Chevrolet Onix 1.4 Joy Ls 2019', 'Onix 1.4 Joy Ls', NULL, 8, 15);
INSERT INTO O_4 VALUES(28, 'Volkswagen', ARRAY ['Color: Blanco', 'Combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 3', 'Motor: 1.0'], 'Volkswagen Up! 1.0 High Up! 75cv 2019', 'Up! 1.0 High Up! 75cv 3 p', NULL, 8, 12);
INSERT INTO O_4 VALUES(29, 'Volkswagen', ARRAY ['Color: Gris', 'Combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 5', 'Motor: 1.0'], U&'Volkswagen Up! 1.0 High Up! 75cv 5 p 2019\000a', 'Up! 1.0 High Up! 75cv 5 p', NULL, 8, 18);
INSERT INTO O_4 VALUES(30, 'Ford', ARRAY ['Color: Blanco', 'Combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 3', 'Motor: 1.5'], 'Ford Ka 1.5 S 2016', 'Ka 1.5 S', NULL, 15, 14);
INSERT INTO O_4 VALUES(31, 'Toyota', ARRAY ['Color: Blanco', 'Combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 5', 'Motor: 1.5'], 'Toyota Etios 1.5 Sedan Xls My19 2022', 'Etios 1.5 Sedan Xls My19', NULL, 15, 19);
INSERT INTO O_4 VALUES(32, 'Renault', ARRAY ['Color: Blanco', 'Combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 5', 'Motor: 1.6'], 'Renault Duster DUSTER PRIVILEGE 1.6 2017', 'Duster DUSTER PRIVILEGE 1.6', NULL, 6, 26);
INSERT INTO O_4 VALUES(33, 'Chevrolet ', ARRAY ['Color: Blanco', 'Combustible: Nafta', 'Motor: 1.2', 'Puertas: 5', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Autom\00e1tica'], U&'Chevrolet Tracker 1.2 Turbo At 2025\000aSUV Compacta', 'Tracker 1.2 Turbo At', NULL, 6, 29);
INSERT INTO O_4 VALUES(34, 'Toyota ', ARRAY ['Color: Blanco', 'Combustible: Nafta', 'Motor: 2.5', 'Puertas: 5', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Autom\00e1tica'], 'Toyota RAV4 2.5 4x4 6at', 'RAV4 2.5 4x4 6at', NULL, 6, 28);
INSERT INTO O_4 VALUES(35, 'Honda', ARRAY ['Color: Gris', 'Combustible: Nafta', 'Motor: 1.8', 'Puertas: 5', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Autom\00e1tica', U&'Control de tracci\00f3n: 4x2'], 'Honda HR-V 1.8 Ex 2wd Cvt 2017', 'HR-V 1.8 Ex 2wd Cvt', NULL, 6, 17);
INSERT INTO O_4 VALUES(36, 'Jeep', ARRAY ['Color: Negro', 'Combustible: Nafta', U&'Transmisi\00f3n: Autom\00e1tica secuencial', 'Puertas: 5', 'Motor: 2.0', U&'Control de tracci\00f3n: 4x4'], 'Jeep Compass Blackhawk 4x4 2.0t Hg 2025', 'Compass Blackhawk 4x4 2.0t Hg', NULL, 6, 58);
INSERT INTO O_4 VALUES(37, 'Toyota', ARRAY ['Color: Blanco', U&'Combustible: Di\00e9sel', U&'Transmisi\00f3n: Autom\00e1tica', 'Puertas: 4', 'Motor: 2.4', U&'Control de tracci\00f3n: 4x4'], 'Toyota Hilux Pick-Up 2.4 Cd Dx 150Cv 4X4 At 2025', 'Hilux Pick-Up 2.4 Cd Dx 150Cv 4X4 At', NULL, 17, 49);
INSERT INTO O_4 VALUES(38, 'Ford', ARRAY ['Color: Negro', U&'Combustible: Di\00e9sel', U&'Transmisi\00f3n: Autom\00e1tica', 'Puertas: 4', 'Motor: 3.0', U&'Control de tracci\00f3n: 4x4'], 'Ford Ranger 3.0 V6 Cd 4X4 Limited + At 250Cv 2025', 'Ranger 3.0 V6 Cd 4X4 Limited + At 250Cv', NULL, 17, 45);
INSERT INTO O_4 VALUES(39, 'Volkswagen', ARRAY ['Color: Blanco', U&'Combustible: Di\00e9sel', 'Motor: 3.0', 'Puertas: 4', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Autom\00e1tica', U&'Control de tracci\00f3n: 4x4'], 'Volkswagen Amarok 3.0 Cd Tdi 258Cv V6 Comfortline 4X4 At 2025', 'Amarok 3.0 Cd Tdi 258Cv V6 Comfortline 4X4 At', NULL, 17, 52);
INSERT INTO O_4 VALUES(40, 'Jeep', ARRAY ['Color: Negro', 'Combustible: Nafta', 'Motor: 1.3', 'Puertas: 5', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Autom\00e1tica', U&'Control de tracci\00f3n: 4x2'], 'Jeep Renegade 1.3T Longitude At6 Fwd', 'Renegade 1.3T Longitude At6 Fwd', NULL, 6, 38);
INSERT INTO O_4 VALUES(41, 'Ford', ARRAY ['Color: Negro', 'Combustible: Nafta', U&'Transmisi\00f3n: Autom\00e1tica', 'Puertas: 2', 'Motor: 5.0'], 'Ford Mustang 5.0 V8 Gt Performance 492Cv 2025', 'Mustang 5.0 V8 Gt Performance 492Cv', NULL, 5, 135);
INSERT INTO O_4 VALUES(42, 'BMW', ARRAY ['Color: Gris', 'Combustible: Nafta', 'Motor: 2.0', 'Puertas: 2', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Manual'], 'BMW Z4 2.0 Sdrive20i 184cv 2012', 'Z4 2.0 Sdrive20i 184cv', NULL, 5, 72);
INSERT INTO O_4 VALUES(43, 'Chevrolet ', ARRAY ['Color: Negro', 'Combustible: Nafta', 'Motor: 6.2', 'Puertas: 2', U&'Sensor de estacionamiento: S\00ed', U&'Transmisi\00f3n: Manual'], 'Chevrolet Camaro 6.2 Coupe Ss V8 2018', 'Camaro 6.2 Coupe Ss V8', NULL, 5, 85);
INSERT INTO O_4 VALUES(44, 'Audi', ARRAY ['Color: Gris', 'Combustible: Nafta', U&'Transmisi\00f3n: Manual', 'Puertas: 2', 'Motor: 1.8'], 'Audi TT 1.8 T Fsi 2011', 'TT 1.8 T Fsi', NULL, 5, 45);
CREATE TABLE O_16(C0 VARCHAR, C1 VARCHAR, C2 VARCHAR, C3 VARCHAR, C4 VARCHAR, C5 VARCHAR);
INSERT INTO O_16 VALUES(1, 'san@gmail.com', 'Carlos Alberto', 'Tevez', '$2a$10$lBMHkq1mJtRQklRS3HyrqekS96oUSuUDDuhOqtRpkahEcxZkU7Kc6', 'USER');
INSERT INTO O_16 VALUES(9, 'tino@gmail.com', 'san', NULL, '$2a$10$ge.192Wvvgl8C/g4GvVJVu5TAiX0VCoFkpBqj1xHswgeInVAJ8b5a', 'USER');
INSERT INTO O_16 VALUES(11, 'gmail@gmail.com', '555', '666', '$2a$10$kQIoTOizp0HfFHeYfaqdyuVTvVVMMzOpd.1OHBCI8VwWgCUFaFHzC', 'USER');
INSERT INTO O_16 VALUES(12, 'tino123@gmail.com', 'santino', 'tino', '$2a$10$M2GqiA0a/pSzpA7c.pL6gOSXvJtywgcdUhwsrom9aUoV9d5SwHxCm', 'USER');
INSERT INTO O_16 VALUES(13, 'admin@gmail.com', 'cuenta', 'admin', '$2a$10$DOtarVWDzfbB1jS10aBWAOADHLH.8.uOzM55x/tX9IYHeABTznIrS', 'ADMIN');
INSERT INTO O_16 VALUES(14, 'prueba@gmail.com', 'probando', 'ahora', '$2a$10$gUv.2bgMsWeUpUOm.0.FNunXIC6XPs0xufV1N2b7xijlPS2rMa81a', 'USER');
INSERT INTO O_16 VALUES(15, 'scanna@gmail.com', 'Santino', 'scanna', '$2a$10$bDr5BUmkOjmMbsXABaWdx.5an/7y9zx.jd3h0XqbBX2z6cqkltARy', 'USER');
INSERT INTO O_16 VALUES(24, 'santinoscannapieco@gmail.com', 'Santino', 'Scannnapieco', '$2a$10$QlyzPgag01euwfYDcBIjYewihitiAxGprkmRXIKPzo5LWbcjyTyCi', 'USER');
CREATE TABLE O_40(C0 VARCHAR, C1 VARCHAR, C2 VARCHAR);
INSERT INTO O_40 VALUES(43, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(43, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(43, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(60, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(60, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(60, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(63, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(63, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(63, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(65, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(65, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(65, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(66, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(66, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(66, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(68, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(68, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(68, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(69, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(69, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(69, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(58, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(58, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(58, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(73, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(73, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(73, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(75, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(75, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(75, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(76, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(76, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(76, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(77, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(77, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(77, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(78, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(78, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(78, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(79, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(79, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(79, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(80, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(80, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(80, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(82, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(82, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(82, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(83, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(83, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(83, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(84, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(84, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(84, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(81, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(81, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(81, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(86, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(86, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(86, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
INSERT INTO O_40 VALUES(87, NULL, 'Aeropuerto Internacional Ezeiza (Bs As)');
INSERT INTO O_40 VALUES(87, NULL, 'AU Tte. Gral. Pablo Riccheri Km 33,5,');
INSERT INTO O_40 VALUES(87, NULL, 'Argentina, Provincia de Buenos Aires, Ezeiza');
---- Schema ----
CREATE USER IF NOT EXISTS "SA" SALT '36a9c5109ec63fd6' HASH '44d386d64bc8dfc79456503f2497f9683c9c32fa39e7f9d095658d3ac380b50a' ADMIN;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_F2668606_63A1_4623_9F7E_086C9C5EA862" START WITH 1 RESTART WITH 88 BELONGS_TO_TABLE;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_995F481E_F429_4F40_BD9D_D4A3730E9003" START WITH 1 RESTART WITH 45 BELONGS_TO_TABLE;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_8252FCE4_490C_4B9D_8A9C_0A5DF84836F3" START WITH 1 RESTART WITH 18 BELONGS_TO_TABLE;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_33123441_225C_44C5_94FD_D91D3C368C48" START WITH 1 RESTART WITH 25 BELONGS_TO_TABLE;
CREATE CACHED TABLE "PUBLIC"."CAR_IMAGE_PATHS"(
    "CAR_ITEM_ID" BIGINT NOT NULL,
    "IMAGE_PATHS" CHARACTER VARYING(255)
);
CREATE CACHED TABLE "PUBLIC"."CARS"(
    "ITEM_ID" BIGINT GENERATED BY DEFAULT AS IDENTITY SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_995F481E_F429_4F40_BD9D_D4A3730E9003" NOT NULL,
    "CARD_BRAND" CHARACTER VARYING(255),
    "CHARACTERISTICS" CHARACTER VARYING(255) ARRAY,
    "DESCRIPTION" CHARACTER VARYING(255),
    "NAME" CHARACTER VARYING(255),
    "PRICE_PER_HOUR" INTEGER,
    "CATEGORY_ID" BIGINT,
    "PRICE_PER_DAY" INTEGER
);
CREATE CACHED TABLE "PUBLIC"."USER_FAVORITE_CAR_IDS"(
    "USER_ID" BIGINT NOT NULL,
    "CAR_ID" BIGINT
);
CREATE CACHED TABLE "PUBLIC"."CATEGORIES"(
    "CATEGORY_ID" BIGINT GENERATED BY DEFAULT AS IDENTITY SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_8252FCE4_490C_4B9D_8A9C_0A5DF84836F3" NOT NULL,
    "NAME" CHARACTER VARYING(255)
);
CREATE CACHED TABLE "PUBLIC"."USERS"(
    "USER_ID" BIGINT GENERATED BY DEFAULT AS IDENTITY SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_33123441_225C_44C5_94FD_D91D3C368C48" NOT NULL,
    "EMAIL" CHARACTER VARYING(255),
    "FIRSTNAME" CHARACTER VARYING(255),
    "LAST_NAME" CHARACTER VARYING(255),
    "PASSWORD" CHARACTER VARYING(255),
    "ROLE" CHARACTER VARYING(255)
);
CREATE CACHED TABLE "PUBLIC"."CAR_RESERVATIONS"(
    "CAR_RESERVATION_ID" BIGINT GENERATED BY DEFAULT AS IDENTITY SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_F2668606_63A1_4623_9F7E_086C9C5EA862" NOT NULL,
    "PICK_UP" CHARACTER VARYING(255),
    "RETURN_END_DATE" DATE,
    "RETURN_START_DATE" DATE,
    "CAR_ID" BIGINT,
    "USER_ID" BIGINT,
    "TOTAL_PRICE" FLOAT(53),
    "CVV" CHARACTER VARYING(255),
    "EXPIRATION" CHARACTER VARYING(255),
    "HOLDER_NAME" CHARACTER VARYING(255),
    "NUMBER" CHARACTER VARYING(255),
    "PAYMENT_METHOD" CHARACTER VARYING(255)
);
CREATE CACHED TABLE "PUBLIC"."CAR_RESERVATION_PICKUP"(
    "RESERVATION_ID" BIGINT NOT NULL,
    "PICKUP_ITEM" CHARACTER VARYING(255),
    "CAR_RESERVATION_ID" BIGINT NOT NULL
);
CREATE CACHED TABLE "PUBLIC"."CAR_RESERVATION_PICK_UP"(
    "CAR_RESERVATION_CAR_RESERVATION_ID" BIGINT NOT NULL,
    "PICK_UP" CHARACTER VARYING(255),
    "PICKUP_ITEM" CHARACTER VARYING(255)
);
INSERT INTO "PUBLIC"."USERS" SELECT * FROM O_16;
INSERT INTO "PUBLIC"."CAR_IMAGE_PATHS" SELECT * FROM O_3;
INSERT INTO "PUBLIC"."CARS" SELECT * FROM O_4;
INSERT INTO "PUBLIC"."CAR_RESERVATIONS" SELECT * FROM O_22;
INSERT INTO "PUBLIC"."CAR_RESERVATION_PICK_UP" SELECT * FROM O_40;
INSERT INTO "PUBLIC"."USER_FAVORITE_CAR_IDS" SELECT * FROM O_11;
INSERT INTO "PUBLIC"."CATEGORIES" SELECT * FROM O_12;
DROP TABLE O_16;
DROP TABLE O_3;
DROP TABLE O_4;
DROP TABLE O_22;
DROP TABLE O_40;
DROP TABLE O_11;
DROP TABLE O_12;
CREATE INDEX "PUBLIC"."FKIJ86E6ODMUP8JI18OSLXM7NGY_INDEX_8" ON "PUBLIC"."CAR_RESERVATION_PICKUP"("CAR_RESERVATION_ID" NULLS FIRST);
CREATE INDEX "PUBLIC"."FK29EP0XWTLCH6HCXHMBY56MCQQ_INDEX_6" ON "PUBLIC"."CAR_IMAGE_PATHS"("CAR_ITEM_ID" NULLS FIRST);
CREATE INDEX "PUBLIC"."FK310LABQCOAWYJ05T4GVVFJBG9_INDEX_5" ON "PUBLIC"."CARS"("CATEGORY_ID" NULLS FIRST);
CREATE INDEX "PUBLIC"."FKKCXR5LQGKLMDUUG03JRBJNWWA_INDEX_A" ON "PUBLIC"."CAR_RESERVATION_PICKUP"("RESERVATION_ID" NULLS FIRST);
CREATE INDEX "PUBLIC"."FKEKY6HCOW0619536ALEJ0FPDIB_INDEX_7" ON "PUBLIC"."USER_FAVORITE_CAR_IDS"("USER_ID" NULLS FIRST);
CREATE INDEX "PUBLIC"."FK6RXQBAEU8GLS0BQXK19C9Y0KV_INDEX_6" ON "PUBLIC"."CAR_RESERVATION_PICK_UP"("CAR_RESERVATION_CAR_RESERVATION_ID" NULLS FIRST);
CREATE INDEX "PUBLIC"."FKTDJW4G5F8YHKTNKUUQQP1X4L4_INDEX_F" ON "PUBLIC"."CAR_RESERVATIONS"("CAR_ID" NULLS FIRST);
CREATE INDEX "PUBLIC"."FKPN6LEDC8U65O9DHSYUECIHXJK_INDEX_F" ON "PUBLIC"."CAR_RESERVATIONS"("USER_ID" NULLS FIRST);
ALTER TABLE "PUBLIC"."CARS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1" PRIMARY KEY("ITEM_ID") INDEX "PUBLIC"."PRIMARY_KEY_5";
ALTER TABLE "PUBLIC"."CAR_RESERVATIONS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_F7" CHECK("PAYMENT_METHOD" IN('EFECTIVO', 'TARJETA')) NOCHECK;
ALTER TABLE "PUBLIC"."CATEGORIES" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6" PRIMARY KEY("CATEGORY_ID") INDEX "PUBLIC"."PRIMARY_KEY_6";
ALTER TABLE "PUBLIC"."USERS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_4" CHECK("ROLE" IN('USER', 'ADMIN')) NOCHECK;
ALTER TABLE "PUBLIC"."USERS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_4D" PRIMARY KEY("USER_ID") INDEX "PUBLIC"."PRIMARY_KEY_4";
ALTER TABLE "PUBLIC"."CAR_RESERVATIONS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_F" PRIMARY KEY("CAR_RESERVATION_ID") INDEX "PUBLIC"."PRIMARY_KEY_F";
ALTER TABLE "PUBLIC"."CAR_IMAGE_PATHS" ADD CONSTRAINT "PUBLIC"."FK29EP0XWTLCH6HCXHMBY56MCQQ" FOREIGN KEY("CAR_ITEM_ID") INDEX "PUBLIC"."FK29EP0XWTLCH6HCXHMBY56MCQQ_INDEX_6" REFERENCES "PUBLIC"."CARS"("ITEM_ID") NOCHECK;
ALTER TABLE "PUBLIC"."CARS" ADD CONSTRAINT "PUBLIC"."FK310LABQCOAWYJ05T4GVVFJBG9" FOREIGN KEY("CATEGORY_ID") INDEX "PUBLIC"."FK310LABQCOAWYJ05T4GVVFJBG9_INDEX_5" REFERENCES "PUBLIC"."CATEGORIES"("CATEGORY_ID") NOCHECK;
ALTER TABLE "PUBLIC"."USER_FAVORITE_CAR_IDS" ADD CONSTRAINT "PUBLIC"."FKEKY6HCOW0619536ALEJ0FPDIB" FOREIGN KEY("USER_ID") INDEX "PUBLIC"."FKEKY6HCOW0619536ALEJ0FPDIB_INDEX_7" REFERENCES "PUBLIC"."USERS"("USER_ID") NOCHECK;
ALTER TABLE "PUBLIC"."CAR_RESERVATION_PICKUP" ADD CONSTRAINT "PUBLIC"."FKIJ86E6ODMUP8JI18OSLXM7NGY" FOREIGN KEY("CAR_RESERVATION_ID") INDEX "PUBLIC"."FKIJ86E6ODMUP8JI18OSLXM7NGY_INDEX_8" REFERENCES "PUBLIC"."CAR_RESERVATIONS"("CAR_RESERVATION_ID") NOCHECK;
ALTER TABLE "PUBLIC"."CAR_RESERVATIONS" ADD CONSTRAINT "PUBLIC"."FKTDJW4G5F8YHKTNKUUQQP1X4L4" FOREIGN KEY("CAR_ID") INDEX "PUBLIC"."FKTDJW4G5F8YHKTNKUUQQP1X4L4_INDEX_F" REFERENCES "PUBLIC"."CARS"("ITEM_ID") NOCHECK;
ALTER TABLE "PUBLIC"."CAR_RESERVATIONS" ADD CONSTRAINT "PUBLIC"."FKPN6LEDC8U65O9DHSYUECIHXJK" FOREIGN KEY("USER_ID") INDEX "PUBLIC"."FKPN6LEDC8U65O9DHSYUECIHXJK_INDEX_F" REFERENCES "PUBLIC"."USERS"("USER_ID") NOCHECK;
ALTER TABLE "PUBLIC"."CAR_RESERVATION_PICKUP" ADD CONSTRAINT "PUBLIC"."FKKCXR5LQGKLMDUUG03JRBJNWWA" FOREIGN KEY("RESERVATION_ID") INDEX "PUBLIC"."FKKCXR5LQGKLMDUUG03JRBJNWWA_INDEX_A" REFERENCES "PUBLIC"."CAR_RESERVATIONS"("CAR_RESERVATION_ID") NOCHECK;
ALTER TABLE "PUBLIC"."CAR_RESERVATION_PICK_UP" ADD CONSTRAINT "PUBLIC"."FK6RXQBAEU8GLS0BQXK19C9Y0KV" FOREIGN KEY("CAR_RESERVATION_CAR_RESERVATION_ID") INDEX "PUBLIC"."FK6RXQBAEU8GLS0BQXK19C9Y0KV_INDEX_6" REFERENCES "PUBLIC"."CAR_RESERVATIONS"("CAR_RESERVATION_ID") NOCHECK;
DROP ALIAS READ_BLOB_MAP;
DROP ALIAS READ_CLOB_MAP;
DROP TABLE IF EXISTS INFORMATION_SCHEMA.LOB_BLOCKS;
