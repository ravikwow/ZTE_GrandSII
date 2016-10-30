.class public Lcom/miui/server/SecurityManagerService;
.super Lmiui/security/ISecurityManager$Stub;
.source "SecurityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/server/SecurityManagerService$PackageSetting;,
        Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;,
        Lcom/miui/server/SecurityManagerService$MyPackageMonitor;
    }
.end annotation


# static fields
.field private static final CLASS_NAME:Ljava/lang/String; = "classname"

.field private static final CLASS_NAMES:Ljava/lang/String; = "classnames"

.field private static final LEADCORE:Ljava/lang/String; = "leadcore"

.field private static final MSG_SHOW_DIALOG:I = 0x1

.field private static final MTK:Ljava/lang/String; = "mediatek"

.field private static final NAME:Ljava/lang/String; = "name"

.field static final TAG:Ljava/lang/String; = "SecurityManagerService"

.field private static final TIME:Ljava/lang/String; = "time"

.field private static final WAKEALARM_PATH_OF_LEADCORE:Ljava/lang/String; = "/sys/comip/rtc_alarm"

.field private static final WAKEALARM_PATH_OF_QCOM:Ljava/lang/String; = "/sys/class/rtc/rtc0/wakealarm"

.field private static final WRITE_BOOTTIME_DELAY:I = 0xbb8

.field private static final WRITE_BOOT_TIME:I = 0x3

.field private static final WRITE_SETTINGS:I = 0x1

.field private static final WRITE_SETTINGS_DELAY:I = 0xbb8

.field private static final WRITE_WAKE_UP_TIME:I = 0x2


# instance fields
.field private final mAccessControlPassPackages:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mAom:Landroid/app/AppOpsManager;

.field private mContext:Landroid/content/Context;

.field private mDialogFlag:Z

.field final mH:Landroid/os/Handler;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

.field private mPackages:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/miui/server/SecurityManagerService$PackageSetting;",
            ">;"
        }
    .end annotation
.end field

.field private mSecuritySmsHandler:Lcom/miui/server/SecuritySmsHandler;

.field private mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

.field private mSettingsFile:Lcom/android/internal/os/AtomicFile;

.field private mWakeTime:J

.field private mWakeUpFile:Lcom/android/internal/os/AtomicFile;

.field private mWakeUpTime:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 482
    const-string v0, "miui_security"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 483
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "onlyCore"    # Z

    .prologue
    const/4 v5, 0x0

    .line 202
    invoke-direct {p0}, Lmiui/security/ISecurityManager$Stub;-><init>()V

    .line 58
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    .line 79
    iput-boolean v5, p0, Lcom/miui/server/SecurityManagerService;->mDialogFlag:Z

    .line 83
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    .line 91
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/miui/server/SecurityManagerService;->mAccessControlPassPackages:Ljava/util/HashSet;

    .line 93
    new-instance v2, Lcom/miui/server/SecurityManagerService$1;

    invoke-direct {v2, p0}, Lcom/miui/server/SecurityManagerService$1;-><init>(Lcom/miui/server/SecurityManagerService;)V

    iput-object v2, p0, Lcom/miui/server/SecurityManagerService;->mH:Landroid/os/Handler;

    .line 203
    iput-object p1, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    .line 204
    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v2

    const-string v3, "system"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 205
    .local v1, "systemDir":Ljava/io/File;
    new-instance v2, Lcom/android/internal/os/AtomicFile;

    new-instance v3, Ljava/io/File;

    const-string v4, "miui-packages.xml"

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lcom/android/internal/os/AtomicFile;-><init>(Ljava/io/File;)V

    iput-object v2, p0, Lcom/miui/server/SecurityManagerService;->mSettingsFile:Lcom/android/internal/os/AtomicFile;

    .line 207
    new-instance v0, Landroid/os/HandlerThread;

    const-string v2, "SecurityWriteHandlerThread"

    invoke-direct {v0, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 208
    .local v0, "securityWriteHandlerThread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 209
    new-instance v2, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;-><init>(Lcom/miui/server/SecurityManagerService;Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/miui/server/SecurityManagerService;->mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    .line 210
    new-instance v2, Lcom/miui/server/SecurityManagerService$MyPackageMonitor;

    invoke-direct {v2, p0}, Lcom/miui/server/SecurityManagerService$MyPackageMonitor;-><init>(Lcom/miui/server/SecurityManagerService;)V

    iput-object v2, p0, Lcom/miui/server/SecurityManagerService;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    .line 211
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    iget-object v3, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/miui/server/SecurityManagerService;->mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    invoke-virtual {v4}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v5}, Lcom/android/internal/content/PackageMonitor;->register(Landroid/content/Context;Landroid/os/Looper;Z)V

    .line 212
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->readSettings()V

    .line 214
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->initForKK()V

    .line 216
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeTime:J

    .line 217
    new-instance v2, Lcom/android/internal/os/AtomicFile;

    new-instance v3, Ljava/io/File;

    const-string v4, "miui-wakeuptime.xml"

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lcom/android/internal/os/AtomicFile;-><init>(Ljava/io/File;)V

    iput-object v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpFile:Lcom/android/internal/os/AtomicFile;

    .line 218
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->readWakeUpTime()V

    .line 221
    invoke-direct {p0, p2}, Lcom/miui/server/SecurityManagerService;->checkSystemSelfProtection(Z)V

    .line 222
    return-void
.end method

.method static synthetic access$000(Lcom/miui/server/SecurityManagerService;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$102(Lcom/miui/server/SecurityManagerService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;
    .param p1, "x1"    # Z

    .prologue
    .line 51
    iput-boolean p1, p0, Lcom/miui/server/SecurityManagerService;->mDialogFlag:Z

    return p1
.end method

.method static synthetic access$200(Lcom/miui/server/SecurityManagerService;)Landroid/app/AppOpsManager;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mAom:Landroid/app/AppOpsManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/miui/server/SecurityManagerService;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/miui/server/SecurityManagerService;->removePackage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/server/SecurityManagerService;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$500(Lcom/miui/server/SecurityManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->writeSettings()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/server/SecurityManagerService;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$700(Lcom/miui/server/SecurityManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->writeWakeUpTime()V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/server/SecurityManagerService;)J
    .locals 2
    .param p0, "x0"    # Lcom/miui/server/SecurityManagerService;

    .prologue
    .line 51
    iget-wide v0, p0, Lcom/miui/server/SecurityManagerService;->mWakeTime:J

    return-wide v0
.end method

.method private checkPermission()V
    .locals 4

    .prologue
    .line 474
    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.CHANGE_COMPONENT_ENABLED_STATE"

    invoke-virtual {v1, v2}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    .line 476
    .local v0, "permission":I
    if-nez v0, :cond_0

    return-void

    .line 477
    :cond_0
    new-instance v1, Ljava/lang/SecurityException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Permission Denial: attempt to change application state from pid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", uid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private checkSystemSelfProtection(Z)V
    .locals 3
    .param p1, "onlyCore"    # Z

    .prologue
    .line 225
    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 226
    .local v0, "pm":Landroid/content/pm/PackageManager;
    sget-boolean v1, Lmiui/os/Build;->IS_TABLET:Z

    if-nez v1, :cond_2

    if-nez p1, :cond_2

    .line 228
    const-string v1, "android"

    const-string v2, "com.android.updater"

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->checkSignatures(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    .line 229
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "System error : cannot find system app : com.android.updater"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 233
    :cond_0
    const-string v1, "android"

    const-string v2, "com.miui.securitycenter"

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->checkSignatures(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1

    .line 234
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "System error : cannot find system app : com.miui.securitycenter"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 237
    :cond_1
    sget-boolean v1, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v1, :cond_2

    sget-boolean v1, Lmiui/os/Build;->IS_CM_CUSTOMIZATION:Z

    if-nez v1, :cond_2

    sget-boolean v1, Lmiui/os/Build;->IS_CM_CUSTOMIZATION_TEST:Z

    if-nez v1, :cond_2

    .line 240
    const-string v1, "android"

    const-string v2, "com.xiaomi.market"

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->checkSignatures(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2

    .line 241
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "System error : cannot find system app : com.xiaomi.market"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 245
    :cond_2
    return-void
.end method

.method private declared-synchronized getBootTimeFromMap(Ljava/lang/String;)J
    .locals 2
    .param p1, "componentName"    # Ljava/lang/String;

    .prologue
    .line 606
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getPackageSetting(Ljava/lang/String;)Lcom/miui/server/SecurityManagerService$PackageSetting;
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 374
    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/server/SecurityManagerService$PackageSetting;

    .line 375
    .local v0, "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    if-nez v0, :cond_0

    .line 376
    new-instance v0, Lcom/miui/server/SecurityManagerService$PackageSetting;

    .end local v0    # "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    invoke-direct {v0, p0, p1}, Lcom/miui/server/SecurityManagerService$PackageSetting;-><init>(Lcom/miui/server/SecurityManagerService;Ljava/lang/String;)V

    .line 377
    .restart local v0    # "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    :cond_0
    if-nez v0, :cond_1

    .line 380
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown package: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 382
    :cond_1
    return-object v0
.end method

.method private initForKK()V
    .locals 3

    .prologue
    .line 248
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 249
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    const-string v1, "appops"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    iput-object v0, p0, Lcom/miui/server/SecurityManagerService;->mAom:Landroid/app/AppOpsManager;

    .line 250
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "SecurityManagerService"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/server/SecurityManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 251
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 252
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/miui/server/SecurityManagerService;->mHandler:Landroid/os/Handler;

    .line 253
    new-instance v0, Lcom/miui/server/SecuritySmsHandler;

    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, v1, v2}, Lcom/miui/server/SecuritySmsHandler;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecuritySmsHandler:Lcom/miui/server/SecuritySmsHandler;

    .line 255
    :cond_0
    return-void
.end method

.method private isSystemApp(Ljava/lang/String;)Z
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 285
    :try_start_0
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 286
    .local v0, "info":Landroid/content/pm/ApplicationInfo;
    if-eqz v0, :cond_0

    iget v2, v0, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 289
    .end local v0    # "info":Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    return v1

    .line 287
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private minWakeUpTime(J)V
    .locals 8
    .param p1, "nowtime"    # J

    .prologue
    .line 505
    const-wide/16 v2, 0x0

    .line 506
    .local v2, "min":J
    iget-object v6, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 507
    .local v0, "componentName":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/miui/server/SecurityManagerService;->getBootTimeFromMap(Ljava/lang/String;)J

    move-result-wide v4

    .line 508
    .local v4, "tmp":J
    cmp-long v6, v4, p1

    if-lez v6, :cond_0

    cmp-long v6, v4, v2

    if-ltz v6, :cond_1

    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-nez v6, :cond_0

    .line 509
    :cond_1
    move-wide v2, v4

    goto :goto_0

    .line 512
    .end local v0    # "componentName":Ljava/lang/String;
    .end local v4    # "tmp":J
    :cond_2
    iput-wide v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeTime:J

    .line 513
    return-void
.end method

.method private native nativeKillPackageProcesses(ILjava/lang/String;)V
.end method

.method private declared-synchronized putBootTimeToMap(Ljava/lang/String;J)V
    .locals 2
    .param p1, "componentName"    # Ljava/lang/String;
    .param p2, "time"    # J

    .prologue
    .line 602
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 603
    monitor-exit p0

    return-void

    .line 602
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private readSettings()V
    .locals 4

    .prologue
    .line 391
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mSettingsFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v2}, Lcom/android/internal/os/AtomicFile;->getBaseFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 409
    :cond_0
    :goto_0
    return-void

    .line 395
    :cond_1
    const/4 v1, 0x0

    .line 397
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_0
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mSettingsFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v2}, Lcom/android/internal/os/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v1

    .line 398
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mSettingsFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v2}, Lcom/android/internal/os/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v2, v3}, Lcom/miui/server/SecurityManagerService;->readSettings(Ljava/io/FileInputStream;Ljava/util/HashMap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 402
    if-eqz v1, :cond_0

    .line 404
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 405
    :catch_0
    move-exception v2

    goto :goto_0

    .line 399
    :catch_1
    move-exception v0

    .line 400
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    const-string v2, "SecurityManagerService"

    const-string v3, "Error reading package settings"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 402
    if-eqz v1, :cond_0

    .line 404
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 402
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_2

    .line 404
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 402
    :cond_2
    :goto_1
    throw v2

    .line 405
    :catch_2
    move-exception v3

    goto :goto_1
.end method

.method private readSettings(Ljava/io/FileInputStream;Ljava/util/HashMap;)V
    .locals 9
    .param p1, "fis"    # Ljava/io/FileInputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/FileInputStream;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/miui/server/SecurityManagerService$PackageSetting;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p2, "packages":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/miui/server/SecurityManagerService$PackageSetting;>;"
    const/4 v8, 0x1

    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 412
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    .line 413
    .local v2, "parser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v2, p1, v6}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 415
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    .line 416
    .local v0, "eventType":I
    :goto_0
    if-eq v0, v7, :cond_0

    if-eq v0, v8, :cond_0

    .line 417
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    .line 420
    :cond_0
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 421
    .local v4, "tagName":Ljava/lang/String;
    const-string v5, "packages"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 422
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 424
    :cond_1
    if-ne v0, v7, :cond_2

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v5

    if-ne v5, v7, :cond_2

    .line 425
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 426
    const-string v5, "package"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 427
    const-string v5, "name"

    invoke-interface {v2, v6, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 428
    .local v1, "name":Ljava/lang/String;
    new-instance v3, Lcom/miui/server/SecurityManagerService$PackageSetting;

    invoke-direct {v3, p0, v1}, Lcom/miui/server/SecurityManagerService$PackageSetting;-><init>(Lcom/miui/server/SecurityManagerService;Ljava/lang/String;)V

    .line 429
    .local v3, "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    const-string v5, "accessControl"

    invoke-interface {v2, v6, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lcom/miui/server/SecurityManagerService$PackageSetting;->accessControl:Z

    .line 430
    const-string v5, "childrenControl"

    invoke-interface {v2, v6, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v3, Lcom/miui/server/SecurityManagerService$PackageSetting;->childrenControl:Z

    .line 431
    invoke-virtual {p2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    :cond_2
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 435
    if-ne v0, v8, :cond_1

    .line 437
    :cond_3
    return-void
.end method

.method private readWakeUpTime()V
    .locals 4

    .prologue
    .line 551
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 552
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v2}, Lcom/android/internal/os/AtomicFile;->getBaseFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 569
    :cond_0
    :goto_0
    return-void

    .line 555
    :cond_1
    const/4 v1, 0x0

    .line 557
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_0
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v2}, Lcom/android/internal/os/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v1

    .line 558
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v2}, Lcom/android/internal/os/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/miui/server/SecurityManagerService;->readWakeUpTime(Ljava/io/FileInputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 562
    if-eqz v1, :cond_0

    .line 564
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 565
    :catch_0
    move-exception v2

    goto :goto_0

    .line 559
    :catch_1
    move-exception v0

    .line 560
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v2}, Lcom/android/internal/os/AtomicFile;->getBaseFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 562
    if-eqz v1, :cond_0

    .line 564
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 562
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_2

    .line 564
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 562
    :cond_2
    :goto_1
    throw v2

    .line 565
    :catch_2
    move-exception v3

    goto :goto_1
.end method

.method private readWakeUpTime(Ljava/io/FileInputStream;)V
    .locals 11
    .param p1, "fis"    # Ljava/io/FileInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x2

    .line 572
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    .line 573
    .local v2, "parser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v2, p1, v9}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 575
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 576
    .local v1, "eventType":I
    :goto_0
    if-eq v1, v8, :cond_0

    if-eq v1, v10, :cond_0

    .line 577
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    goto :goto_0

    .line 579
    :cond_0
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 580
    .local v3, "tagName":Ljava/lang/String;
    const-string v6, "classnames"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 581
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 583
    :cond_1
    if-ne v1, v8, :cond_2

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v6

    if-ne v6, v8, :cond_2

    .line 584
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 585
    const-string v6, "classname"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 586
    const-string v6, "name"

    invoke-interface {v2, v9, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 587
    .local v0, "componentName":Ljava/lang/String;
    new-instance v6, Ljava/lang/Long;

    const-string v7, "time"

    invoke-interface {v2, v9, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 588
    .local v4, "time":J
    invoke-direct {p0, v0, v4, v5}, Lcom/miui/server/SecurityManagerService;->putBootTimeToMap(Ljava/lang/String;J)V

    .line 591
    .end local v0    # "componentName":Ljava/lang/String;
    .end local v4    # "time":J
    :cond_2
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 592
    if-ne v1, v10, :cond_1

    .line 594
    :cond_3
    return-void
.end method

.method private removePackage(Ljava/lang/String;)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 467
    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v1

    .line 468
    :try_start_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->scheduleWriteSettings()V

    .line 470
    monitor-exit v1

    .line 471
    return-void

    .line 470
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private scheduleWriteSettings()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 386
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    invoke-virtual {v0, v3}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 388
    :goto_0
    return-void

    .line 387
    :cond_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    const-wide/16 v1, 0xbb8

    invoke-virtual {v0, v3, v1, v2}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method private setTimeBoot()V
    .locals 6

    .prologue
    .line 516
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long v0, v2, v4

    .line 517
    .local v0, "now_time":J
    iget-object v3, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    monitor-enter v3

    .line 518
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/miui/server/SecurityManagerService;->minWakeUpTime(J)V

    .line 519
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 520
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->sucheduleWriteBootTime()V

    .line 521
    return-void

    .line 519
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private sucheduleWriteBootTime()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 493
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    invoke-virtual {v0, v3}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 495
    :goto_0
    return-void

    .line 494
    :cond_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    const-wide/16 v1, 0xbb8

    invoke-virtual {v0, v3, v1, v2}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method private sucheduleWriteWakeUpTime()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 488
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    invoke-virtual {v0, v3}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 490
    :goto_0
    return-void

    .line 489
    :cond_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecurityWriteHandler:Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;

    const-wide/16 v1, 0xbb8

    invoke-virtual {v0, v3, v1, v2}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method private writeSettings()V
    .locals 8

    .prologue
    .line 440
    const/4 v1, 0x0

    .line 442
    .local v1, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService;->mSettingsFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v5}, Lcom/android/internal/os/AtomicFile;->startWrite()Ljava/io/FileOutputStream;

    move-result-object v1

    .line 443
    new-instance v3, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v3}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 444
    .local v3, "out":Lorg/xmlpull/v1/XmlSerializer;
    const-string v5, "utf-8"

    invoke-interface {v3, v1, v5}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 445
    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 446
    const-string v5, "http://xmlpull.org/v1/doc/features.html#indent-output"

    const/4 v6, 0x1

    invoke-interface {v3, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 447
    const/4 v5, 0x0

    const-string v6, "packages"

    invoke-interface {v3, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 448
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/server/SecurityManagerService$PackageSetting;

    .line 449
    .local v4, "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    const/4 v5, 0x0

    const-string v6, "package"

    invoke-interface {v3, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 450
    const/4 v5, 0x0

    const-string v6, "name"

    iget-object v7, v4, Lcom/miui/server/SecurityManagerService$PackageSetting;->name:Ljava/lang/String;

    invoke-interface {v3, v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 451
    const/4 v5, 0x0

    const-string v6, "accessControl"

    iget-boolean v7, v4, Lcom/miui/server/SecurityManagerService$PackageSetting;->accessControl:Z

    invoke-static {v7}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 452
    const/4 v5, 0x0

    const-string v6, "childrenControl"

    iget-boolean v7, v4, Lcom/miui/server/SecurityManagerService$PackageSetting;->childrenControl:Z

    invoke-static {v7}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 453
    const/4 v5, 0x0

    const-string v6, "package"

    invoke-interface {v3, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 458
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "out":Lorg/xmlpull/v1/XmlSerializer;
    .end local v4    # "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    :catch_0
    move-exception v0

    .line 459
    .local v0, "e1":Ljava/io/IOException;
    const-string v5, "SecurityManagerService"

    const-string v6, "Error writing package settings file"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 460
    if-eqz v1, :cond_0

    .line 461
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService;->mSettingsFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v5, v1}, Lcom/android/internal/os/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V

    .line 464
    .end local v0    # "e1":Ljava/io/IOException;
    :cond_0
    :goto_1
    return-void

    .line 455
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "out":Lorg/xmlpull/v1/XmlSerializer;
    :cond_1
    const/4 v5, 0x0

    :try_start_1
    const-string v6, "packages"

    invoke-interface {v3, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 456
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 457
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService;->mSettingsFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v5, v1}, Lcom/android/internal/os/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private writeWakeUpTime()V
    .locals 9

    .prologue
    .line 524
    const/4 v2, 0x0

    .line 526
    .local v2, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v5}, Lcom/android/internal/os/AtomicFile;->startWrite()Ljava/io/FileOutputStream;

    move-result-object v2

    .line 527
    new-instance v4, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v4}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 528
    .local v4, "out":Lorg/xmlpull/v1/XmlSerializer;
    const-string v5, "utf-8"

    invoke-interface {v4, v2, v5}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 529
    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 530
    const-string v5, "http://xmlpull.org/v1/doc/features.html#indent-output"

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 531
    const/4 v5, 0x0

    const-string v6, "classnames"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 532
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 533
    .local v0, "componentName":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/miui/server/SecurityManagerService;->getBootTimeFromMap(Ljava/lang/String;)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_0

    .line 535
    const/4 v5, 0x0

    const-string v6, "classname"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 536
    const/4 v5, 0x0

    const-string v6, "name"

    invoke-interface {v4, v5, v6, v0}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 537
    const/4 v5, 0x0

    const-string v6, "time"

    invoke-direct {p0, v0}, Lcom/miui/server/SecurityManagerService;->getBootTimeFromMap(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 538
    const/4 v5, 0x0

    const-string v6, "classname"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 543
    .end local v0    # "componentName":Ljava/lang/String;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "out":Lorg/xmlpull/v1/XmlSerializer;
    :catch_0
    move-exception v1

    .line 544
    .local v1, "e1":Ljava/io/IOException;
    if-eqz v2, :cond_1

    .line 545
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v5, v2}, Lcom/android/internal/os/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V

    .line 548
    .end local v1    # "e1":Ljava/io/IOException;
    :cond_1
    :goto_1
    return-void

    .line 540
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "out":Lorg/xmlpull/v1/XmlSerializer;
    :cond_2
    const/4 v5, 0x0

    :try_start_1
    const-string v6, "classnames"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 541
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 542
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService;->mWakeUpFile:Lcom/android/internal/os/AtomicFile;

    invoke-virtual {v5, v2}, Lcom/android/internal/os/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method


# virtual methods
.method public addAccessControlPass(Ljava/lang/String;)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 294
    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mAccessControlPassPackages:Ljava/util/HashSet;

    monitor-enter v1

    .line 295
    :try_start_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mAccessControlPassPackages:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 296
    monitor-exit v1

    .line 297
    return-void

    .line 296
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public checkAccessControlPass(Ljava/lang/String;)Z
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 312
    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mAccessControlPassPackages:Ljava/util/HashSet;

    monitor-enter v1

    .line 313
    :try_start_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mAccessControlPassPackages:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 314
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public checkSmsBlocked(Landroid/content/Intent;)Z
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 270
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecuritySmsHandler:Lcom/miui/server/SecuritySmsHandler;

    invoke-virtual {v0, p1}, Lcom/miui/server/SecuritySmsHandler;->checkSmsBlocked(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public getApplicationAccessControlEnabled(Ljava/lang/String;)Z
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 319
    iget-object v3, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v3

    .line 321
    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/server/SecurityManagerService;->getPackageSetting(Ljava/lang/String;)Lcom/miui/server/SecurityManagerService$PackageSetting;

    move-result-object v1

    .line 322
    .local v1, "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    iget-boolean v2, v1, Lcom/miui/server/SecurityManagerService$PackageSetting;->accessControl:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v3

    .line 324
    .end local v1    # "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    :goto_0
    return v2

    .line 323
    :catch_0
    move-exception v0

    .line 324
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    monitor-exit v3

    goto :goto_0

    .line 326
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public getApplicationChildrenControlEnabled(Ljava/lang/String;)Z
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 341
    iget-object v3, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v3

    .line 343
    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/server/SecurityManagerService;->getPackageSetting(Ljava/lang/String;)Lcom/miui/server/SecurityManagerService$PackageSetting;

    move-result-object v1

    .line 344
    .local v1, "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    iget-boolean v2, v1, Lcom/miui/server/SecurityManagerService$PackageSetting;->childrenControl:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v3

    .line 346
    .end local v1    # "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    :goto_0
    return v2

    .line 345
    :catch_0
    move-exception v0

    .line 346
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    monitor-exit v3

    goto :goto_0

    .line 348
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public getPackageNameByPid(I)Ljava/lang/String;
    .locals 1
    .param p1, "pid"    # I

    .prologue
    .line 265
    invoke-static {p1}, Lcom/android/server/am/ExtraActivityManagerService;->getPackageNameByPid(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWakeUpTime(Ljava/lang/String;)J
    .locals 3
    .param p1, "componentName"    # Ljava/lang/String;

    .prologue
    .line 597
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    const-string v1, "com.miui.permission.MANAGE_BOOT_TIME"

    const-string v2, "SecurityManagerService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    invoke-direct {p0, p1}, Lcom/miui/server/SecurityManagerService;->getBootTimeFromMap(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public killNativePackageProcesses(ILjava/lang/String;)V
    .locals 1
    .param p1, "uid"    # I
    .param p2, "pkgName"    # Ljava/lang/String;

    .prologue
    .line 259
    const/16 v0, 0x2710

    if-lt p1, v0, :cond_0

    .line 260
    invoke-direct {p0, p1, p2}, Lcom/miui/server/SecurityManagerService;->nativeKillPackageProcesses(ILjava/lang/String;)V

    .line 261
    :cond_0
    return-void
.end method

.method public putSystemDataStringFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 611
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    .line 612
    .local v0, "callingUid":I
    const/16 v5, 0x3e8

    if-eq v0, v5, :cond_0

    .line 613
    new-instance v5, Ljava/lang/SecurityException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "no permission to put file for UID:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 615
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 616
    .local v2, "file":Ljava/io/File;
    const/4 v3, 0x0

    .line 617
    .local v3, "raf":Ljava/io/RandomAccessFile;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 619
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 625
    :cond_1
    :goto_0
    :try_start_1
    new-instance v4, Ljava/io/RandomAccessFile;

    const-string v5, "rw"

    invoke-direct {v4, v2, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 626
    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .local v4, "raf":Ljava/io/RandomAccessFile;
    :try_start_2
    invoke-virtual {v4, p2}, Ljava/io/RandomAccessFile;->writeUTF(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 627
    const/4 v5, 0x1

    .line 631
    if-eqz v4, :cond_2

    .line 633
    :try_start_3
    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    :cond_2
    :goto_1
    move-object v3, v4

    .line 639
    .end local v4    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    :goto_2
    return v5

    .line 620
    :catch_0
    move-exception v1

    .line 621
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 628
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 629
    .restart local v1    # "e":Ljava/io/IOException;
    :goto_3
    :try_start_4
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 631
    if-eqz v3, :cond_3

    .line 633
    :try_start_5
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 639
    :cond_3
    :goto_4
    const/4 v5, 0x0

    goto :goto_2

    .line 631
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    :goto_5
    if-eqz v3, :cond_4

    .line 633
    :try_start_6
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 631
    :cond_4
    :goto_6
    throw v5

    .line 634
    :catch_2
    move-exception v1

    .line 635
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 634
    :catch_3
    move-exception v1

    .line 635
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 634
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .restart local v4    # "raf":Ljava/io/RandomAccessFile;
    :catch_4
    move-exception v1

    .line 635
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 631
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    goto :goto_5

    .line 628
    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .restart local v4    # "raf":Ljava/io/RandomAccessFile;
    :catch_5
    move-exception v1

    move-object v3, v4

    .end local v4    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    goto :goto_3
.end method

.method public readSystemDataStringFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 644
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    .line 645
    .local v0, "callingUid":I
    const/16 v6, 0x3e8

    if-eq v0, v6, :cond_0

    .line 646
    new-instance v6, Ljava/lang/SecurityException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "no permission to read file for UID:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 648
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 649
    .local v2, "file":Ljava/io/File;
    const/4 v3, 0x0

    .line 650
    .local v3, "raf":Ljava/io/RandomAccessFile;
    const/4 v5, 0x0

    .line 651
    .local v5, "result":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 653
    :try_start_0
    new-instance v4, Ljava/io/RandomAccessFile;

    const-string v6, "r"

    invoke-direct {v4, v2, v6}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 654
    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .local v4, "raf":Ljava/io/RandomAccessFile;
    :try_start_1
    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readUTF()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v5

    .line 658
    if-eqz v4, :cond_1

    .line 660
    :try_start_2
    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    :cond_1
    :goto_0
    move-object v3, v4

    .line 667
    .end local v4    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    :cond_2
    :goto_1
    return-object v5

    .line 655
    :catch_0
    move-exception v1

    .line 656
    .local v1, "e":Ljava/io/IOException;
    :goto_2
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 658
    if-eqz v3, :cond_2

    .line 660
    :try_start_4
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 661
    :catch_1
    move-exception v1

    .line 662
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 658
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_3
    if-eqz v3, :cond_3

    .line 660
    :try_start_5
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 658
    :cond_3
    :goto_4
    throw v6

    .line 661
    :catch_2
    move-exception v1

    .line 662
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 661
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .restart local v4    # "raf":Ljava/io/RandomAccessFile;
    :catch_3
    move-exception v1

    .line 662
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 658
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v6

    move-object v3, v4

    .end local v4    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    goto :goto_3

    .line 655
    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .restart local v4    # "raf":Ljava/io/RandomAccessFile;
    :catch_4
    move-exception v1

    move-object v3, v4

    .end local v4    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    goto :goto_2
.end method

.method public removeAccessControlPass(Ljava/lang/String;)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 301
    iget-object v1, p0, Lcom/miui/server/SecurityManagerService;->mAccessControlPassPackages:Ljava/util/HashSet;

    monitor-enter v1

    .line 302
    :try_start_0
    const-string v0, "*"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mAccessControlPassPackages:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 307
    :goto_0
    monitor-exit v1

    .line 308
    return-void

    .line 305
    :cond_0
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mAccessControlPassPackages:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 307
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setApplicationAccessControlEnabled(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "enabled"    # Z

    .prologue
    .line 331
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->checkPermission()V

    .line 332
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v2

    .line 333
    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/server/SecurityManagerService;->getPackageSetting(Ljava/lang/String;)Lcom/miui/server/SecurityManagerService$PackageSetting;

    move-result-object v0

    .line 334
    .local v0, "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    iput-boolean p2, v0, Lcom/miui/server/SecurityManagerService$PackageSetting;->accessControl:Z

    .line 335
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->scheduleWriteSettings()V

    .line 336
    monitor-exit v2

    .line 337
    return-void

    .line 336
    .end local v0    # "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setApplicationChildrenControlEnabled(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "enabled"    # Z

    .prologue
    .line 353
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->checkPermission()V

    .line 354
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v2

    .line 355
    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/server/SecurityManagerService;->getPackageSetting(Ljava/lang/String;)Lcom/miui/server/SecurityManagerService$PackageSetting;

    move-result-object v0

    .line 356
    .local v0, "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    iput-boolean p2, v0, Lcom/miui/server/SecurityManagerService$PackageSetting;->childrenControl:Z

    .line 357
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->scheduleWriteSettings()V

    .line 358
    monitor-exit v2

    .line 359
    return-void

    .line 358
    .end local v0    # "ps":Lcom/miui/server/SecurityManagerService$PackageSetting;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setWakeUpTime(Ljava/lang/String;J)V
    .locals 3
    .param p1, "componentName"    # Ljava/lang/String;
    .param p2, "timeInSeconds"    # J

    .prologue
    .line 498
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;

    const-string v1, "com.miui.permission.MANAGE_BOOT_TIME"

    const-string v2, "SecurityManagerService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    invoke-direct {p0, p1, p2, p3}, Lcom/miui/server/SecurityManagerService;->putBootTimeToMap(Ljava/lang/String;J)V

    .line 500
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->sucheduleWriteWakeUpTime()V

    .line 501
    invoke-direct {p0}, Lcom/miui/server/SecurityManagerService;->setTimeBoot()V

    .line 502
    return-void
.end method

.method public startInterceptSmsBySender(Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 1
    .param p1, "pkgName"    # Ljava/lang/String;
    .param p2, "sender"    # Ljava/lang/String;
    .param p3, "count"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecuritySmsHandler:Lcom/miui/server/SecuritySmsHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/server/SecuritySmsHandler;->startInterceptSmsBySender(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public stopInterceptSmsBySender()Z
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService;->mSecuritySmsHandler:Lcom/miui/server/SecuritySmsHandler;

    invoke-virtual {v0}, Lcom/miui/server/SecuritySmsHandler;->stopInterceptSmsBySender()Z

    move-result v0

    return v0
.end method
