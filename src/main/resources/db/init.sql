-- ICOAP_TJ.AGENT_BOX definition

-- Drop table

-- DROP TABLE ICOAP_TJ.AGENT_BOX;

CREATE TABLE ICOAP_TJ.AGENT_BOX (
                                    CREATE_TIME VARCHAR2(100) NOT NULL,
                                    AGENT_ORG_NO VARCHAR2(32) NOT NULL,
                                    YE_BALANCE_BOX_NO VARCHAR2(2000) NOT NULL,
                                    ENTER_BOX_NO VARCHAR2(2000),
                                    OUT_BOX_NO VARCHAR2(2000),
                                    BALANCE_BOX_NO VARCHAR2(2000),
                                    ID INTEGER NOT NULL,
                                    CONSTRAINT AGENT_BOX_PK PRIMARY KEY (ID)
);
CREATE INDEX AGENT_BOX_AGENT_ORG_NO_IDX ON ICOAP_TJ.AGENT_BOX (AGENT_ORG_NO);
CREATE UNIQUE INDEX INDEX33555472 ON ICOAP_TJ.AGENT_BOX (ID);


-- ICOAP_TJ.AGENT_ORG definition

-- Drop table

-- DROP TABLE ICOAP_TJ.AGENT_ORG;

CREATE TABLE ICOAP_TJ.AGENT_ORG (
                                    AGENT_ORG_NO VARCHAR2(32) NOT NULL,
                                    AGENT_ORG_NAME VARCHAR2(100) NOT NULL,
                                    TRE_NO VARCHAR2(32) NOT NULL,
                                    CREATE_TIME VARCHAR2(100) NOT NULL,
                                    NOTE VARCHAR2(100),
                                    CONSTRAINT AGENT_ORG_PK PRIMARY KEY (AGENT_ORG_NO)
);
CREATE UNIQUE INDEX INDEX33555475 ON ICOAP_TJ.AGENT_ORG (AGENT_ORG_NO);


-- ICOAP_TJ.AI_TYPE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.AI_TYPE;

CREATE TABLE ICOAP_TJ.AI_TYPE (
                                  TYPE_ID NVARCHAR(200) NOT NULL,
                                  TYPE_NAME NVARCHAR(200),
                                  IS_PARENT NUMBER(4,0) NOT NULL,
                                  PARENT_TYPE NVARCHAR(200),
                                  DESCRIPTION NVARCHAR(1020),
                                  BUSINESS_PARAMS NVARCHAR(1020),
                                  COORDINATE_MIN_NUM NUMBER(11,0),
                                  COORDINATE_MAX_NUM NUMBER(11,0),
                                  CONSTRAINT SYS_C007706 PRIMARY KEY (TYPE_ID)
);
CREATE UNIQUE INDEX INDEX33555477 ON ICOAP_TJ.AI_TYPE (TYPE_ID);


-- ICOAP_TJ.ANALYSIS_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.ANALYSIS_INFO;

CREATE TABLE ICOAP_TJ.ANALYSIS_INFO (
                                        SERIAL_NO NVARCHAR(128) NOT NULL,
                                        TASK_ID NVARCHAR(128) NOT NULL,
                                        TYPE_ID NVARCHAR(40) NOT NULL,
                                        ANALYSIS_TIME NVARCHAR(128) NOT NULL,
                                        IMG_INFO NVARCHAR(1020),
                                        "DATA" NVARCHAR(20000),
                                        AREA_COORDINATE NVARCHAR(8000),
                                        CONSTRAINT SYS_C007709 PRIMARY KEY (SERIAL_NO)
);
CREATE UNIQUE INDEX INDEX33555479 ON ICOAP_TJ.ANALYSIS_INFO (SERIAL_NO);
CREATE INDEX "fk_analysis_Info_AI_type_1" ON ICOAP_TJ.ANALYSIS_INFO (TYPE_ID);


-- ICOAP_TJ.AREA_COORDINATE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.AREA_COORDINATE;

CREATE TABLE ICOAP_TJ.AREA_COORDINATE (
                                          ID NUMBER(11,0) NOT NULL,
                                          BLOCK_NAME NVARCHAR(200),
                                          CAMERA_ID NVARCHAR(40) NOT NULL,
                                          AREA_ID NVARCHAR(44),
                                          IMAGE_WIDTH NUMBER(11,0) NOT NULL,
                                          IMAGE_HEIGHT NUMBER(11,0) NOT NULL,
                                          COORDINATE NVARCHAR(1020),
                                          CONSTRAINT SYS_C007708 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555482 ON ICOAP_TJ.AREA_COORDINATE (ID);
CREATE INDEX "fk_area_coordinate_area_id" ON ICOAP_TJ.AREA_COORDINATE (AREA_ID);
CREATE INDEX "fk_area_coordinate_camera_id" ON ICOAP_TJ.AREA_COORDINATE (CAMERA_ID);


-- ICOAP_TJ.AREA_HUMAN_CALCULATE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.AREA_HUMAN_CALCULATE;

CREATE TABLE ICOAP_TJ.AREA_HUMAN_CALCULATE (
                                               ORG_NO VARCHAR2(20) NOT NULL,
                                               AREA_ID VARCHAR2(11) NOT NULL,
                                               UPDATE_TIME VARCHAR2(20),
                                               HUMAN_NUMBER NUMBER,
                                               CONSTRAINT SYS_C008324 PRIMARY KEY (ORG_NO,AREA_ID)
);
CREATE UNIQUE INDEX INDEX33555486 ON ICOAP_TJ.AREA_HUMAN_CALCULATE (ORG_NO,AREA_ID);


-- ICOAP_TJ.AREA_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.AREA_TABLE;

CREATE TABLE ICOAP_TJ.AREA_TABLE (
                                     ID NVARCHAR(44) NOT NULL,
                                     AREA_NAME NVARCHAR(200) NOT NULL,
                                     AREA_DESC NVARCHAR(1020),
                                     NOTE NVARCHAR(1020),
                                     CONSTRAINT SYS_C007707 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555488 ON ICOAP_TJ.AREA_TABLE (ID);


-- ICOAP_TJ.BOX_ASSIGN_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.BOX_ASSIGN_INFO;

CREATE TABLE ICOAP_TJ.BOX_ASSIGN_INFO (
                                          "NO" INTEGER NOT NULL,
                                          IMPL_NO INTEGER NOT NULL,
                                          BOX_NO VARCHAR2(24) NOT NULL,
                                          BOX_TYPE_NO VARCHAR2(3) NOT NULL,
                                          CREATER VARCHAR2(20) NOT NULL,
                                          CHECKER VARCHAR2(20),
                                          DATE_TIME VARCHAR2(100),
                                          OUT_TER_TIME VARCHAR2(100),
                                          ENTER_TER_TIME VARCHAR2(100),
                                          DELIVER_ORG_NO VARCHAR2(20) NOT NULL,
                                          RECEIVE_ORG_NO VARCHAR2(20) NOT NULL,
                                          STATE_IN VARCHAR2(3) DEFAULT 1 NOT NULL,
                                          OUT_BAR_CODE VARCHAR(100),
                                          IN_BAR_CODE VARCHAR(100),
                                          STATE_OUT VARCHAR2(3) DEFAULT 1 NOT NULL,
                                          CONSTRAINT BOX_ASSIGN_INFO_PK PRIMARY KEY ("NO")
);
CREATE INDEX BOX_ASSIGN_INFO_IMPL_NO_IDX ON ICOAP_TJ.BOX_ASSIGN_INFO (IMPL_NO);
CREATE UNIQUE INDEX INDEX33555691 ON ICOAP_TJ.BOX_ASSIGN_INFO ("NO");


-- ICOAP_TJ.BOX_ERROR definition

-- Drop table

-- DROP TABLE ICOAP_TJ.BOX_ERROR;

CREATE TABLE ICOAP_TJ.BOX_ERROR (
                                    "NO" VARCHAR2(32) NOT NULL,
                                    BOX_NO VARCHAR2(32) NOT NULL,
                                    BOX_TYPE VARCHAR2(32) NOT NULL,
                                    IMPL_NO NUMBER(32,0) NOT NULL,
                                    PRODUCE_TYPE VARCHAR2(32),
                                    PRODUCE_TIME VARCHAR2(100),
                                    "SOURCE" VARCHAR2(32),
                                    DEST VARCHAR2(100),
                                    "CHECK" VARCHAR2(100),
                                    NOTE VARCHAR2(500),
                                    RE_TIME VARCHAR2(50),
                                    STATE VARCHAR2(50) DEFAULT 0,
                                    SHOW_FLAG VARCHAR2(2),
                                    CONSTRAINT BOX_ERROR_PK PRIMARY KEY ("NO")
);
CREATE INDEX BOX_ERROR_IMPL_NO_IDX ON ICOAP_TJ.BOX_ERROR (IMPL_NO);
CREATE UNIQUE INDEX INDEX33555490 ON ICOAP_TJ.BOX_ERROR ("NO");


-- ICOAP_TJ.BOX_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.BOX_INFO;

CREATE TABLE ICOAP_TJ.BOX_INFO (
                                   BOX_NO VARCHAR2(10) NOT NULL,
                                   NOTE VARCHAR2(100),
                                   STATUS NUMBER(2,0) DEFAULT 0 NOT NULL,
                                   BOX_TYPE_NO NUMBER(38,0) NOT NULL,
                                   BOX_POSITION VARCHAR2(100),
                                   BOX_ORG_NO VARCHAR2(100),
                                   CREATE_TIME VARCHAR2(100),
                                   CREATE_PERSON VARCHAR2(100),
                                   UPDATE_TIME VARCHAR2(100),
                                   UPDATE_PERSON VARCHAR2(100),
                                   BOX_LOCATION VARCHAR2(100),
                                   INIT_BOX_TYPE_NO VARCHAR2(30) NOT NULL,
                                   TAG VARCHAR2(100),
                                   CONSTRAINT BOX_INFO_PK PRIMARY KEY (BOX_NO)
);
CREATE UNIQUE INDEX INDEX33555493 ON ICOAP_TJ.BOX_INFO (BOX_NO);


-- ICOAP_TJ.CAMERA_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.CAMERA_INFO;

CREATE TABLE ICOAP_TJ.CAMERA_INFO (
                                      ID NVARCHAR(40) NOT NULL,
                                      CAMERA_NAME NVARCHAR(200) NOT NULL,
                                      ADDRESS NVARCHAR(800),
                                      RTSP_PATH NVARCHAR(800),
                                      VIDEO_FORMAT NVARCHAR(200),
                                      IS_DASHBOARD NUMBER(4,0),
                                      WIDTH NUMBER(11,0),
                                      HEIGHT NUMBER(11,0),
                                      HEAD_SHOULDER_RATIO NVARCHAR(40),
                                      ORG_NO NVARCHAR(80) NOT NULL,
                                      STATION_ID NVARCHAR(40),
                                      CAMERA_TYPE NVARCHAR(20),
                                      STATUS NUMBER(4,0) DEFAULT 0,
                                      IMG_BASE CLOB,
                                      FPS NVARCHAR(40),
                                      ORG_NAME VARCHAR2(50),
                                      CONSTRAINT SYS_C007710 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555495 ON ICOAP_TJ.CAMERA_INFO (ID);
CREATE INDEX "fk_camera_info_dev_type" ON ICOAP_TJ.CAMERA_INFO (CAMERA_TYPE);
CREATE INDEX "fk_camera_info_sys_org" ON ICOAP_TJ.CAMERA_INFO (ORG_NO);
CREATE INDEX "fk_camera_table_station_info_1" ON ICOAP_TJ.CAMERA_INFO (STATION_ID);


-- ICOAP_TJ.CAR_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.CAR_INFO;

CREATE TABLE ICOAP_TJ.CAR_INFO (
                                   CAR_NO VARCHAR2(32) NOT NULL,
                                   PLATE VARCHAR2(32) NOT NULL,
                                   ORG_NO NVARCHAR(128) NOT NULL,
                                   COMPANY_NAME VARCHAR2(100),
                                   LABLE VARCHAR2(100),
                                   NOTE VARCHAR2(500),
                                   ENGINE_ID VARCHAR2(100),
                                   FRAME_ID VARCHAR2(100),
                                   CAR_IMG TEXT,
                                   CONSTRAINT CAR_INFO_PK PRIMARY KEY (CAR_NO)
);
CREATE UNIQUE INDEX INDEX33555500 ON ICOAP_TJ.CAR_INFO (CAR_NO);


-- ICOAP_TJ.CLR_CENTER_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.CLR_CENTER_TABLE;

CREATE TABLE ICOAP_TJ.CLR_CENTER_TABLE (
                                           CLR_CENTER_NO NVARCHAR(40) NOT NULL,
                                           CENTER_NAME NVARCHAR(320),
                                           BANK_ORG_NO NVARCHAR(80),
                                           AUTO_FLAG NUMBER(11,0),
                                           CENTER_TYPE NUMBER(11,0),
                                           SERVICES_NO NVARCHAR(400),
                                           NOTE NVARCHAR(400),
                                           CASHTRUCK_NUM NUMBER(11,0),
                                           CLR_VEHICLE_CAPACITY NUMBER(11,0),
                                           CONSTRAINT SYS_C007825 PRIMARY KEY (CLR_CENTER_NO)
);
CREATE UNIQUE INDEX INDEX33555502 ON ICOAP_TJ.CLR_CENTER_TABLE (CLR_CENTER_NO);


-- ICOAP_TJ.CURRENCY_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.CURRENCY_INFO;

CREATE TABLE ICOAP_TJ.CURRENCY_INFO (
                                        CURRENCY_NO VARCHAR2(32) NOT NULL,
                                        CURRENCY_NAME VARCHAR2(32) NOT NULL,
                                        NOTE VARCHAR2(100),
                                        CONSTRAINT CURRENCY_INFO_PK PRIMARY KEY (CURRENCY_NO)
);
CREATE UNIQUE INDEX INDEX33555504 ON ICOAP_TJ.CURRENCY_INFO (CURRENCY_NO);


-- ICOAP_TJ.DELIVERY_NOTICE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.DELIVERY_NOTICE;

CREATE TABLE ICOAP_TJ.DELIVERY_NOTICE (
                                          "NO" VARCHAR2(32) NOT NULL,
                                          ESCORT_PLAN_NO VARCHAR2(32) NOT NULL,
                                          DELIVER_ORG_NO VARCHAR2(32),
                                          RECEIVE_ORG_NO VARCHAR2(100),
                                          STATE VARCHAR2(100),
                                          CREATE_TIME VARCHAR2(100),
                                          NOTE VARCHAR2(100),
                                          PLAN_LINE VARCHAR2(100),
                                          CREATER VARCHAR2(100) NOT NULL,
                                          PLAN_NO VARCHAR2(100) NOT NULL,
                                          BOXS_NO VARCHAR2(100),
                                          QUERY_PERSON VARCHAR2(32) NOT NULL,
                                          CONSTRAINT DELIVERY_NOTICE_PK PRIMARY KEY ("NO")
);
CREATE INDEX DELIVERY_NOTICE_ESCORT_PLAN_NO_IDX ON ICOAP_TJ.DELIVERY_NOTICE (ESCORT_PLAN_NO);
CREATE INDEX DELIVERY_NOTICE_PLAN_LINE_IDX ON ICOAP_TJ.DELIVERY_NOTICE (PLAN_LINE);
CREATE INDEX DELIVERY_NOTICE_PLAN_NO_IDX ON ICOAP_TJ.DELIVERY_NOTICE (PLAN_NO);
CREATE UNIQUE INDEX INDEX33555506 ON ICOAP_TJ.DELIVERY_NOTICE ("NO");


-- ICOAP_TJ.DEV_CATALOG_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.DEV_CATALOG_TABLE;

CREATE TABLE ICOAP_TJ.DEV_CATALOG_TABLE (
                                            "NO" NVARCHAR(20) NOT NULL,
                                            NAME NVARCHAR(120),
                                            ENNAME NVARCHAR(120),
                                            MONITOR_TYPE NVARCHAR(8),
                                            CONSTRAINT SYS_C007829 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555511 ON ICOAP_TJ.DEV_CATALOG_TABLE ("NO");


-- ICOAP_TJ.DEV_TYPE_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.DEV_TYPE_TABLE;

CREATE TABLE ICOAP_TJ.DEV_TYPE_TABLE (
                                         "NO" NVARCHAR(20) NOT NULL,
                                         NAME NVARCHAR(240),
                                         DEV_VENDOR NVARCHAR(20),
                                         DEV_CATALOG NVARCHAR(20),
                                         SPEC NVARCHAR(80),
                                         WEIGHT NVARCHAR(40),
                                         WATT NVARCHAR(40),
                                         CASH_TYPE NVARCHAR(8),
                                         CONSTRAINT SYS_C007830 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555513 ON ICOAP_TJ.DEV_TYPE_TABLE ("NO");


-- ICOAP_TJ.DEV_VENDOR_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.DEV_VENDOR_TABLE;

CREATE TABLE ICOAP_TJ.DEV_VENDOR_TABLE (
                                           "NO" NVARCHAR(20) NOT NULL,
                                           NAME NVARCHAR(320),
                                           ADDRESS NVARCHAR(320),
                                           HOTLINE1 NVARCHAR(80),
                                           STATUS NVARCHAR(8),
                                           CONSTRAINT SYS_C007831 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555515 ON ICOAP_TJ.DEV_VENDOR_TABLE ("NO");


-- ICOAP_TJ.ESCORT_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.ESCORT_INFO;

CREATE TABLE ICOAP_TJ.ESCORT_INFO (
                                      ESCORT_NO VARCHAR2(50) NOT NULL,
                                      ESCORT_NAME VARCHAR2(32) NOT NULL,
                                      ORG_NO NVARCHAR(128) NOT NULL,
                                      ID_NUMBER VARCHAR2(100) NOT NULL,
                                      NOTE VARCHAR2(500),
                                      ESCORT_IMG_PATH TEXT,
                                      MOBILE VARCHAR2(100),
                                      CONSTRAINT ESCORT_INFO_PK PRIMARY KEY (ESCORT_NO)
);
CREATE INDEX ESCORT_INFO_ORG_NO_IDX ON ICOAP_TJ.ESCORT_INFO (ORG_NO);
CREATE UNIQUE INDEX INDEX33555517 ON ICOAP_TJ.ESCORT_INFO (ESCORT_NO);


-- ICOAP_TJ.ESCORT_PLAN_SCHEDULE_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.ESCORT_PLAN_SCHEDULE_INFO;

CREATE TABLE ICOAP_TJ.ESCORT_PLAN_SCHEDULE_INFO (
                                                    PLAN_NO NVARCHAR(400) NOT NULL,
                                                    START_DATE NVARCHAR(400),
                                                    END_DATE NVARCHAR(400),
                                                    SCHEDULE NVARCHAR(400),
                                                    DIRECTION NVARCHAR(400),
                                                    START_TIME NVARCHAR(400),
                                                    END_TIME NVARCHAR(400),
                                                    RE_START_TIME NVARCHAR(400),
                                                    RE_END_TIME NVARCHAR(400),
                                                    NOTE NVARCHAR(400),
                                                    LINE_NO NVARCHAR(400) NOT NULL,
                                                    STATUS NVARCHAR(400) DEFAULT 0 NOT NULL,
                                                    CAR_NO VARCHAR2(100),
                                                    ESCORT_NO VARCHAR2(100),
                                                    NOTE1 VARCHAR2(100),
                                                    ORG_NO VARCHAR2(100),
                                                    CONSTRAINT ESCORT_PLAN_SCHEDULE_INFO_PK PRIMARY KEY (PLAN_NO)
);
CREATE INDEX ESCORT_PLAN_SCHEDULE_INFO_LINE_NO_IDX ON ICOAP_TJ.ESCORT_PLAN_SCHEDULE_INFO (LINE_NO);
CREATE UNIQUE INDEX INDEX33555520 ON ICOAP_TJ.ESCORT_PLAN_SCHEDULE_INFO (PLAN_NO);


-- ICOAP_TJ.EVENT_GRADE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.EVENT_GRADE;

CREATE TABLE ICOAP_TJ.EVENT_GRADE (
                                      GRADE_ID NVARCHAR(40) NOT NULL,
                                      GRADE_NAME NVARCHAR(200),
                                      "DESC" NVARCHAR(1020),
                                      NOTIFY_TYPE NVARCHAR(40),
                                      CONSTRAINT SYS_C007715 PRIMARY KEY (GRADE_ID)
);
CREATE UNIQUE INDEX INDEX33555523 ON ICOAP_TJ.EVENT_GRADE (GRADE_ID);


-- ICOAP_TJ.EVENT_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.EVENT_INFO;

CREATE TABLE ICOAP_TJ.EVENT_INFO (
                                     ID NUMBER(11,0) NOT NULL,
                                     EVENT_NAME NVARCHAR(200) NOT NULL,
                                     EVENT_TYPE NVARCHAR(40) NOT NULL,
                                     EVENT_GRADE NVARCHAR(40) NOT NULL,
                                     AI_TYPE NVARCHAR(40) NOT NULL,
                                     RULE NVARCHAR(1020),
                                     EVENT_DESC NVARCHAR(1020),
                                     CONSTRAINT SYS_C007716 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555525 ON ICOAP_TJ.EVENT_INFO (ID);


-- ICOAP_TJ.EVENT_TYPE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.EVENT_TYPE;

CREATE TABLE ICOAP_TJ.EVENT_TYPE (
                                     TYPE_ID NVARCHAR(40) NOT NULL,
                                     TYPE_NAME NVARCHAR(200),
                                     "DESC" NVARCHAR(1020),
                                     CONSTRAINT SYS_C007717 PRIMARY KEY (TYPE_ID)
);
CREATE UNIQUE INDEX INDEX33555527 ON ICOAP_TJ.EVENT_TYPE (TYPE_ID);


-- ICOAP_TJ.HANDHELD_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.HANDHELD_INFO;

CREATE TABLE ICOAP_TJ.HANDHELD_INFO (
                                        HANDHELD_ORG_NO VARCHAR2(100),
                                        HANDHELD_NO VARCHAR2(100) NOT NULL,
                                        SIM_PHONE VARCHAR2(100),
                                        NOTE VARCHAR2(200),
                                        STATUS NUMBER(2,0) DEFAULT 0 NOT NULL,
                                        LINE_NO VARCHAR2(100),
                                        CONSTRAINT HANDHELD_INFO1_PK PRIMARY KEY (HANDHELD_NO)
);
CREATE UNIQUE INDEX INDEX33555699 ON ICOAP_TJ.HANDHELD_INFO (HANDHELD_NO);


-- ICOAP_TJ.HANDHELD_VERSION definition

-- Drop table

-- DROP TABLE ICOAP_TJ.HANDHELD_VERSION;

CREATE TABLE ICOAP_TJ.HANDHELD_VERSION (
                                           VERSION_NO VARCHAR2(100) NOT NULL,
                                           VERSION_TYPE NUMBER(2,0) DEFAULT 1 NOT NULL,
                                           PUBLISH_PERSON VARCHAR2(100),
                                           PUBLISH_TIME VARCHAR2(200),
                                           VERSION_STATUS NUMBER(2,0) DEFAULT 0 NOT NULL,
                                           RENEW_LOG VARCHAR2(100),
                                           FILE_PATH VARCHAR2(100),
                                           CONSTRAINT HANDHELD_VERSION_PK PRIMARY KEY (VERSION_NO)
);
CREATE UNIQUE INDEX INDEX33555703 ON ICOAP_TJ.HANDHELD_VERSION (VERSION_NO);


-- ICOAP_TJ.HANDOVER_RECORD definition

-- Drop table

-- DROP TABLE ICOAP_TJ.HANDOVER_RECORD;

CREATE TABLE ICOAP_TJ.HANDOVER_RECORD (
                                          IMPL_NO NUMBER(32,0) NOT NULL,
                                          BOX_NO VARCHAR2(899) NOT NULL,
                                          BOX_TYPE VARCHAR2(199),
                                          LINE_NAME VARCHAR2(300) NOT NULL,
                                          DELIVER_ORG VARCHAR2(32),
                                          DELIVER_ORG_PERSON VARCHAR2(32),
                                          DELIVER_ORG_PLANER VARCHAR2(100),
                                          DELIVER_ORG_TIME VARCHAR2(100),
                                          RECEIVE_ORG VARCHAR2(100),
                                          RECEIVE_ORG_PERSON VARCHAR2(100),
                                          RECEIVE_ORG_PLANER VARCHAR2(100),
                                          RECEIVE_ORG_TIME VARCHAR2(100),
                                          RECORD_ID VARCHAR(50) NOT NULL,
                                          FIRST_HANDOVER VARCHAR(3) DEFAULT 2 NOT NULL,
                                          SECOND_HANDOVER VARCHAR(3) DEFAULT 2 NOT NULL,
                                          CONSTRAINT HANDOVER_RECORD_PK PRIMARY KEY (IMPL_NO,RECORD_ID)
);
CREATE UNIQUE INDEX INDEX33555529 ON ICOAP_TJ.HANDOVER_RECORD (IMPL_NO,RECORD_ID);


-- ICOAP_TJ.IMPLEMENT_PLAN definition

-- Drop table

-- DROP TABLE ICOAP_TJ.IMPLEMENT_PLAN;

CREATE TABLE ICOAP_TJ.IMPLEMENT_PLAN (
                                         IMPL_NO NUMBER(32,0) NOT NULL,
                                         PLAN_NO VARCHAR2(100),
                                         DELIVER_ORG_NO VARCHAR2(100),
                                         RECEIVE_ORG_NO VARCHAR2(100),
                                         STATE VARCHAR2(100),
                                         LINE_STATE VARCHAR2(100),
                                         HANDOVER_PERSON_ONE VARCHAR2(100),
                                         HANDOVER_PERSON_TWO VARCHAR2(100),
                                         DIRECTION VARCHAR2(50),
                                         "DATE" VARCHAR(100),
                                         CONSTRAINT IMPLEMENT_PLAN_PK PRIMARY KEY (IMPL_NO)
);
CREATE INDEX IMPLEMENT_PLAN_DATE_IDX ON ICOAP_TJ.IMPLEMENT_PLAN ("DATE");
CREATE INDEX IMPLEMENT_PLAN_PLAN_NO_IDX ON ICOAP_TJ.IMPLEMENT_PLAN (PLAN_NO);
CREATE UNIQUE INDEX INDEX33555531 ON ICOAP_TJ.IMPLEMENT_PLAN (IMPL_NO);


-- ICOAP_TJ.INVENTORY_DETAILS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.INVENTORY_DETAILS;

CREATE TABLE ICOAP_TJ.INVENTORY_DETAILS (
                                            "NO" VARCHAR2(100) NOT NULL,
                                            ORG_NO VARCHAR2(100),
                                            YES_REMAINDER_BOXS VARCHAR2(2000),
                                            IN_BOXS VARCHAR2(2000),
                                            OUT_BOXS VARCHAR2(2000),
                                            REMAINDER_BOXS VARCHAR2(2000),
                                            DATE_TIME VARCHAR2(100),
                                            CONSTRAINT INVENTORY_DETAILS_PK PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555535 ON ICOAP_TJ.INVENTORY_DETAILS ("NO");
CREATE INDEX INVENTORY_DETAILS_ORG_NO_IDX ON ICOAP_TJ.INVENTORY_DETAILS (ORG_NO);


-- ICOAP_TJ.INVENTORY_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.INVENTORY_TABLE;

CREATE TABLE ICOAP_TJ.INVENTORY_TABLE (
                                          BOX_CURRENT_ORG VARCHAR(100) NOT NULL,
                                          BOX_AFFILIATION_ORG VARCHAR(100) NOT NULL,
                                          OUT_TRE VARCHAR(4000),
                                          TRE VARCHAR(4000),
                                          YE_TRE VARCHAR(4000),
                                          IN_TRE VARCHAR(4000),
                                          CREATE_DATE VARCHAR(100),
                                          CREATE_TIME VARCHAR(100)
);
CREATE INDEX INVENTORY_TABLE_BOX_CURRENT_ORG_IDX ON ICOAP_TJ.INVENTORY_TABLE (BOX_CURRENT_ORG,BOX_AFFILIATION_ORG,CREATE_DATE,CREATE_TIME);


-- ICOAP_TJ.LIB_BOX definition

-- Drop table

-- DROP TABLE ICOAP_TJ.LIB_BOX;

CREATE TABLE ICOAP_TJ.LIB_BOX (
                                  "NO" VARCHAR2(100) NOT NULL,
                                  STATE VARCHAR2(100),
                                  RECEIVER VARCHAR2(100),
                                  DELIVER VARCHAR2(100),
                                  "DATE" VARCHAR2(100),
                                  "TIME" VARCHAR2(100),
                                  ORG_NO VARCHAR2(100),
                                  IN_ORG VARCHAR2(100),
                                  CONSTRAINT LIB_BOX_PK PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555540 ON ICOAP_TJ.LIB_BOX ("NO");


-- ICOAP_TJ.LINE_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.LINE_INFO;

CREATE TABLE ICOAP_TJ.LINE_INFO (
                                    LINE_NO VARCHAR2(50) NOT NULL,
                                    LINE_NAME VARCHAR2(300) NOT NULL,
                                    DELIVER_ORG_NO VARCHAR2(100) NOT NULL,
                                    RECEIVE_ORG_NO VARCHAR2(2000) NOT NULL,
                                    NOTE VARCHAR2(500),
                                    CAR_NO VARCHAR2(100),
                                    ESCORT_NO VARCHAR2(100),
                                    CONSTRAINT SYS_LINE_PK PRIMARY KEY (LINE_NO)
);
CREATE UNIQUE INDEX INDEX33555542 ON ICOAP_TJ.LINE_INFO (LINE_NO);


-- ICOAP_TJ.MAT_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.MAT_INFO;

CREATE TABLE ICOAP_TJ.MAT_INFO (
                                   MAT_NO VARCHAR2(100) NOT NULL,
                                   MAT_NUM VARCHAR2(100),
                                   UNIT VARCHAR2(100),
                                   FLAG VARCHAR2(100),
                                   CONSTRAINT MAT_INFO_PK PRIMARY KEY (MAT_NO)
);
CREATE UNIQUE INDEX INDEX33555544 ON ICOAP_TJ.MAT_INFO (MAT_NO);


-- ICOAP_TJ.MIDDLE_BRANCH_USER definition

-- Drop table

-- DROP TABLE ICOAP_TJ.MIDDLE_BRANCH_USER;

CREATE TABLE ICOAP_TJ.MIDDLE_BRANCH_USER (
                                             MI_NO VARCHAR(100) NOT NULL,
                                             USER_NO VARCHAR(100) NOT NULL
);


-- ICOAP_TJ.OPERATION_LOG definition

-- Drop table

-- DROP TABLE ICOAP_TJ.OPERATION_LOG;

CREATE TABLE ICOAP_TJ.OPERATION_LOG (
                                        "NO" VARCHAR2(100) NOT NULL,
                                        RECORD_TIME VARCHAR2(100),
                                        ORG_NAME VARCHAR2(100),
                                        OPERATOR_NO VARCHAR2(100),
                                        OPERATOR_NAME VARCHAR2(100),
                                        "ACTION" VARCHAR2(100),
                                        LOG_INFO VARCHAR2(100),
                                        CONSTRAINT OPERATION_LOG_PK PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555547 ON ICOAP_TJ.OPERATION_LOG ("NO");


-- ICOAP_TJ.ORDER_DETAIL definition

-- Drop table

-- DROP TABLE ICOAP_TJ.ORDER_DETAIL;

CREATE TABLE ICOAP_TJ.ORDER_DETAIL (
                                       ORDER_NO VARCHAR2(100) NOT NULL,
                                       APPLICATION_AMOUNT VARCHAR2(100),
                                       CURRENCY_NO VARCHAR2(100),
                                       MAT_NO VARCHAR2(100),
                                       EDITION VARCHAR2(100),
                                       "NO" INTEGER NOT NULL,
                                       BOX_NO VARCHAR2(50),
                                       CONSTRAINT ORDER_DETAIL_PK PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555705 ON ICOAP_TJ.ORDER_DETAIL ("NO");
CREATE INDEX ORDER_DETAIL_ORDER_NO_IDX ON ICOAP_TJ.ORDER_DETAIL (ORDER_NO);


-- ICOAP_TJ.ORDER_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.ORDER_TABLE;

CREATE TABLE ICOAP_TJ.ORDER_TABLE (
                                      "NO" VARCHAR2(100) NOT NULL,
                                      APPLY_USER_NO VARCHAR2(100),
                                      APPLY_USER_NAME VARCHAR2(100),
                                      APPLY_ORG_NO VARCHAR2(100) NOT NULL,
                                      APPLY_ORG_NAME VARCHAR2(100),
                                      TREASURY_NO VARCHAR2(100),
                                      TREASURY_NAME VARCHAR2(100),
                                      APPLY_DATE VARCHAR2(100),
                                      APPLY_TIME VARCHAR2(100),
                                      AUDIT_USER_NO VARCHAR2(100),
                                      AUDIT_USER_NAME VARCHAR2(100),
                                      AUDIT_DATE VARCHAR2(100),
                                      AUDIT_TIME VARCHAR2(100),
                                      CANCEL_USER_NO VARCHAR2(100),
                                      CANCEL_USER_NAME VARCHAR2(100),
                                      CANCEL_DATE VARCHAR2(100),
                                      CANCEL_TIME VARCHAR2(100),
                                      AMOUNT VARCHAR2(500),
                                      "TYPE" VARCHAR2(10) NOT NULL,
                                      STATUS VARCHAR2(10) DEFAULT 1 NOT NULL,
                                      EXECUTE_DATE VARCHAR2(100),
                                      IMPLEMENT_PLAN_NO VARCHAR2(100),
                                      RE_IMPLEMENT_PLAN_NO VARCHAR2(100),
                                      RE_EXECUTE_DATE VARCHAR2(100),
                                      AUDIT_OPINION VARCHAR2(100),
                                      ORDER_NO VARCHAR2(100),
                                      NOTE VARCHAR2(500),
                                      ORDER_FATHER VARCHAR(100),
                                      CONSTRAINT ORDER_TABLE_ONE_PK PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555552 ON ICOAP_TJ.ORDER_TABLE ("NO");
CREATE INDEX ORDER_TABLE_EXECUTE_DATE_IDX ON ICOAP_TJ.ORDER_TABLE (EXECUTE_DATE);
CREATE INDEX ORDER_TABLE_ORDER_FATHER_IDX ON ICOAP_TJ.ORDER_TABLE (ORDER_FATHER);
CREATE INDEX ORDER_TABLE_TYPE_IDX ON ICOAP_TJ.ORDER_TABLE ("TYPE",STATUS);


-- ICOAP_TJ.QRTZ_CALENDARS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_CALENDARS;

CREATE TABLE ICOAP_TJ.QRTZ_CALENDARS (
                                         SCHED_NAME NVARCHAR(480) NOT NULL,
                                         CALENDAR_NAME NVARCHAR(800) NOT NULL,
                                         CALENDAR BLOB NOT NULL,
                                         CONSTRAINT SYS_C008034 PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);
CREATE UNIQUE INDEX INDEX33555557 ON ICOAP_TJ.QRTZ_CALENDARS (SCHED_NAME,CALENDAR_NAME);


-- ICOAP_TJ.QRTZ_FIRED_TRIGGERS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_FIRED_TRIGGERS;

CREATE TABLE ICOAP_TJ.QRTZ_FIRED_TRIGGERS (
                                              SCHED_NAME NVARCHAR(480) NOT NULL,
                                              ENTRY_ID NVARCHAR(380) NOT NULL,
                                              TRIGGER_NAME NVARCHAR(800) NOT NULL,
                                              TRIGGER_GROUP NVARCHAR(800) NOT NULL,
                                              INSTANCE_NAME NVARCHAR(800) NOT NULL,
                                              FIRED_TIME NUMBER(20,0) NOT NULL,
                                              SCHED_TIME NUMBER(20,0) NOT NULL,
                                              PRIORITY NUMBER(11,0) NOT NULL,
                                              STATE NVARCHAR(64) NOT NULL,
                                              JOB_NAME NVARCHAR(800),
                                              JOB_GROUP NVARCHAR(800),
                                              IS_NONCONCURRENT NVARCHAR(4),
                                              REQUESTS_RECOVERY NVARCHAR(4),
                                              CONSTRAINT SYS_C008033 PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);
CREATE UNIQUE INDEX INDEX33555559 ON ICOAP_TJ.QRTZ_FIRED_TRIGGERS (SCHED_NAME,ENTRY_ID);


-- ICOAP_TJ.QRTZ_JOB_DETAILS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_JOB_DETAILS;

CREATE TABLE ICOAP_TJ.QRTZ_JOB_DETAILS (
                                           SCHED_NAME NVARCHAR(480) NOT NULL,
                                           JOB_NAME NVARCHAR(800) NOT NULL,
                                           JOB_GROUP NVARCHAR(800) NOT NULL,
                                           DESCRIPTION NVARCHAR(1000),
                                           JOB_CLASS_NAME NVARCHAR(1000) NOT NULL,
                                           IS_DURABLE NVARCHAR(4) NOT NULL,
                                           IS_NONCONCURRENT NVARCHAR(4) NOT NULL,
                                           IS_UPDATE_DATA NVARCHAR(4) NOT NULL,
                                           REQUESTS_RECOVERY NVARCHAR(4) NOT NULL,
                                           JOB_DATA BLOB,
                                           CONSTRAINT SYS_C008037 PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);
CREATE UNIQUE INDEX INDEX33555561 ON ICOAP_TJ.QRTZ_JOB_DETAILS (SCHED_NAME,JOB_NAME,JOB_GROUP);


-- ICOAP_TJ.QRTZ_LOCKS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_LOCKS;

CREATE TABLE ICOAP_TJ.QRTZ_LOCKS (
                                     SCHED_NAME NVARCHAR(480) NOT NULL,
                                     LOCK_NAME NVARCHAR(160) NOT NULL,
                                     CONSTRAINT SYS_C008038 PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);
CREATE UNIQUE INDEX INDEX33555563 ON ICOAP_TJ.QRTZ_LOCKS (SCHED_NAME,LOCK_NAME);


-- ICOAP_TJ.QRTZ_PAUSED_TRIGGER_GRPS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_PAUSED_TRIGGER_GRPS;

CREATE TABLE ICOAP_TJ.QRTZ_PAUSED_TRIGGER_GRPS (
                                                   SCHED_NAME NVARCHAR(480) NOT NULL,
                                                   TRIGGER_GROUP NVARCHAR(800) NOT NULL,
                                                   CONSTRAINT SYS_C008039 PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);
CREATE UNIQUE INDEX INDEX33555565 ON ICOAP_TJ.QRTZ_PAUSED_TRIGGER_GRPS (SCHED_NAME,TRIGGER_GROUP);


-- ICOAP_TJ.QRTZ_SCHEDULER_STATE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_SCHEDULER_STATE;

CREATE TABLE ICOAP_TJ.QRTZ_SCHEDULER_STATE (
                                               SCHED_NAME NVARCHAR(480) NOT NULL,
                                               INSTANCE_NAME NVARCHAR(800) NOT NULL,
                                               LAST_CHECKIN_TIME NUMBER(20,0) NOT NULL,
                                               CHECKIN_INTERVAL NUMBER(20,0) NOT NULL,
                                               CONSTRAINT SYS_C008040 PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);
CREATE UNIQUE INDEX INDEX33555567 ON ICOAP_TJ.QRTZ_SCHEDULER_STATE (SCHED_NAME,INSTANCE_NAME);


-- ICOAP_TJ.QRTZ_TRIGGERS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_TRIGGERS;

CREATE TABLE ICOAP_TJ.QRTZ_TRIGGERS (
                                        SCHED_NAME NVARCHAR(480) NOT NULL,
                                        TRIGGER_NAME NVARCHAR(800) NOT NULL,
                                        TRIGGER_GROUP NVARCHAR(800) NOT NULL,
                                        JOB_NAME NVARCHAR(800) NOT NULL,
                                        JOB_GROUP NVARCHAR(800) NOT NULL,
                                        DESCRIPTION NVARCHAR(1000),
                                        NEXT_FIRE_TIME NUMBER(20,0),
                                        PREV_FIRE_TIME NUMBER(20,0),
                                        PRIORITY NUMBER(11,0),
                                        TRIGGER_STATE NVARCHAR(64) NOT NULL,
                                        TRIGGER_TYPE NVARCHAR(32) NOT NULL,
                                        START_TIME NUMBER(20,0) NOT NULL,
                                        END_TIME NUMBER(20,0),
                                        CALENDAR_NAME NVARCHAR(800),
                                        MISFIRE_INSTR NUMBER(6,0),
                                        JOB_DATA BLOB,
                                        CONSTRAINT SYS_C008043 PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE UNIQUE INDEX INDEX33555569 ON ICOAP_TJ.QRTZ_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX SCHED_NAME ON ICOAP_TJ.QRTZ_TRIGGERS (SCHED_NAME,JOB_NAME,JOB_GROUP);


-- ICOAP_TJ.SCENES_EVENT_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SCENES_EVENT_INFO;

CREATE TABLE ICOAP_TJ.SCENES_EVENT_INFO (
                                            ID NVARCHAR(128) NOT NULL,
                                            SCENES_ID NVARCHAR(40) NOT NULL,
                                            EVENT_ID NUMBER(11,0) NOT NULL,
                                            CONSTRAINT SYS_C007724 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555572 ON ICOAP_TJ.SCENES_EVENT_INFO (ID);


-- ICOAP_TJ.SCENES_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SCENES_INFO;

CREATE TABLE ICOAP_TJ.SCENES_INFO (
                                      SCENES_ID NVARCHAR(40) NOT NULL,
                                      SCENES_NAME NVARCHAR(200) NOT NULL,
                                      AREA_ID NVARCHAR(40) NOT NULL,
                                      "DESC" NVARCHAR(1020),
                                      CREATE_OP_NO NVARCHAR(128),
                                      CREATE_OP_NAME NVARCHAR(128),
                                      CREATE_TIME NVARCHAR(80),
                                      UPDATE_OP_NO NVARCHAR(128),
                                      UPDATE_OP_NAME NVARCHAR(128),
                                      UPDATE_TIME NVARCHAR(80),
                                      AM_START_TIME NVARCHAR(80),
                                      AM_END_TIME NVARCHAR(80),
                                      VIOLATION_CALCULATE_FLAG VARCHAR2(2) DEFAULT 0,
                                      PM_START_TIME NVARCHAR(80),
                                      PM_END_TIME NVARCHAR(80),
                                      CONSTRAINT SYS_C0014988 PRIMARY KEY (SCENES_ID)
);
CREATE UNIQUE INDEX INDEX33555574 ON ICOAP_TJ.SCENES_INFO (SCENES_ID);


-- ICOAP_TJ.SCENES_RULE_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SCENES_RULE_INFO;

CREATE TABLE ICOAP_TJ.SCENES_RULE_INFO (
                                           ID NVARCHAR(128) NOT NULL,
                                           TASK_ID NVARCHAR(128) NOT NULL,
                                           EVENT_ID NUMBER(11,0) NOT NULL,
                                           RULE NVARCHAR(1020),
                                           CONSTRAINT SYS_C007726 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555576 ON ICOAP_TJ.SCENES_RULE_INFO (ID);
CREATE INDEX "fk_scenes_rule_event_info" ON ICOAP_TJ.SCENES_RULE_INFO (EVENT_ID);
CREATE INDEX "fk_scenes_rule_scenes_task" ON ICOAP_TJ.SCENES_RULE_INFO (TASK_ID);


-- ICOAP_TJ.SCENES_TASK_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SCENES_TASK_INFO;

CREATE TABLE ICOAP_TJ.SCENES_TASK_INFO (
                                           TASK_ID NVARCHAR(128) NOT NULL,
                                           CAMERA_ID NVARCHAR(40) NOT NULL,
                                           SCENES_ID NVARCHAR(40) NOT NULL,
                                           BLOCK_ID NVARCHAR(1020),
                                           AI_FPS NVARCHAR(40),
                                           TASK_FLAG NVARCHAR(8),
                                           TASK_MSG NVARCHAR(1020),
                                           GROUP_ID NVARCHAR(40),
                                           TASK_SWITCH_FLAG VARCHAR2(100),
                                           TIME_JOB_FLAG VARCHAR2(100),
                                           CONSTRAINT SYS_C007727 PRIMARY KEY (TASK_ID)
);
CREATE UNIQUE INDEX INDEX33555580 ON ICOAP_TJ.SCENES_TASK_INFO (TASK_ID);
CREATE INDEX "fk_scenes_task_info_camera_id" ON ICOAP_TJ.SCENES_TASK_INFO (CAMERA_ID);
CREATE INDEX "fk_scenes_task_info_scenes_info_1" ON ICOAP_TJ.SCENES_TASK_INFO (SCENES_ID);


-- ICOAP_TJ.SPECIAL_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SPECIAL_TABLE;

CREATE TABLE ICOAP_TJ.SPECIAL_TABLE (
                                        SPECIAL_DAY VARCHAR2(100) NOT NULL,
                                        DAY_TYPE VARCHAR2(100) NOT NULL,
                                        IS_WORK VARCHAR2(100) DEFAULT 0,
                                        NOTE VARCHAR2(100) NOT NULL,
                                        NOTE1 VARCHAR2(100) NOT NULL,
                                        CONSTRAINT SPECIAL_TABLE_PK PRIMARY KEY (NOTE1)
);
CREATE UNIQUE INDEX INDEX33555584 ON ICOAP_TJ.SPECIAL_TABLE (NOTE1);


-- ICOAP_TJ.STATION_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.STATION_INFO;

CREATE TABLE ICOAP_TJ.STATION_INFO (
                                       STATION_ID NVARCHAR(40) NOT NULL,
                                       ORG_NO NVARCHAR(80),
                                       STATION_IP NVARCHAR(80),
                                       STATION_NAME NVARCHAR(200),
                                       STATION_TYPE NVARCHAR(20),
                                       STATION_PORT NVARCHAR(40),
                                       SERVICE_IP NVARCHAR(200),
                                       CONSTRAINT SYS_C007728 PRIMARY KEY (STATION_ID)
);
CREATE UNIQUE INDEX INDEX33555586 ON ICOAP_TJ.STATION_INFO (STATION_ID);
CREATE INDEX "fk_station_info_dev_type" ON ICOAP_TJ.STATION_INFO (STATION_TYPE);
CREATE INDEX "fk_station_info_org_no" ON ICOAP_TJ.STATION_INFO (ORG_NO);


-- ICOAP_TJ.SYS_MENU definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_MENU;

CREATE TABLE ICOAP_TJ.SYS_MENU (
                                   "NO" NVARCHAR(40) NOT NULL,
                                   NAME NVARCHAR(200),
                                   MENU_FATHER NVARCHAR(40),
                                   URL NVARCHAR(800),
                                   MENU_LEVEL NUMBER(11,0),
                                   MENU_ORDER NUMBER(11,0),
                                   NOTE NVARCHAR(120),
                                   MENU_ICON NVARCHAR(320),
                                   MENU_SIZE NUMBER(11,0),
                                   MENU_BG NVARCHAR(120),
                                   BUTTON_TAG NUMBER(11,0),
                                   BUTTON NVARCHAR(80),
                                   GROUP_ID NVARCHAR(40),
                                   CONSTRAINT SYS_C007821 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555590 ON ICOAP_TJ.SYS_MENU ("NO");


-- ICOAP_TJ.SYS_MENU_PERMISSION definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_MENU_PERMISSION;

CREATE TABLE ICOAP_TJ.SYS_MENU_PERMISSION (
                                              MENU_NO NVARCHAR(40) NOT NULL,
                                              PERMISSION_NO NVARCHAR(40) NOT NULL,
                                              CONSTRAINT SYS_C007832 PRIMARY KEY (PERMISSION_NO,MENU_NO)
);
CREATE UNIQUE INDEX INDEX33555592 ON ICOAP_TJ.SYS_MENU_PERMISSION (PERMISSION_NO,MENU_NO);
CREATE INDEX MENU_PERMISSION_MENU ON ICOAP_TJ.SYS_MENU_PERMISSION (MENU_NO);


-- ICOAP_TJ.SYS_ORG definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_ORG;

CREATE TABLE ICOAP_TJ.SYS_ORG (
                                  ORG_NO NVARCHAR(128) NOT NULL,
                                  NAME NVARCHAR(640),
                                  SHORT_NAME NVARCHAR(200),
                                  FULL_NAME NVARCHAR(640),
                                  PARENT_ORG NVARCHAR(128),
                                  LEFT_ORG NUMBER(11,0),
                                  RIGHT_ORG NUMBER(11,0),
                                  ORG_GRADE_NO NUMBER(11,0),
                                  X NVARCHAR(80),
                                  Y NVARCHAR(80),
                                  ADDRESS NVARCHAR(800),
                                  LINKMAN NVARCHAR(200),
                                  TELEPHONE NVARCHAR(120),
                                  MOBILE NVARCHAR(120),
                                  FAX NVARCHAR(120),
                                  EMAIL NVARCHAR(160),
                                  CUP_AREA_CODE NVARCHAR(32),
                                  ADDRESS_CODE NVARCHAR(60),
                                  AREA_NO NVARCHAR(40),
                                  AREA_TYPE NVARCHAR(12),
                                  ORG_PHYSICS_CATALOG NVARCHAR(12),
                                  STATUS NUMBER(11,0),
                                  CLR_CENTER_FLAG NUMBER(11,0),
                                  CLR_CENTER_NO NVARCHAR(40),
                                  ACCOUNT_FLAG NUMBER(11,0),
                                  NOTE NVARCHAR(400),
                                  AFFILIATED_TYPE NUMBER(11,0),
                                  AFFILIATED_BANK NVARCHAR(128),
                                  PENSION NUMBER(11,0),
                                  PENSION_PEAK NUMBER(11,0),
                                  ACCOUNT_NO NVARCHAR(128),
                                  PARKING_FLAG NUMBER(11,0),
                                  CONSTRAINT SYS_C007833 PRIMARY KEY (ORG_NO)
);
CREATE UNIQUE INDEX INDEX33555595 ON ICOAP_TJ.SYS_ORG (ORG_NO);


-- ICOAP_TJ.SYS_ORG_AREA definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_ORG_AREA;

CREATE TABLE ICOAP_TJ.SYS_ORG_AREA (
                                       ID NVARCHAR(80) NOT NULL,
                                       AREA_ID NVARCHAR(44) NOT NULL,
                                       AREA_NAME NVARCHAR(1020),
                                       ORG_NO NVARCHAR(80),
                                       "DESC" NVARCHAR(1020),
                                       NOTE NVARCHAR(1020),
                                       PERSON_LIMIT NUMBER(11,0),
                                       TEMPERATURE_LIMIT NVARCHAR(40),
                                       TEMPERATURE NVARCHAR(40),
                                       AIR_QUALITY NVARCHAR(20),
                                       EMAP_COORDINATE NVARCHAR(8000),
                                       CONSTRAINT SYS_C007730 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555597 ON ICOAP_TJ.SYS_ORG_AREA (ID);
CREATE INDEX "fk_sys_org_area_area_table_1" ON ICOAP_TJ.SYS_ORG_AREA (AREA_ID);
CREATE INDEX "fk_sys_org_area_sys_org_1" ON ICOAP_TJ.SYS_ORG_AREA (ORG_NO);


-- ICOAP_TJ.SYS_ORG_EMAP definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_ORG_EMAP;

CREATE TABLE ICOAP_TJ.SYS_ORG_EMAP (
                                       ORG_NO NVARCHAR(80) NOT NULL,
                                       ORG_NAME NVARCHAR(200),
                                       PLAN_PATH NVARCHAR(400),
                                       MODEL_PATH NVARCHAR(400),
                                       CONSTRAINT SYS_C007731 PRIMARY KEY (ORG_NO)
);
CREATE UNIQUE INDEX INDEX33555601 ON ICOAP_TJ.SYS_ORG_EMAP (ORG_NO);


-- ICOAP_TJ.SYS_ORG_GRADE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_ORG_GRADE;

CREATE TABLE ICOAP_TJ.SYS_ORG_GRADE (
                                        "NO" NUMBER(11,0) NOT NULL,
                                        NAME NVARCHAR(200) NOT NULL,
                                        ORG_TYPE NVARCHAR(80),
                                        CONSTRAINT SYS_C007834 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555603 ON ICOAP_TJ.SYS_ORG_GRADE ("NO");


-- ICOAP_TJ.SYS_ORG_MANAGER definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_ORG_MANAGER;

CREATE TABLE ICOAP_TJ.SYS_ORG_MANAGER (
                                          ID NUMBER(11,0) NOT NULL,
                                          ORG_NO NVARCHAR(80) NOT NULL,
                                          ORG_NAME NVARCHAR(320) NOT NULL,
                                          USER_NO NVARCHAR(80) NOT NULL,
                                          USER_NAME NVARCHAR(200) NOT NULL,
                                          CONSTRAINT SYS_C007732 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555605 ON ICOAP_TJ.SYS_ORG_MANAGER (ID);


-- ICOAP_TJ.SYS_PARAM definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_PARAM;

CREATE TABLE ICOAP_TJ.SYS_PARAM (
                                    LOGIC_NO NVARCHAR(128) NOT NULL,
                                    "CATALOG" NUMBER(11,0),
                                    PARAM_NAME NVARCHAR(320),
                                    PARAM_VALUE NVARCHAR(1024),
                                    "STATEMENT" NVARCHAR(400),
                                    DESCRIPTION NVARCHAR(400),
                                    CONSTRAINT SYS_C007836 PRIMARY KEY (LOGIC_NO)
);
CREATE UNIQUE INDEX INDEX33555607 ON ICOAP_TJ.SYS_PARAM (LOGIC_NO);


-- ICOAP_TJ.SYS_PARAM_CATALOG definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_PARAM_CATALOG;

CREATE TABLE ICOAP_TJ.SYS_PARAM_CATALOG (
                                            "CATALOG" NUMBER(11,0) NOT NULL,
                                            CATALOG_NAME NVARCHAR(160),
                                            DESCRIPTION NVARCHAR(400),
                                            CONSTRAINT SYS_C007837 PRIMARY KEY ("CATALOG")
);
CREATE UNIQUE INDEX INDEX33555609 ON ICOAP_TJ.SYS_PARAM_CATALOG ("CATALOG");


-- ICOAP_TJ.SYS_PERMISSION definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_PERMISSION;

CREATE TABLE ICOAP_TJ.SYS_PERMISSION (
                                         "NO" NVARCHAR(80) NOT NULL,
                                         NAME NVARCHAR(200) NOT NULL,
                                         URL NVARCHAR(800) NOT NULL,
                                         "METHOD" NVARCHAR(40),
                                         "CATALOG" NUMBER(11,0) DEFAULT 2 NOT NULL,
                                         NOTE NVARCHAR(800),
                                         CONSTRAINT SYS_C007838 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555611 ON ICOAP_TJ.SYS_PERMISSION ("NO");


-- ICOAP_TJ.SYS_POST definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_POST;

CREATE TABLE ICOAP_TJ.SYS_POST (
                                   POST_NO NVARCHAR(128) NOT NULL,
                                   POST_NAME NVARCHAR(400),
                                   POST_TYPE NUMBER(11,0),
                                   NOTE NVARCHAR(800),
                                   IS_OUTSOURCING NUMBER(11,0) DEFAULT 0 NOT NULL,
                                   CONSTRAINT SYS_C007824 PRIMARY KEY (POST_NO)
);
CREATE UNIQUE INDEX INDEX33555613 ON ICOAP_TJ.SYS_POST (POST_NO);


-- ICOAP_TJ.SYS_POST_LIMIT definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_POST_LIMIT;

CREATE TABLE ICOAP_TJ.SYS_POST_LIMIT (
                                         POST_NO NVARCHAR(128) NOT NULL,
                                         POST_LIMIT_NO NVARCHAR(128) NOT NULL,
                                         POST_LIMIT_NAME NVARCHAR(400),
                                         NOTE NVARCHAR(400),
                                         CONSTRAINT SYS_C007839 PRIMARY KEY (POST_NO,POST_LIMIT_NO)
);
CREATE UNIQUE INDEX INDEX33555615 ON ICOAP_TJ.SYS_POST_LIMIT (POST_NO,POST_LIMIT_NO);


-- ICOAP_TJ.SYS_PUSH_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_PUSH_INFO;

CREATE TABLE ICOAP_TJ.SYS_PUSH_INFO (
                                        "NO" NVARCHAR(128) NOT NULL,
                                        PUSH_TIME NVARCHAR(80),
                                        PUSH_USER NVARCHAR(80),
                                        MESSAGE CLOB,
                                        NOTICE_WAY NUMBER(11,0),
                                        NOTICE_CATEGORY NVARCHAR(40),
                                        NOTICE_CATEGORY_DESCRIPTION NVARCHAR(128),
                                        NOTICE_FLAG NUMBER(11,0),
                                        NOTICE_TITLE NVARCHAR(200),
                                        NOTICE_ADDRESS NVARCHAR(200),
                                        ABSTRACT NVARCHAR(400),
                                        NOTICE_TYPE NUMBER(11,0),
                                        CONSTRAINT SYS_C007840 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555617 ON ICOAP_TJ.SYS_PUSH_INFO ("NO");


-- ICOAP_TJ.SYS_ROLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_ROLE;

CREATE TABLE ICOAP_TJ.SYS_ROLE (
                                   "NO" NUMBER(11,0) NOT NULL,
                                   NAME NVARCHAR(200),
                                   "CATALOG" NUMBER(11,0),
                                   ORG_GRADE_NO NUMBER(11,0),
                                   NOTE NVARCHAR(800),
                                   MAXUSERNUM NUMBER(11,0),
                                   CONSTRAINT SYS_C007823 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555619 ON ICOAP_TJ.SYS_ROLE ("NO");


-- ICOAP_TJ.SYS_ROLE_MENU definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_ROLE_MENU;

CREATE TABLE ICOAP_TJ.SYS_ROLE_MENU (
                                        ROLE_NO NUMBER(11,0) NOT NULL,
                                        MENU_NO NVARCHAR(40) NOT NULL,
                                        CONSTRAINT SYS_C007841 PRIMARY KEY (ROLE_NO,MENU_NO)
);
CREATE UNIQUE INDEX INDEX33555621 ON ICOAP_TJ.SYS_ROLE_MENU (ROLE_NO,MENU_NO);
CREATE INDEX ROLE_MENU_MENU ON ICOAP_TJ.SYS_ROLE_MENU (MENU_NO);


-- ICOAP_TJ.SYS_USER definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_USER;

CREATE TABLE ICOAP_TJ.SYS_USER (
                                   USER_NO NVARCHAR(80) NOT NULL,
                                   PASSWORD NVARCHAR(320),
                                   NAME NVARCHAR(200),
                                   STATUS NUMBER(11,0),
                                   ONLINE_FLAG NUMBER(11,0),
                                   ORG_NO NVARCHAR(128),
                                   PHONE NVARCHAR(80),
                                   MOBILE NVARCHAR(80),
                                   EMAIL NVARCHAR(160),
                                   LOGIN_IP NVARCHAR(80),
                                   LOGIN_TIME TIMESTAMP,
                                   LOGIN_TERM NVARCHAR(200),
                                   PASSWORD_ERROR NUMBER(11,0),
                                   PASSWORD_EXPIRATION NVARCHAR(40),
                                   SERVICE_COMPANY NVARCHAR(80),
                                   TELLER_NO NVARCHAR(128),
                                   TELLER_CASH_BOX_NO NVARCHAR(128),
                                   ORDER_TYPE NVARCHAR(128),
                                   ID_NUMBER NVARCHAR(400),
                                   CONSTRAINT SYS_C007822 PRIMARY KEY (USER_NO)
);
CREATE UNIQUE INDEX INDEX33555624 ON ICOAP_TJ.SYS_USER (USER_NO);


-- ICOAP_TJ.SYS_USER_MENU_COLLECTION definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_USER_MENU_COLLECTION;

CREATE TABLE ICOAP_TJ.SYS_USER_MENU_COLLECTION (
                                                   USER_NO NVARCHAR(80) NOT NULL,
                                                   MENU_NO NVARCHAR(40) NOT NULL,
                                                   CONSTRAINT SYS_C007842 PRIMARY KEY (USER_NO,MENU_NO)
);
CREATE UNIQUE INDEX INDEX33555626 ON ICOAP_TJ.SYS_USER_MENU_COLLECTION (USER_NO,MENU_NO);


-- ICOAP_TJ.SYS_USER_POST definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_USER_POST;

CREATE TABLE ICOAP_TJ.SYS_USER_POST (
                                        USER_NO NVARCHAR(80) NOT NULL,
                                        POST_NO NVARCHAR(128) NOT NULL,
                                        CONSTRAINT SYS_C007843 PRIMARY KEY (USER_NO,POST_NO)
);
CREATE UNIQUE INDEX INDEX33555628 ON ICOAP_TJ.SYS_USER_POST (USER_NO,POST_NO);


-- ICOAP_TJ.SYS_USER_ROLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_USER_ROLE;

CREATE TABLE ICOAP_TJ.SYS_USER_ROLE (
                                        USER_NO NVARCHAR(80) NOT NULL,
                                        ROLE_NO NUMBER(11,0) NOT NULL,
                                        CONSTRAINT SYS_C007844 PRIMARY KEY (USER_NO,ROLE_NO)
);
CREATE UNIQUE INDEX INDEX33555630 ON ICOAP_TJ.SYS_USER_ROLE (USER_NO,ROLE_NO);


-- ICOAP_TJ.SYS_WEB_LOG definition

-- Drop table

-- DROP TABLE ICOAP_TJ.SYS_WEB_LOG;

CREATE TABLE ICOAP_TJ.SYS_WEB_LOG (
                                      USER_NO NVARCHAR(80),
                                      TID NVARCHAR(200),
                                      "METHOD" NVARCHAR(40),
                                      URL NVARCHAR(800),
                                      "RESULT" NVARCHAR(40),
                                      START_TIME NVARCHAR(80),
                                      COST_TIME NUMBER(20,0),
                                      CLIENT_IP NVARCHAR(200),
                                      SERVER_IP NVARCHAR(200),
                                      DESCRIPTION NVARCHAR(800),
                                      REQUEST NVARCHAR(800)
);


-- ICOAP_TJ.TIME_JOB definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TIME_JOB;

CREATE TABLE ICOAP_TJ.TIME_JOB (
                                   "NO" NVARCHAR(144) NOT NULL,
                                   TRIG_NAME NVARCHAR(160),
                                   CRON NVARCHAR(160),
                                   JOB_NAME NVARCHAR(160),
                                   OBJ_NAME NVARCHAR(320),
                                   CONCURRENT NUMBER(11,0),
                                   JOB_STATE NUMBER(11,0),
                                   DESP NVARCHAR(400),
                                   ARGUMENTS NVARCHAR(400),
                                   INIT_FLAG NUMBER(11,0),
                                   CONSTRAINT SYS_C008044 PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555634 ON ICOAP_TJ.TIME_JOB ("NO");


-- ICOAP_TJ.TIME_JOB_LOG definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TIME_JOB_LOG;

CREATE TABLE ICOAP_TJ.TIME_JOB_LOG (
                                       LOGIC_NO NVARCHAR(144) NOT NULL,
                                       JOB_NAME NVARCHAR(160),
                                       JOB_TYPE NUMBER(11,0),
                                       JOB_RESULT NUMBER(11,0),
                                       JOB_CREATOR NVARCHAR(80),
                                       START_TIME NVARCHAR(80),
                                       END_TIME NVARCHAR(80),
                                       RESULT_DESC CLOB,
                                       CONSTRAINT SYS_C008045 PRIMARY KEY (LOGIC_NO)
);
CREATE UNIQUE INDEX INDEX33555636 ON ICOAP_TJ.TIME_JOB_LOG (LOGIC_NO);


-- ICOAP_TJ.TR_CASH_ACCOUNT definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TR_CASH_ACCOUNT;

CREATE TABLE ICOAP_TJ.TR_CASH_ACCOUNT (
                                          ORG_NO VARCHAR2(100),
                                          INCOME_AMOUNT VARCHAR2(100),
                                          PAY_AMOUNT VARCHAR2(100),
                                          BALANCE VARCHAR2(100),
                                          INCOME_VOUCHER_NUM VARCHAR2(100),
                                          TRANSACTOR VARCHAR2(100),
                                          CHECKER VARCHAR2(100),
                                          "DATE" VARCHAR2(100),
                                          "TIME" VARCHAR2(100),
                                          ORG_NAME VARCHAR2(100),
                                          NOTE VARCHAR2(100),
                                          NOTE1 VARCHAR2(100),
                                          MAT_NO VARCHAR2(100),
                                          PAY_VOUCHER_NUM VARCHAR2(100),
                                          CASH_NO INTEGER NOT NULL,
                                          CONSTRAINT TR_CASH_ACCOUNT_PK PRIMARY KEY (CASH_NO)
);
CREATE UNIQUE INDEX INDEX33555712 ON ICOAP_TJ.TR_CASH_ACCOUNT (CASH_NO);
CREATE INDEX TR_CASH_ACCOUNT_DATE_IDX ON ICOAP_TJ.TR_CASH_ACCOUNT ("DATE");


-- ICOAP_TJ.TR_CASH_COUPON definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TR_CASH_COUPON;

CREATE TABLE ICOAP_TJ.TR_CASH_COUPON (
                                         ORG_NO VARCHAR2(100),
                                         MAT_NO VARCHAR2(100),
                                         ABSTRACT VARCHAR2(100),
                                         INCOME_AMOUNT VARCHAR2(100),
                                         PAY_AMOUNT VARCHAR2(100),
                                         BALANCE VARCHAR2(100),
                                         TRANSACTOR VARCHAR2(100),
                                         CHECKER VARCHAR2(100),
                                         "DATE" VARCHAR2(100),
                                         "TIME" VARCHAR2(100),
                                         ORG_NAME VARCHAR2(100),
                                         NOTE VARCHAR2(100),
                                         NOTE1 VARCHAR2(100),
                                         CASH_COUPON_NO INTEGER NOT NULL,
                                         CONSTRAINT TR_CASH_COUPON_PK PRIMARY KEY (CASH_COUPON_NO)
);
CREATE UNIQUE INDEX INDEX33555715 ON ICOAP_TJ.TR_CASH_COUPON (CASH_COUPON_NO);
CREATE INDEX TR_CASH_COUPON_DATE_IDX ON ICOAP_TJ.TR_CASH_COUPON ("DATE");


-- ICOAP_TJ.TR_NO_MANAGE_TRE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TR_NO_MANAGE_TRE;

CREATE TABLE ICOAP_TJ.TR_NO_MANAGE_TRE (
                                           ORG_NO VARCHAR2(100),
                                           VISITOR_ORG VARCHAR2(100),
                                           VISITOR_NAME VARCHAR2(100),
                                           PAPER_ID VARCHAR2(100),
                                           PAPER_NO VARCHAR2(100),
                                           ENTER_REASON VARCHAR2(100),
                                           TRANSACTOR VARCHAR2(100),
                                           CHECKER VARCHAR2(100),
                                           ENTER_TER_DATE VARCHAR2(100),
                                           ENTER_TER_TIME VARCHAR2(100),
                                           OUT_TER_TIME VARCHAR2(100),
                                           NOTE VARCHAR2(100),
                                           NOTE1 VARCHAR2(100),
                                           NO_MANAGE_TRE_NO INTEGER NOT NULL,
                                           CONSTRAINT TR_NO_MANAGE_TRE_PK PRIMARY KEY (NO_MANAGE_TRE_NO)
);
CREATE UNIQUE INDEX INDEX33555718 ON ICOAP_TJ.TR_NO_MANAGE_TRE (NO_MANAGE_TRE_NO);
CREATE INDEX TR_NO_MANAGE_TRE_ENTER_TER_DATE_IDX ON ICOAP_TJ.TR_NO_MANAGE_TRE (ENTER_TER_DATE);


-- ICOAP_TJ.TR_ORG_HAN_AMOUNT definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TR_ORG_HAN_AMOUNT;

CREATE TABLE ICOAP_TJ.TR_ORG_HAN_AMOUNT (
                                            CURRENCY_NO VARCHAR2(100),
                                            MAT_NO VARCHAR2(100),
                                            AMOUNT VARCHAR2(100),
                                            NOTE VARCHAR2(100),
                                            NOTE1 VARCHAR2(100),
                                            AMO_NO INTEGER NOT NULL,
                                            CHA_NO INTEGER,
                                            CONSTRAINT TR_ORG_HAN_AMOUNT_PK PRIMARY KEY (AMO_NO)
);
CREATE UNIQUE INDEX INDEX33555721 ON ICOAP_TJ.TR_ORG_HAN_AMOUNT (AMO_NO);
CREATE INDEX TR_ORG_HAN_AMOUNT_CHA_NO_IDX ON ICOAP_TJ.TR_ORG_HAN_AMOUNT (CHA_NO);


-- ICOAP_TJ.TR_ORG_HAN_CHA definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TR_ORG_HAN_CHA;

CREATE TABLE ICOAP_TJ.TR_ORG_HAN_CHA (
                                         CHA_PERSON VARCHAR2(100),
                                         CONFIRMR VARCHAR2(100),
                                         RECEIVER VARCHAR2(100),
                                         TURNOVER VARCHAR2(100),
                                         CHA_DATE VARCHAR2(100),
                                         REGISTER_DATE VARCHAR2(100),
                                         REASON VARCHAR2(100),
                                         NOTE VARCHAR2(100),
                                         ORG_NO VARCHAR2(100),
                                         "NO" INTEGER NOT NULL,
                                         CONSTRAINT TR_ORG_HAN_CHA_PK PRIMARY KEY ("NO")
);
CREATE UNIQUE INDEX INDEX33555724 ON ICOAP_TJ.TR_ORG_HAN_CHA ("NO");
CREATE INDEX TR_ORG_HAN_CHA_REGISTER_DATE_IDX ON ICOAP_TJ.TR_ORG_HAN_CHA (REGISTER_DATE,CHA_DATE);


-- ICOAP_TJ.TR_ORG_HAN_SUPERINTENDENT definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TR_ORG_HAN_SUPERINTENDENT;

CREATE TABLE ICOAP_TJ.TR_ORG_HAN_SUPERINTENDENT (
                                                    SUP_TYPE VARCHAR2(100),
                                                    DIRECTION VARCHAR2(100),
                                                    CHA_NO VARCHAR2(100),
                                                    OLD_NAME VARCHAR2(100),
                                                    NEW_NAME VARCHAR2(100),
                                                    NOTE VARCHAR2(100),
                                                    NOTE1 VARCHAR2(100),
                                                    SUP_NO INTEGER NOT NULL,
                                                    CONSTRAINT TR_ORG_HAN_SUPERINTENDENT_PK PRIMARY KEY (SUP_NO)
);
CREATE UNIQUE INDEX INDEX33555727 ON ICOAP_TJ.TR_ORG_HAN_SUPERINTENDENT (SUP_NO);
CREATE INDEX TR_ORG_HAN_SUPERINTENDENT_CHA_NO_IDX ON ICOAP_TJ.TR_ORG_HAN_SUPERINTENDENT (CHA_NO);


-- ICOAP_TJ.TR_PR_QRY_TRE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TR_PR_QRY_TRE;

CREATE TABLE ICOAP_TJ.TR_PR_QRY_TRE (
                                        ORG_NO VARCHAR2(100),
                                        ORG_NAME VARCHAR2(100),
                                        PR_QRY_NAME VARCHAR2(100),
                                        START_END_NUMBER VARCHAR2(100),
                                        BALANCE_LEAVE VARCHAR2(100),
                                        "MATCH" VARCHAR2(100),
                                        TRANSACTOR VARCHAR2(100),
                                        CHECKER VARCHAR2(100),
                                        "DATE" VARCHAR2(100),
                                        "TIME" VARCHAR2(100),
                                        NOTE VARCHAR2(100),
                                        NOTE1 VARCHAR2(100),
                                        PR_QRY_TRE_NO INTEGER NOT NULL,
                                        CONSTRAINT TR_PR_QRY_TRE_PK PRIMARY KEY (PR_QRY_TRE_NO)
);
CREATE UNIQUE INDEX INDEX33555730 ON ICOAP_TJ.TR_PR_QRY_TRE (PR_QRY_TRE_NO);
CREATE INDEX TR_PR_QRY_TRE_DATE_IDX ON ICOAP_TJ.TR_PR_QRY_TRE ("DATE");


-- ICOAP_TJ.TR_QRY_TRE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TR_QRY_TRE;

CREATE TABLE ICOAP_TJ.TR_QRY_TRE (
                                     ORG_NO VARCHAR2(100),
                                     ORG_NAME VARCHAR2(100),
                                     ORY_TRE_CONTENT VARCHAR2(100),
                                     ORY_TRE_IDEA VARCHAR2(100),
                                     TRANSACTOR VARCHAR2(100),
                                     CHECKER VARCHAR2(100),
                                     "DATE" VARCHAR2(100),
                                     "TIME" VARCHAR2(100),
                                     NOTE VARCHAR2(100),
                                     NOTE1 VARCHAR2(100),
                                     ORY_TRE_NO INTEGER NOT NULL,
                                     CONSTRAINT TR_QRY_TRE_PK PRIMARY KEY (ORY_TRE_NO)
);
CREATE UNIQUE INDEX INDEX33555733 ON ICOAP_TJ.TR_QRY_TRE (ORY_TRE_NO);


-- ICOAP_TJ.TREASURY_AREA_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.TREASURY_AREA_INFO;

CREATE TABLE ICOAP_TJ.TREASURY_AREA_INFO (
                                             TRE_NAME VARCHAR2(100) NOT NULL,
                                             ORG_NO NVARCHAR(128) NOT NULL,
                                             TRE_ADDRESS VARCHAR2(500),
                                             TRE_TYPE NUMBER NOT NULL,
                                             SERVICE VARCHAR2(100),
                                             OR_AUTOMATE NUMBER,
                                             TRE_STATUS NUMBER DEFAULT 0,
                                             LINE_NUMBER NUMBER DEFAULT 0,
                                             CAR_NUMBER NUMBER DEFAULT 0,
                                             TRE_ID VARCHAR2(100) NOT NULL,
                                             CONSTRAINT TREASURY_AREA_INFO_PK PRIMARY KEY (TRE_ID)
);
CREATE UNIQUE INDEX INDEX33555661 ON ICOAP_TJ.TREASURY_AREA_INFO (TRE_ID);
CREATE INDEX TREASURY_AREA_INFO_ORG_NO_IDX ON ICOAP_TJ.TREASURY_AREA_INFO (ORG_NO);


-- ICOAP_TJ.UNITFY_TASK_TABLE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.UNITFY_TASK_TABLE;

CREATE TABLE ICOAP_TJ.UNITFY_TASK_TABLE (
                                            SCENES_REAL_ID NVARCHAR(40) NOT NULL,
                                            TASK_ID NVARCHAR(128) NOT NULL,
                                            ANALYSIS_TIME NVARCHAR(2000) NOT NULL,
                                            GROUP_ID NVARCHAR(200) NOT NULL,
                                            IMG_INFO NVARCHAR(400),
                                            CREATE_TIME NVARCHAR(400) NOT NULL,
                                            UPDATE_TIME NVARCHAR(400),
                                            UPDATE_NUM NUMBER(38,0),
                                            ANALYSIS_DATA VARCHAR2(4000) NOT NULL,
                                            STATE NUMBER(38,0) DEFAULT 0 NOT NULL
);


-- ICOAP_TJ.VIOLATION_HANDLE_DETAIL definition

-- Drop table

-- DROP TABLE ICOAP_TJ.VIOLATION_HANDLE_DETAIL;

CREATE TABLE ICOAP_TJ.VIOLATION_HANDLE_DETAIL (
                                                  ID NUMBER(11,0) NOT NULL,
                                                  VIOLATION_HANDLE_ID NVARCHAR(80) NOT NULL,
                                                  VIOLATION_WORKER NVARCHAR(80),
                                                  VIOLATION_WORKER_NAME NVARCHAR(200),
                                                  EVENT_LEVEL NUMBER(4,0),
                                                  HANDLE_INFO NVARCHAR(1020),
                                                  NOTE NVARCHAR(1020),
                                                  CONSTRAINT SYS_C007734 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555665 ON ICOAP_TJ.VIOLATION_HANDLE_DETAIL (ID);
CREATE INDEX "fk_vhd_handle_id" ON ICOAP_TJ.VIOLATION_HANDLE_DETAIL (VIOLATION_HANDLE_ID);


-- ICOAP_TJ.VIOLATION_HANDLE_NODE definition

-- Drop table

-- DROP TABLE ICOAP_TJ.VIOLATION_HANDLE_NODE;

CREATE TABLE ICOAP_TJ.VIOLATION_HANDLE_NODE (
                                                ID NVARCHAR(80) NOT NULL,
                                                VIOLATION_ID NVARCHAR(80) NOT NULL,
                                                EVENT_ID NUMBER(11,0) NOT NULL,
                                                HANDLER_NO NVARCHAR(80),
                                                HANDLER_NAME NVARCHAR(200),
                                                ORG_NO NVARCHAR(80),
                                                VIOLATION_DESC NVARCHAR(1020),
                                                HANDLE_TIME NVARCHAR(80),
                                                CREATE_TIME NVARCHAR(80),
                                                HANDLE_STATUS NUMBER(4,0) DEFAULT 1,
                                                ORG_NAME VARCHAR2(50),
                                                CONSTRAINT SYS_C007735 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555668 ON ICOAP_TJ.VIOLATION_HANDLE_NODE (ID);
CREATE INDEX "fk_vhn_violation_id" ON ICOAP_TJ.VIOLATION_HANDLE_NODE (VIOLATION_ID);


-- ICOAP_TJ.VIOLATION_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.VIOLATION_INFO;

CREATE TABLE ICOAP_TJ.VIOLATION_INFO (
                                         ID NVARCHAR(80) NOT NULL,
                                         VIOLATION_NAME NVARCHAR(200) NOT NULL,
                                         VIOLATION_EVENT NUMBER(11,0) NOT NULL,
                                         EVENT_TYPE NVARCHAR(40),
                                         VIOLATION_DATE NVARCHAR(80),
                                         ORG_NO NVARCHAR(80),
                                         SCENES_ID NVARCHAR(40) NOT NULL,
                                         AREA_ID NVARCHAR(44),
                                         VIOLATION_DESC NVARCHAR(2000),
                                         IMG_INFO NVARCHAR(400),
                                         VIOLATION_START_TIME NVARCHAR(80),
                                         VIOLATION_END_TIME NVARCHAR(80),
                                         VIOLATION_VIDEO NUMBER(11,0),
                                         NOTE NVARCHAR(1024),
                                         VIDEO_STATUS NVARCHAR(8),
                                         VIDEO_STATUS_DESC NVARCHAR(1020),
                                         HANDLE_RESULT NVARCHAR(8) DEFAULT '0',
                                         RESULT_DESC NVARCHAR(1020),
                                         SERIAL_NO NVARCHAR(128),
                                         ORG_NAME VARCHAR2(50),
                                         CONSTRAINT SYS_C007737 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX INDEX33555671 ON ICOAP_TJ.VIOLATION_INFO (ID);
CREATE INDEX "fk_violation_info_area_table" ON ICOAP_TJ.VIOLATION_INFO (AREA_ID);
CREATE INDEX "fk_violation_info_event_info" ON ICOAP_TJ.VIOLATION_INFO (VIOLATION_EVENT);
CREATE INDEX "fk_violation_info_sys_org" ON ICOAP_TJ.VIOLATION_INFO (ORG_NO);


-- ICOAP_TJ.WARNING_INFO definition

-- Drop table

-- DROP TABLE ICOAP_TJ.WARNING_INFO;

CREATE TABLE ICOAP_TJ.WARNING_INFO (
                                       WARN_NO VARCHAR2(32) NOT NULL,
                                       LINE_NO VARCHAR2(50) NOT NULL,
                                       ORG_NO VARCHAR2(128) NOT NULL,
                                       PLATE VARCHAR2(32) NOT NULL,
                                       WARN_TYPE VARCHAR2(32),
                                       WARN_CLASS VARCHAR2(32),
                                       WARN_TIME VARCHAR2(100),
                                       WARN_INFO VARCHAR2(256),
                                       STATUS VARCHAR2(30) DEFAULT 0 NOT NULL,
                                       ERROR_PLACE VARCHAR2(100),
                                       HANDLE_USERNO VARCHAR2(50),
                                       HANDLE_USERNAME VARCHAR2(50),
                                       HANDLE_TIME VARCHAR2(100),
                                       HANDLE_RESULT VARCHAR2(256),
                                       CONSTRAINT WARNING_INFO_PK PRIMARY KEY (WARN_NO)
);
CREATE UNIQUE INDEX INDEX33555739 ON ICOAP_TJ.WARNING_INFO (WARN_NO);


-- ICOAP_TJ.WORK_POSITION definition

-- Drop table

-- DROP TABLE ICOAP_TJ.WORK_POSITION;

CREATE TABLE ICOAP_TJ.WORK_POSITION (
                                        POSITION_ID NVARCHAR(40) NOT NULL,
                                        POSITION_NAME NVARCHAR(200),
                                        ORG_NO NVARCHAR(80) NOT NULL,
                                        AREA_ID NVARCHAR(44) NOT NULL,
                                        "DESC" NVARCHAR(1020),
                                        AM_START_TIME NVARCHAR(40),
                                        AM_END_TIME NVARCHAR(40),
                                        PM_START_TIME NVARCHAR(40),
                                        PM_END_TIME NVARCHAR(40),
                                        AREA_COORDINATE NUMBER(11,0),
                                        ORG_NAME VARCHAR2(50),
                                        CONSTRAINT SYS_C007738 PRIMARY KEY (POSITION_ID)
);
CREATE UNIQUE INDEX INDEX33555676 ON ICOAP_TJ.WORK_POSITION (POSITION_ID);
CREATE INDEX "work_position_AREA_COORDINATE_IDX" ON ICOAP_TJ.WORK_POSITION (AREA_COORDINATE);


-- ICOAP_TJ.QRTZ_BLOB_TRIGGERS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_BLOB_TRIGGERS;

CREATE TABLE ICOAP_TJ.QRTZ_BLOB_TRIGGERS (
                                             SCHED_NAME NVARCHAR(480) NOT NULL,
                                             TRIGGER_NAME NVARCHAR(800) NOT NULL,
                                             TRIGGER_GROUP NVARCHAR(800) NOT NULL,
                                             BLOB_DATA BLOB,
                                             CONSTRAINT SYS_C008036 PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
                                             CONSTRAINT QRTZ_BLOB_TRIGGERS_IBFK_1 FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) REFERENCES ICOAP_TJ.QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE UNIQUE INDEX INDEX33555679 ON ICOAP_TJ.QRTZ_BLOB_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX INDEX33555680 ON ICOAP_TJ.QRTZ_BLOB_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);


-- ICOAP_TJ.QRTZ_CRON_TRIGGERS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_CRON_TRIGGERS;

CREATE TABLE ICOAP_TJ.QRTZ_CRON_TRIGGERS (
                                             SCHED_NAME NVARCHAR(480) NOT NULL,
                                             TRIGGER_NAME NVARCHAR(800) NOT NULL,
                                             TRIGGER_GROUP NVARCHAR(800) NOT NULL,
                                             CRON_EXPRESSION NVARCHAR(800) NOT NULL,
                                             TIME_ZONE_ID NVARCHAR(320),
                                             CONSTRAINT SYS_C008035 PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
                                             CONSTRAINT QRTZ_CRON_TRIGGERS_IBFK_1 FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) REFERENCES ICOAP_TJ.QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE UNIQUE INDEX INDEX33555682 ON ICOAP_TJ.QRTZ_CRON_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX INDEX33555683 ON ICOAP_TJ.QRTZ_CRON_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);


-- ICOAP_TJ.QRTZ_SIMPLE_TRIGGERS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_SIMPLE_TRIGGERS;

CREATE TABLE ICOAP_TJ.QRTZ_SIMPLE_TRIGGERS (
                                               SCHED_NAME NVARCHAR(480) NOT NULL,
                                               TRIGGER_NAME NVARCHAR(800) NOT NULL,
                                               TRIGGER_GROUP NVARCHAR(800) NOT NULL,
                                               REPEAT_COUNT NUMBER(20,0) NOT NULL,
                                               REPEAT_INTERVAL NUMBER(20,0) NOT NULL,
                                               TIMES_TRIGGERED NUMBER(20,0) NOT NULL,
                                               CONSTRAINT SYS_C008041 PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
                                               CONSTRAINT QRTZ_SIMPLE_TRIGGERS_IBFK_1 FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) REFERENCES ICOAP_TJ.QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE UNIQUE INDEX INDEX33555685 ON ICOAP_TJ.QRTZ_SIMPLE_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX INDEX33555686 ON ICOAP_TJ.QRTZ_SIMPLE_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);


-- ICOAP_TJ.QRTZ_SIMPROP_TRIGGERS definition

-- Drop table

-- DROP TABLE ICOAP_TJ.QRTZ_SIMPROP_TRIGGERS;

CREATE TABLE ICOAP_TJ.QRTZ_SIMPROP_TRIGGERS (
                                                SCHED_NAME NVARCHAR(480) NOT NULL,
                                                TRIGGER_NAME NVARCHAR(800) NOT NULL,
                                                TRIGGER_GROUP NVARCHAR(800) NOT NULL,
                                                STR_PROP_1 NVARCHAR(2048),
                                                STR_PROP_2 NVARCHAR(2048),
                                                STR_PROP_3 NVARCHAR(2048),
                                                INT_PROP_1 NUMBER(11,0),
                                                INT_PROP_2 NUMBER(11,0),
                                                LONG_PROP_1 NUMBER(20,0),
                                                LONG_PROP_2 NUMBER(20,0),
                                                DEC_PROP_1 NUMBER,
                                                DEC_PROP_2 NUMBER,
                                                BOOL_PROP_1 NVARCHAR(4),
                                                BOOL_PROP_2 NVARCHAR(4),
                                                CONSTRAINT SYS_C008042 PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
                                                CONSTRAINT QRTZ_SIMPROP_TRIGGERS_IBFK_1 FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) REFERENCES ICOAP_TJ.QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE UNIQUE INDEX INDEX33555688 ON ICOAP_TJ.QRTZ_SIMPROP_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX INDEX33555689 ON ICOAP_TJ.QRTZ_SIMPROP_TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);