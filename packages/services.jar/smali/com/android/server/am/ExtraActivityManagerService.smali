.class public Lcom/android/server/am/ExtraActivityManagerService;
.super Ljava/lang/Object;
.source "ExtraActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/am/ExtraActivityManagerService$CompatibleMessage;
    }
.end annotation


# static fields
.field static final DRM_BROADCAST:I = 0x2

.field private static final INCOMPATIBLE_ACTIVITIES:[Ljava/lang/String;

.field private static final INCOMPATIBLE_PACKAGES:[Ljava/lang/String;

.field static final RELEASE_TIME:Ljava/lang/String; = "release_time"

.field static final SHOW_INCOMPATIBLE_ERROR:I = 0x1

.field static final SYSTEM_PROPERTIES_PERSIT_RELEASED:Ljava/lang/String; = "persist.sys.released"

.field private static TAG:Ljava/lang/String;

.field private static mSplashScreenServiceDelegate:Lcom/miui/server/SplashScreenServiceDelegate;

.field private static mSystemReady:Z

.field static final sHandler:Landroid/os/Handler;

.field static sHasMetReleaseTime:Z

.field private static sIsScreenPaperModeEnabled:Z

.field private static final sIsScreenPaperModeSupported:Z

.field private static sMainStack:Ljava/lang/reflect/Field;

.field static final sMonitorPrivacyPackage:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sPaperModePkg:Ljava/lang/String;

.field private static sPkg2PaperMode:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field static sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sScheduleDestroyActivities:Ljava/lang/reflect/Method;

.field private static sScheduleDestroyAllActivities:Ljava/lang/reflect/Method;

.field private static sScreenPaperMode:I

.field private static sShowToastPkgSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 63
    const-class v1, Lcom/android/server/am/ExtraActivityManagerService;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->TAG:Ljava/lang/String;

    .line 73
    :try_start_0
    const-class v1, Lcom/android/server/am/ActivityManagerService;

    const-string v2, "mStackSupervisor"

    invoke-static {v1, v2}, Lcom/miui/whetstone/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sMainStack:Ljava/lang/reflect/Field;

    .line 74
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sMainStack:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_0

    .line 75
    const-class v1, Lcom/android/server/am/ActivityManagerService;

    const-string v2, "scheduleDestroyAllActivities"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Lcom/android/server/am/ProcessRecord;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lcom/miui/whetstone/ReflectionUtils;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sScheduleDestroyAllActivities:Ljava/lang/reflect/Method;

    .line 77
    const/4 v1, 0x0

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sScheduleDestroyActivities:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    .local v0, "e":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sShowToastPkgSet:Ljava/util/HashSet;

    .line 189
    invoke-static {}, Landroid/provider/MiuiSettings$System;->isScreenPaperModeSupported()Z

    move-result v1

    sput-boolean v1, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeSupported:Z

    .line 383
    new-instance v1, Lcom/android/server/am/ExtraActivityManagerService$6;

    invoke-direct {v1}, Lcom/android/server/am/ExtraActivityManagerService$6;-><init>()V

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sHandler:Landroid/os/Handler;

    .line 411
    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.tencent.mobileqq.activity.QQLSActivity"

    aput-object v2, v1, v6

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->INCOMPATIBLE_ACTIVITIES:[Ljava/lang/String;

    .line 415
    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "com.tencent.mobileqq"

    aput-object v2, v1, v6

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->INCOMPATIBLE_PACKAGES:[Ljava/lang/String;

    .line 476
    sput-boolean v6, Lcom/android/server/am/ExtraActivityManagerService;->sHasMetReleaseTime:Z

    .line 479
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    .line 480
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.antutu.ABenchMark"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 481
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.antutu.ABenchMark5"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 482
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.antutu.benchmark.bench64"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 483
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.antutu.videobench"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 484
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.antutu.ABenchMark.GL2"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 485
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.antutu.tester"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 486
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.music.videogame"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 487
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.ludashi.benchmark"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 488
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.ludashi.benchmarkhd"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 489
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.qihoo360.ludashi.cooling"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 490
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "cn.opda.android.activity"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 491
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.shouji.cesupaofen"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 492
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.colola.mobiletest"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 493
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "ws.j7uxli.a6urcd"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 494
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.gamebench.metricscollector"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 495
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.huahua.test"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 496
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.futuremark.dmandroid.application"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 497
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.eembc.coremark\u200b"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 498
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.rightware.BasemarkOSII"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 499
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.glbenchmark.glbenchmark27"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 500
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.greenecomputing.linpack"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 501
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "eu.chainfire.cfbench"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 502
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.primatelabs.geekbench"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 503
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.primatelabs.geekbench3"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 504
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.quicinc.vellamo"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 505
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.aurorasoftworks.quadrant.ui.advanced"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 506
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.aurorasoftworks.quadrant.ui.standard"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 507
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "eu.chainfire.perfmon"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 508
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.evozi.deviceid"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 509
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.finalwire.aida64"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 510
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "com.cpuid.cpu_z"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 511
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    const-string v2, "rs.in.luka.android.pi"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 513
    const-string v1, "persist.sys.released"

    invoke-static {v1, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/android/server/am/ExtraActivityManagerService;->sHasMetReleaseTime:Z

    .line 631
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sMonitorPrivacyPackage:Ljava/util/HashSet;

    .line 633
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sMonitorPrivacyPackage:Ljava/util/HashSet;

    const-string v2, "com.miui.backup"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 634
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sMonitorPrivacyPackage:Ljava/util/HashSet;

    const-string v2, "com.miui.notes"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 635
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sMonitorPrivacyPackage:Ljava/util/HashSet;

    const-string v2, "com.android.mms"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 636
    return-void

    .line 79
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 82
    .restart local v0    # "e":Ljava/lang/Throwable;
    :try_start_1
    const-class v1, Lcom/android/server/am/ActivityManagerService;

    const-string v2, "mMainStack"

    invoke-static {v1, v2}, Lcom/miui/whetstone/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sMainStack:Ljava/lang/reflect/Field;

    .line 83
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sMainStack:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_0

    .line 84
    const-class v1, Lcom/android/server/am/ActivityManagerService;

    const-string v2, "scheduleDestroyActivities"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Lcom/android/server/am/ProcessRecord;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lcom/miui/whetstone/ReflectionUtils;->findMethodBestMatch(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sScheduleDestroyActivities:Ljava/lang/reflect/Method;

    .line 86
    const/4 v1, 0x0

    sput-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sScheduleDestroyAllActivities:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 88
    :catch_1
    move-exception v1

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 400
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 61
    sget-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeEnabled:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 61
    sput-boolean p0, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeEnabled:Z

    return p0
.end method

.method static synthetic access$100()I
    .locals 1

    .prologue
    .line 61
    sget v0, Lcom/android/server/am/ExtraActivityManagerService;->sScreenPaperMode:I

    return v0
.end method

.method static synthetic access$102(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 61
    sput p0, Lcom/android/server/am/ExtraActivityManagerService;->sScreenPaperMode:I

    return p0
.end method

.method static synthetic access$202(Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 0
    .param p0, "x0"    # Ljava/util/HashMap;

    .prologue
    .line 61
    sput-object p0, Lcom/android/server/am/ExtraActivityManagerService;->sPkg2PaperMode:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$300()Z
    .locals 1

    .prologue
    .line 61
    sget-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeSupported:Z

    return v0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->sPaperModePkg:Ljava/lang/String;

    return-object v0
.end method

.method static activityIdle(Landroid/content/pm/ActivityInfo;)V
    .locals 2
    .param p0, "aInfo"    # Landroid/content/pm/ActivityInfo;

    .prologue
    .line 691
    sget-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->mSystemReady:Z

    if-nez v0, :cond_1

    .line 692
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->TAG:Ljava/lang/String;

    const-string v1, "System was not ready,activityIdle failed."

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 702
    :cond_0
    :goto_0
    return-void

    .line 695
    :cond_1
    if-nez p0, :cond_2

    .line 696
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->TAG:Ljava/lang/String;

    const-string v1, "aInfo is null!"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 699
    :cond_2
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->mSplashScreenServiceDelegate:Lcom/miui/server/SplashScreenServiceDelegate;

    if-eqz v0, :cond_0

    .line 700
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->mSplashScreenServiceDelegate:Lcom/miui/server/SplashScreenServiceDelegate;

    invoke-virtual {v0, p0}, Lcom/miui/server/SplashScreenServiceDelegate;->activityIdle(Landroid/content/pm/ActivityInfo;)V

    goto :goto_0
.end method

.method public static adjustMediaButtonReceivers(Landroid/content/Context;Ljava/util/List;Ljava/util/List;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List",
            "<",
            "Landroid/app/ActivityManager$RunningAppProcessInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "receivers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .local p2, "procs":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x1

    if-gt v7, v8, :cond_1

    .line 134
    :cond_0
    return-void

    .line 116
    :cond_1
    invoke-static {p0}, Landroid/app/ExtraActivityManager;->getPackageNameListForRecentTasks(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    .line 118
    .local v4, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v4, :cond_0

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 122
    const/4 v0, 0x0

    .line 123
    .local v0, "headIdx":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    .line 124
    .local v6, "receiverSize":I
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 125
    .local v3, "name":Ljava/lang/String;
    move v1, v0

    .local v1, "i":I
    :goto_0
    if-ge v1, v6, :cond_2

    .line 126
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 127
    .local v5, "r":Ljava/lang/Object;
    invoke-static {v5}, Lcom/android/server/am/ExtraActivityManagerService;->getPackageNameForReceiver(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 128
    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 129
    invoke-interface {p1, v0, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 130
    add-int/lit8 v0, v0, 0x1

    .line 125
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static adjustMediaButtonReceivers(Landroid/content/Context;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p3, "action"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List",
            "<",
            "Landroid/app/ActivityManager$RunningAppProcessInfo;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 96
    .local p1, "receivers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .local p2, "procs":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    const-string v0, "android.intent.action.MEDIA_BUTTON"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    invoke-static {p0, p1, p2}, Lcom/android/server/am/ExtraActivityManagerService;->adjustMediaButtonReceivers(Landroid/content/Context;Ljava/util/List;Ljava/util/List;)V

    .line 99
    :cond_0
    return-void
.end method

.method static checkAccessControl(Landroid/content/Context;Landroid/content/pm/ActivityInfo;Landroid/content/Intent;)Landroid/content/Intent;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "aInfo"    # Landroid/content/pm/ActivityInfo;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 155
    if-eqz p0, :cond_0

    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 156
    .local v0, "isFromActivity":Z
    :goto_0
    const/4 v1, -0x1

    invoke-static {p0, p1, p2, v0, v1}, Lcom/android/server/am/ExtraActivityManagerService;->checkAccessControl(Landroid/content/Context;Landroid/content/pm/ActivityInfo;Landroid/content/Intent;ZI)Landroid/content/Intent;

    move-result-object v1

    return-object v1

    .line 155
    .end local v0    # "isFromActivity":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static checkAccessControl(Landroid/content/Context;Landroid/content/pm/ActivityInfo;Landroid/content/Intent;ZI)Landroid/content/Intent;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "aInfo"    # Landroid/content/pm/ActivityInfo;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "fromActivity"    # Z
    .param p4, "requestCode"    # I

    .prologue
    .line 163
    if-eqz p1, :cond_0

    .line 164
    const-string v1, "security"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/security/SecurityManager;

    .line 165
    .local v0, "securityManager":Lmiui/security/SecurityManager;
    iget-object v2, p1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object v1, p0

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lmiui/security/SecurityManager;->getCheckIntent(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;ZI)Landroid/content/Intent;

    move-result-object v6

    .line 167
    .local v6, "checkIntent":Landroid/content/Intent;
    if-eqz v6, :cond_0

    .line 168
    move-object p2, v6

    .line 171
    .end local v0    # "securityManager":Lmiui/security/SecurityManager;
    .end local v6    # "checkIntent":Landroid/content/Intent;
    :cond_0
    return-object p2
.end method

.method public static checkRunningCompatibility(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;IZ)Z
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "service"    # Landroid/content/Intent;
    .param p2, "resolvedType"    # Ljava/lang/String;
    .param p3, "userId"    # I
    .param p4, "systemReady"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 420
    if-nez p4, :cond_0

    .line 431
    :goto_0
    return v2

    .line 424
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v4

    const/16 v5, 0x400

    invoke-interface {v4, p1, p2, v5, p3}, Landroid/content/pm/IPackageManager;->resolveService(Landroid/content/Intent;Ljava/lang/String;II)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 426
    .local v0, "rInfo":Landroid/content/pm/ResolveInfo;
    if-eqz v0, :cond_2

    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 427
    .local v1, "sInfo":Landroid/content/pm/ServiceInfo;
    :goto_1
    if-eqz v1, :cond_1

    iget-object v3, v1, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    :cond_1
    invoke-static {p0, v3, p4}, Lcom/android/server/am/ExtraActivityManagerService;->checkRunningCompatibility(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Z)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    goto :goto_0

    .end local v1    # "sInfo":Landroid/content/pm/ServiceInfo;
    :cond_2
    move-object v1, v3

    .line 426
    goto :goto_1

    .line 428
    .end local v0    # "rInfo":Landroid/content/pm/ResolveInfo;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static checkRunningCompatibility(Landroid/content/Context;Landroid/content/pm/ActivityInfo;Z)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "info"    # Landroid/content/pm/ActivityInfo;
    .param p2, "systemReady"    # Z

    .prologue
    .line 435
    if-nez p1, :cond_0

    const/4 v1, 0x1

    .line 439
    :goto_0
    return v1

    .line 436
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->INCOMPATIBLE_ACTIVITIES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 437
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->INCOMPATIBLE_ACTIVITIES:[Ljava/lang/String;

    aget-object v1, v1, v0

    iget-object v2, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->INCOMPATIBLE_PACKAGES:[Ljava/lang/String;

    aget-object v1, v1, v0

    iget-object v2, p1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 436
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 439
    :cond_2
    iget-object v1, p1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-static {p0, v1, p2}, Lcom/android/server/am/ExtraActivityManagerService;->checkRunningCompatibility(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Z)Z

    move-result v1

    goto :goto_0
.end method

.method public static checkRunningCompatibility(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Z)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "info"    # Landroid/content/pm/ApplicationInfo;
    .param p2, "systemReady"    # Z

    .prologue
    const/4 v0, 0x1

    .line 443
    if-nez p2, :cond_1

    .line 445
    :cond_0
    :goto_0
    return v0

    .line 444
    :cond_1
    if-eqz p1, :cond_0

    iget v1, p1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    .line 445
    iget-object v0, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/android/server/am/ExtraActivityManagerService;->checkRunningCompatibility(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method private static checkRunningCompatibility(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pkgName"    # Ljava/lang/String;

    .prologue
    .line 449
    invoke-static {p1}, Lcom/android/server/am/ExtraActivityManagerService;->shouldRestrictPkgBeforeRelease(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 450
    const/4 v0, 0x0

    .line 470
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static destroyActivity(Landroid/content/pm/ActivityInfo;)V
    .locals 2
    .param p0, "aInfo"    # Landroid/content/pm/ActivityInfo;

    .prologue
    .line 721
    sget-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->mSystemReady:Z

    if-nez v0, :cond_1

    .line 722
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->TAG:Ljava/lang/String;

    const-string v1, "System was not ready,destroyActivity failed."

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 732
    :cond_0
    :goto_0
    return-void

    .line 725
    :cond_1
    if-nez p0, :cond_2

    .line 726
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->TAG:Ljava/lang/String;

    const-string v1, "aInfo is null!"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 729
    :cond_2
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->mSplashScreenServiceDelegate:Lcom/miui/server/SplashScreenServiceDelegate;

    if-eqz v0, :cond_0

    .line 730
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->mSplashScreenServiceDelegate:Lcom/miui/server/SplashScreenServiceDelegate;

    invoke-virtual {v0, p0}, Lcom/miui/server/SplashScreenServiceDelegate;->destroyActivity(Landroid/content/pm/ActivityInfo;)V

    goto :goto_0
.end method

.method public static finishActivity(Lcom/android/server/am/ActivityManagerService;Landroid/os/IBinder;ILandroid/content/Intent;)Landroid/os/IBinder;
    .locals 5
    .param p0, "service"    # Lcom/android/server/am/ActivityManagerService;
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "resultCode"    # I
    .param p3, "resultData"    # Landroid/content/Intent;

    .prologue
    .line 137
    if-nez p1, :cond_1

    .line 138
    monitor-enter p0

    .line 139
    :try_start_0
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    const-string v4, "security"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/security/SecurityManager;

    .line 140
    .local v0, "securityManager":Lmiui/security/SecurityManager;
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/IActivityStackSupervisor;

    invoke-virtual {v3}, Lcom/android/server/am/IActivityStackSupervisor;->topRunningActivityLocked()Lcom/android/server/am/ActivityRecord;

    move-result-object v2

    .line 141
    .local v2, "top":Lcom/android/server/am/ActivityRecord;
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/android/server/am/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, v2, Lcom/android/server/am/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lmiui/security/SecurityManager;->getApplicationAccessControlEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, v2, Lcom/android/server/am/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lmiui/security/SecurityManager;->checkAccessControlPass(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 144
    iget-object p1, v2, Lcom/android/server/am/ActivityRecord;->appToken:Landroid/view/IApplicationToken$Stub;

    monitor-exit p0

    move-object v1, p1

    .line 148
    .end local v0    # "securityManager":Lmiui/security/SecurityManager;
    .end local v2    # "top":Lcom/android/server/am/ActivityRecord;
    .end local p1    # "token":Landroid/os/IBinder;
    .local v1, "token":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 146
    .end local v1    # "token":Ljava/lang/Object;
    .restart local v0    # "securityManager":Lmiui/security/SecurityManager;
    .restart local v2    # "top":Lcom/android/server/am/ActivityRecord;
    .restart local p1    # "token":Landroid/os/IBinder;
    :cond_0
    monitor-exit p0

    .end local v0    # "securityManager":Lmiui/security/SecurityManager;
    .end local v2    # "top":Lcom/android/server/am/ActivityRecord;
    :cond_1
    move-object v1, p1

    .line 148
    .restart local v1    # "token":Ljava/lang/Object;
    goto :goto_0

    .line 146
    .end local v1    # "token":Ljava/lang/Object;
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public static finishBooting(Lcom/android/server/am/ActivityManagerService;)V
    .locals 1
    .param p0, "service"    # Lcom/android/server/am/ActivityManagerService;

    .prologue
    .line 368
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/server/am/ExtraActivityManagerService;->scheduleDrmBroadcast(Landroid/content/Context;)V

    .line 369
    invoke-static {p0}, Lcom/android/server/am/ExtraActivityManagerService;->monitorPrivacyModeChange(Lcom/android/server/am/ActivityManagerService;)V

    .line 370
    invoke-static {p0}, Lcom/android/server/am/ExtraActivityManagerService;->initScreenPaperMode(Lcom/android/server/am/ActivityManagerService;)V

    .line 371
    invoke-static {}, Lmiui/hareware/display/DisplayFeatureManager;->getInstance()Lmiui/hareware/display/DisplayFeatureManager;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/hareware/display/DisplayFeatureManager;->initScreenOptimize()V

    .line 372
    return-void
.end method

.method public static getCurAdjByPid(I)I
    .locals 4
    .param p0, "pid"    # I

    .prologue
    .line 555
    sget-object v0, Lcom/android/server/am/ActivityManagerService;->mSelf:Lcom/android/server/am/ActivityManagerService;

    .line 556
    .local v0, "amService":Lcom/android/server/am/ActivityManagerService;
    iget-object v3, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    monitor-enter v3

    .line 557
    :try_start_0
    iget-object v2, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    invoke-virtual {v2, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/ProcessRecord;

    .line 558
    .local v1, "processRecord":Lcom/android/server/am/ProcessRecord;
    if-eqz v1, :cond_0

    .line 559
    iget v2, v1, Lcom/android/server/am/ProcessRecord;->curAdj:I

    monitor-exit v3

    .line 562
    :goto_0
    return v2

    .line 561
    :cond_0
    monitor-exit v3

    .line 562
    const v2, 0x7fffffff

    goto :goto_0

    .line 561
    .end local v1    # "processRecord":Lcom/android/server/am/ProcessRecord;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static getPackageNameByPid(I)Ljava/lang/String;
    .locals 4
    .param p0, "pid"    # I

    .prologue
    .line 544
    sget-object v0, Lcom/android/server/am/ActivityManagerService;->mSelf:Lcom/android/server/am/ActivityManagerService;

    .line 545
    .local v0, "amService":Lcom/android/server/am/ActivityManagerService;
    iget-object v3, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    monitor-enter v3

    .line 546
    :try_start_0
    iget-object v2, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    invoke-virtual {v2, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/ProcessRecord;

    .line 547
    .local v1, "processRecord":Lcom/android/server/am/ProcessRecord;
    if-eqz v1, :cond_0

    .line 548
    iget-object v2, v1, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    monitor-exit v3

    .line 551
    :goto_0
    return-object v2

    .line 550
    :cond_0
    monitor-exit v3

    .line 551
    const/4 v2, 0x0

    goto :goto_0

    .line 550
    .end local v1    # "processRecord":Lcom/android/server/am/ProcessRecord;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private static getPackageNameForReceiver(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3
    .param p0, "receiver"    # Ljava/lang/Object;

    .prologue
    .line 348
    const/4 v0, 0x0

    .line 349
    .local v0, "pkgName":Ljava/lang/String;
    instance-of v2, p0, Lcom/android/server/am/BroadcastFilter;

    if-eqz v2, :cond_1

    .line 350
    check-cast p0, Lcom/android/server/am/BroadcastFilter;

    .end local p0    # "receiver":Ljava/lang/Object;
    iget-object v0, p0, Lcom/android/server/am/BroadcastFilter;->packageName:Ljava/lang/String;

    .line 358
    :cond_0
    :goto_0
    return-object v0

    .line 351
    .restart local p0    # "receiver":Ljava/lang/Object;
    :cond_1
    instance-of v2, p0, Landroid/content/pm/ResolveInfo;

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 352
    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 353
    .local v1, "rinfo":Landroid/content/pm/ResolveInfo;
    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v2, :cond_0

    .line 354
    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    goto :goto_0
.end method

.method public static getProcStateByPid(I)I
    .locals 4
    .param p0, "pid"    # I

    .prologue
    .line 566
    sget-object v0, Lcom/android/server/am/ActivityManagerService;->mSelf:Lcom/android/server/am/ActivityManagerService;

    .line 567
    .local v0, "amService":Lcom/android/server/am/ActivityManagerService;
    iget-object v3, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    monitor-enter v3

    .line 568
    :try_start_0
    iget-object v2, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    invoke-virtual {v2, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/ProcessRecord;

    .line 569
    .local v1, "processRecord":Lcom/android/server/am/ProcessRecord;
    if-eqz v1, :cond_0

    .line 570
    iget v2, v1, Lcom/android/server/am/ProcessRecord;->curProcState:I

    monitor-exit v3

    .line 573
    :goto_0
    return v2

    .line 572
    :cond_0
    monitor-exit v3

    .line 573
    const/4 v2, -0x1

    goto :goto_0

    .line 572
    .end local v1    # "processRecord":Lcom/android/server/am/ProcessRecord;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static handleExtraConfigurationChangesForSystem(ILandroid/content/res/Configuration;)V
    .locals 1
    .param p0, "changes"    # I
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 620
    invoke-static {}, Landroid/content/res/MiuiResources;->isPreloadedCacheEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 621
    invoke-static {}, Lcom/android/server/AssetAtlasService;->disable()V

    .line 623
    :cond_0
    invoke-static {p0, p1}, Landroid/app/MiuiThemeHelper;->handleExtraConfigurationChangesForSystem(ILandroid/content/res/Configuration;)V

    .line 624
    return-void
.end method

.method public static hasForegroundActivities(I)Z
    .locals 4
    .param p0, "pid"    # I

    .prologue
    .line 577
    sget-object v0, Lcom/android/server/am/ActivityManagerService;->mSelf:Lcom/android/server/am/ActivityManagerService;

    .line 578
    .local v0, "amService":Lcom/android/server/am/ActivityManagerService;
    iget-object v3, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    monitor-enter v3

    .line 579
    :try_start_0
    iget-object v2, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    invoke-virtual {v2, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/ProcessRecord;

    .line 580
    .local v1, "processRecord":Lcom/android/server/am/ProcessRecord;
    if-eqz v1, :cond_0

    .line 581
    iget-boolean v2, v1, Lcom/android/server/am/ProcessRecord;->foregroundActivities:Z

    monitor-exit v3

    .line 584
    :goto_0
    return v2

    .line 583
    :cond_0
    monitor-exit v3

    .line 584
    const/4 v2, 0x0

    goto :goto_0

    .line 583
    .end local v1    # "processRecord":Lcom/android/server/am/ProcessRecord;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static init()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 362
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "sdcard"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/16 v1, 0x1ff

    invoke-static {v0, v1, v3, v3}, Lmiui/os/FileUtils;->mkdirs(Ljava/io/File;III)Z

    .line 363
    invoke-static {}, Lmiui/content/res/IconCustomizer;->checkModIconsTimestamp()V

    .line 364
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->mSystemReady:Z

    .line 365
    return-void
.end method

.method private static initScreenPaperMode(Lcom/android/server/am/ActivityManagerService;)V
    .locals 10
    .param p0, "service"    # Lcom/android/server/am/ActivityManagerService;

    .prologue
    const/4 v6, 0x1

    const/4 v9, 0x0

    .line 191
    sget-boolean v5, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeSupported:Z

    if-nez v5, :cond_0

    .line 261
    :goto_0
    return-void

    .line 195
    :cond_0
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    .line 196
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService;->mHandler:Landroid/os/Handler;

    .line 199
    .local v1, "handler":Landroid/os/Handler;
    new-instance v2, Lcom/android/server/am/ExtraActivityManagerService$1;

    invoke-direct {v2, v1, p0, v0}, Lcom/android/server/am/ExtraActivityManagerService$1;-><init>(Landroid/os/Handler;Lcom/android/server/am/ActivityManagerService;Landroid/content/Context;)V

    .line 211
    .local v2, "paperModeEnabledObserver":Landroid/database/ContentObserver;
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v7, "screen_paper_mode_enabled"

    invoke-static {v7}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v5, v7, v9, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 215
    invoke-virtual {v2, v9}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 218
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v7, "screen_paper_mode"

    invoke-static {v5, v7}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1

    .line 220
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "screen_paper_mode"

    sget-boolean v5, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeEnabled:Z

    if-eqz v5, :cond_2

    const/4 v5, 0x2

    :goto_1
    invoke-static {v7, v8, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 227
    :cond_1
    new-instance v4, Lcom/android/server/am/ExtraActivityManagerService$2;

    invoke-direct {v4, v1, p0, v0}, Lcom/android/server/am/ExtraActivityManagerService$2;-><init>(Landroid/os/Handler;Lcom/android/server/am/ActivityManagerService;Landroid/content/Context;)V

    .line 240
    .local v4, "paperModeObserver":Landroid/database/ContentObserver;
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v7, "screen_paper_mode"

    invoke-static {v7}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v5, v7, v9, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 244
    invoke-virtual {v4, v6}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 247
    new-instance v3, Lcom/android/server/am/ExtraActivityManagerService$3;

    invoke-direct {v3, v1, p0, v0}, Lcom/android/server/am/ExtraActivityManagerService$3;-><init>(Landroid/os/Handler;Lcom/android/server/am/ActivityManagerService;Landroid/content/Context;)V

    .line 255
    .local v3, "paperModeListObserver":Landroid/database/ContentObserver;
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "screen_paper_mode_white_list"

    invoke-static {v6}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6, v9, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 259
    invoke-virtual {v3, v9}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 260
    invoke-static {v0}, Lcom/android/server/am/ExtraActivityManagerService;->registerScreenStatusChangeReceiver(Landroid/content/Context;)V

    goto :goto_0

    .end local v3    # "paperModeListObserver":Landroid/database/ContentObserver;
    .end local v4    # "paperModeObserver":Landroid/database/ContentObserver;
    :cond_2
    move v5, v6

    .line 220
    goto :goto_1
.end method

.method static monitorPrivacyModeChange(Lcom/android/server/am/ActivityManagerService;)V
    .locals 3
    .param p0, "service"    # Lcom/android/server/am/ActivityManagerService;

    .prologue
    .line 638
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 639
    .local v0, "privacyModeFilter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.PRIVACY_MODE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 640
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/android/server/am/ExtraActivityManagerService$7;

    invoke-direct {v2, p0}, Lcom/android/server/am/ExtraActivityManagerService$7;-><init>(Lcom/android/server/am/ActivityManagerService;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 666
    return-void
.end method

.method static onSystemReady(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 669
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->mSystemReady:Z

    .line 670
    new-instance v0, Lcom/miui/server/SplashScreenServiceDelegate;

    invoke-direct {v0, p0}, Lcom/miui/server/SplashScreenServiceDelegate;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/android/server/am/ExtraActivityManagerService;->mSplashScreenServiceDelegate:Lcom/miui/server/SplashScreenServiceDelegate;

    .line 671
    return-void
.end method

.method private static registerScreenStatusChangeReceiver(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 322
    new-instance v1, Lcom/android/server/am/ExtraActivityManagerService$5;

    invoke-direct {v1}, Lcom/android/server/am/ExtraActivityManagerService$5;-><init>()V

    .line 341
    .local v1, "screenStatusChangeReceiver":Landroid/content/BroadcastReceiver;
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 342
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 343
    const-string v2, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 344
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 345
    return-void
.end method

.method static requestSplashScreen(Landroid/content/Intent;Landroid/content/pm/ActivityInfo;)Landroid/content/Intent;
    .locals 2
    .param p0, "intent"    # Landroid/content/Intent;
    .param p1, "aInfo"    # Landroid/content/pm/ActivityInfo;

    .prologue
    .line 674
    sget-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->mSystemReady:Z

    if-nez v0, :cond_0

    .line 675
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->TAG:Ljava/lang/String;

    const-string v1, "System was not ready,request splash failed."

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    .end local p0    # "intent":Landroid/content/Intent;
    :goto_0
    return-object p0

    .line 678
    .restart local p0    # "intent":Landroid/content/Intent;
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 679
    :cond_1
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->TAG:Ljava/lang/String;

    const-string v1, "Intent or aInfo is null!"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 682
    :cond_2
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->mSplashScreenServiceDelegate:Lcom/miui/server/SplashScreenServiceDelegate;

    if-eqz v0, :cond_3

    .line 683
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->mSplashScreenServiceDelegate:Lcom/miui/server/SplashScreenServiceDelegate;

    invoke-virtual {v0, p0, p1}, Lcom/miui/server/SplashScreenServiceDelegate;->requestSplashScreen(Landroid/content/Intent;Landroid/content/pm/ActivityInfo;)Landroid/content/Intent;

    move-result-object p0

    goto :goto_0

    .line 685
    :cond_3
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->TAG:Ljava/lang/String;

    const-string v1, "mSplashScreenServiceDelegate is null!"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static resolveCheckIntent(Landroid/content/pm/ActivityInfo;Landroid/content/Intent;Lcom/android/server/am/ActivityStackSupervisor;Ljava/lang/String;Landroid/os/ParcelFileDescriptor;I)Landroid/content/pm/ActivityInfo;
    .locals 7
    .param p0, "aInfo"    # Landroid/content/pm/ActivityInfo;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "stack"    # Lcom/android/server/am/ActivityStackSupervisor;
    .param p3, "profileFile"    # Ljava/lang/String;
    .param p4, "profileFd"    # Landroid/os/ParcelFileDescriptor;
    .param p5, "userId"    # I

    .prologue
    .line 177
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "android.app.action.CHECK_ACCESS_CONTROL"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p2

    move-object v1, p1

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/am/ActivityStackSupervisor;->resolveActivity(Landroid/content/Intent;Ljava/lang/String;ILjava/lang/String;Landroid/os/ParcelFileDescriptor;I)Landroid/content/pm/ActivityInfo;

    move-result-object p0

    .line 181
    :cond_0
    return-object p0
.end method

.method static resolveSplashIntent(Landroid/content/pm/ActivityInfo;Landroid/content/Intent;Lcom/android/server/am/ActivityStackSupervisor;Ljava/lang/String;Landroid/os/ParcelFileDescriptor;I)Landroid/content/pm/ActivityInfo;
    .locals 8
    .param p0, "aInfo"    # Landroid/content/pm/ActivityInfo;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "stack"    # Lcom/android/server/am/ActivityStackSupervisor;
    .param p3, "profileFile"    # Ljava/lang/String;
    .param p4, "profileFd"    # Landroid/os/ParcelFileDescriptor;
    .param p5, "userId"    # I

    .prologue
    .line 707
    if-eqz p1, :cond_0

    .line 708
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v7

    .line 709
    .local v7, "component":Landroid/content/ComponentName;
    if-eqz v7, :cond_0

    const-string v0, "com.miui.systemAdSolution"

    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "com.miui.systemAdSolution.splashscreen.SplashActivity"

    invoke-virtual {v7}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 714
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p2

    move-object v1, p1

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/am/ActivityStackSupervisor;->resolveActivity(Landroid/content/Intent;Ljava/lang/String;ILjava/lang/String;Landroid/os/ParcelFileDescriptor;I)Landroid/content/pm/ActivityInfo;

    move-result-object p0

    .line 717
    .end local v7    # "component":Landroid/content/ComponentName;
    :cond_0
    return-object p0
.end method

.method public static scheduleDestroyActivities(IZLjava/lang/String;)V
    .locals 9
    .param p0, "pid"    # I
    .param p1, "oomAdj"    # Z
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 602
    sget-object v0, Lcom/android/server/am/ActivityManagerService;->mSelf:Lcom/android/server/am/ActivityManagerService;

    .line 603
    .local v0, "amService":Lcom/android/server/am/ActivityManagerService;
    iget-object v4, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    monitor-enter v4

    .line 604
    :try_start_0
    iget-object v3, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    invoke-virtual {v3, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/am/ProcessRecord;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 606
    .local v2, "processRecord":Lcom/android/server/am/ProcessRecord;
    if-eqz v2, :cond_0

    .line 607
    :try_start_1
    sget-object v3, Lcom/android/server/am/ExtraActivityManagerService;->sScheduleDestroyAllActivities:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_1

    .line 608
    sget-object v3, Lcom/android/server/am/ExtraActivityManagerService;->sScheduleDestroyAllActivities:Ljava/lang/reflect/Method;

    sget-object v5, Lcom/android/server/am/ExtraActivityManagerService;->sMainStack:Ljava/lang/reflect/Field;

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    const/4 v7, 0x1

    aput-object p2, v6, v7

    invoke-virtual {v3, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 616
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 617
    return-void

    .line 609
    :cond_1
    :try_start_3
    sget-object v3, Lcom/android/server/am/ExtraActivityManagerService;->sScheduleDestroyActivities:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_0

    .line 610
    sget-object v3, Lcom/android/server/am/ExtraActivityManagerService;->sScheduleDestroyActivities:Ljava/lang/reflect/Method;

    sget-object v5, Lcom/android/server/am/ExtraActivityManagerService;->sMainStack:Ljava/lang/reflect/Field;

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    const/4 v7, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    aput-object p2, v6, v7

    invoke-virtual {v3, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 613
    :catch_0
    move-exception v1

    .line 614
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    .line 616
    .end local v1    # "e":Ljava/lang/Throwable;
    .end local v2    # "processRecord":Lcom/android/server/am/ProcessRecord;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v3
.end method

.method public static scheduleDrmBroadcast(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 375
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 376
    .local v0, "message":Landroid/os/Message;
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 377
    sget-object v1, Lcom/android/server/am/ExtraActivityManagerService;->sHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 378
    return-void
.end method

.method public static scheduleTrimMemory(II)V
    .locals 5
    .param p0, "pid"    # I
    .param p1, "level"    # I

    .prologue
    .line 588
    sget-object v0, Lcom/android/server/am/ActivityManagerService;->mSelf:Lcom/android/server/am/ActivityManagerService;

    .line 589
    .local v0, "amService":Lcom/android/server/am/ActivityManagerService;
    iget-object v4, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    monitor-enter v4

    .line 590
    :try_start_0
    iget-object v3, v0, Lcom/android/server/am/ActivityManagerService;->mPidsSelfLocked:Landroid/util/SparseArray;

    invoke-virtual {v3, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/am/ProcessRecord;

    .line 591
    .local v2, "processRecord":Lcom/android/server/am/ProcessRecord;
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/android/server/am/ProcessRecord;->thread:Landroid/app/IApplicationThread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    .line 593
    :try_start_1
    iget-object v3, v2, Lcom/android/server/am/ProcessRecord;->thread:Landroid/app/IApplicationThread;

    invoke-interface {v3, p1}, Landroid/app/IApplicationThread;->scheduleTrimMemory(I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 598
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v4

    .line 599
    return-void

    .line 594
    :catch_0
    move-exception v1

    .line 595
    .local v1, "e":Landroid/os/RemoteException;
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 598
    .end local v1    # "e":Landroid/os/RemoteException;
    .end local v2    # "processRecord":Lcom/android/server/am/ProcessRecord;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3
.end method

.method private static shouldRestrictPkgBeforeRelease(Ljava/lang/String;)Z
    .locals 8
    .param p0, "pkgName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 520
    sget-boolean v6, Lcom/android/server/am/ExtraActivityManagerService;->sHasMetReleaseTime:Z

    if-eqz v6, :cond_1

    .line 540
    :cond_0
    :goto_0
    return v4

    .line 524
    :cond_1
    const-wide/16 v2, 0x0

    .line 525
    .local v2, "time":J
    const-string v6, "release_time"

    invoke-static {v6}, Lmiui/util/FeatureParser;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 527
    .local v1, "releaseTime":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 532
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v6, v6, v2

    if-gez v6, :cond_2

    .line 533
    sget-object v6, Lcom/android/server/am/ExtraActivityManagerService;->sRestrictedAppListBeforeRelease:Ljava/util/ArrayList;

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move v4, v5

    .line 534
    goto :goto_0

    .line 528
    :catch_0
    move-exception v0

    .line 529
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 537
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    sput-boolean v5, Lcom/android/server/am/ExtraActivityManagerService;->sHasMetReleaseTime:Z

    .line 538
    const-string v5, "persist.sys.released"

    const-string v6, "true"

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static updateScreenPaperMode()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 264
    sget-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeSupported:Z

    if-nez v0, :cond_1

    .line 273
    :cond_0
    :goto_0
    return-void

    .line 268
    :cond_1
    sget v0, Lcom/android/server/am/ExtraActivityManagerService;->sScreenPaperMode:I

    if-ne v0, v2, :cond_2

    .line 269
    sget-boolean v0, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeEnabled:Z

    invoke-static {v0}, Landroid/provider/MiuiSettings$System;->setScreenPaperMode(Z)V

    goto :goto_0

    .line 270
    :cond_2
    sget v0, Lcom/android/server/am/ExtraActivityManagerService;->sScreenPaperMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 271
    sget-object v0, Lcom/android/server/am/ExtraActivityManagerService;->sPaperModePkg:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/android/server/am/ExtraActivityManagerService;->updateScreenPaperMode(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public static updateScreenPaperMode(Ljava/lang/String;)V
    .locals 1
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    .line 276
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/server/am/ExtraActivityManagerService;->updateScreenPaperMode(Ljava/lang/String;Z)V

    .line 277
    return-void
.end method

.method public static updateScreenPaperMode(Ljava/lang/String;Z)V
    .locals 5
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "forceUpdate"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 280
    sget-boolean v4, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeSupported:Z

    if-nez v4, :cond_1

    .line 319
    :cond_0
    :goto_0
    return-void

    .line 284
    :cond_1
    sput-object p0, Lcom/android/server/am/ExtraActivityManagerService;->sPaperModePkg:Ljava/lang/String;

    .line 286
    sget v4, Lcom/android/server/am/ExtraActivityManagerService;->sScreenPaperMode:I

    if-eq v4, v1, :cond_0

    .line 291
    if-eqz p1, :cond_2

    sget-boolean v4, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeEnabled:Z

    if-nez v4, :cond_2

    .line 292
    invoke-static {v3}, Landroid/provider/MiuiSettings$System;->setScreenPaperMode(Z)V

    goto :goto_0

    .line 296
    :cond_2
    sget-boolean v4, Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeEnabled:Z

    if-eqz v4, :cond_0

    sget-object v4, Lcom/android/server/am/ExtraActivityManagerService;->sPkg2PaperMode:Ljava/util/HashMap;

    if-eqz v4, :cond_0

    .line 300
    invoke-static {}, Landroid/provider/MiuiSettings$System;->isScreenPaperMode()Z

    move-result v2

    .line 301
    .local v2, "screenPaperMode":Z
    sget-object v4, Lcom/android/server/am/ExtraActivityManagerService;->sPkg2PaperMode:Ljava/util/HashMap;

    invoke-virtual {v4, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 302
    .local v0, "isScreenPaperModePkg":Ljava/lang/Boolean;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 304
    .local v1, "newScreenPaperMode":Z
    :goto_1
    if-eq v2, v1, :cond_0

    .line 305
    invoke-static {v1}, Landroid/provider/MiuiSettings$System;->setScreenPaperMode(Z)V

    .line 306
    if-eqz v1, :cond_0

    .line 307
    sget-object v3, Lcom/android/server/am/ExtraActivityManagerService;->sShowToastPkgSet:Ljava/util/HashSet;

    invoke-virtual {v3, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 308
    sget-object v3, Lcom/android/server/am/ExtraActivityManagerService;->sShowToastPkgSet:Ljava/util/HashSet;

    invoke-virtual {v3, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 309
    sget-object v3, Lcom/android/server/am/ActivityManagerService;->mSelf:Lcom/android/server/am/ActivityManagerService;

    iget-object v3, v3, Lcom/android/server/am/ActivityManagerService;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/android/server/am/ExtraActivityManagerService$4;

    invoke-direct {v4}, Lcom/android/server/am/ExtraActivityManagerService$4;-><init>()V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .end local v1    # "newScreenPaperMode":Z
    :cond_3
    move v1, v3

    .line 302
    goto :goto_1
.end method
