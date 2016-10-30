.class public final Lcom/android/server/pm/HibernateThread;
.super Ljava/lang/Thread;
.source "HibernateThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/pm/HibernateThread$CloseDialogReceiver;
    }
.end annotation


# static fields
.field private static final MAX_BROADCAST_TIME:I = 0x2710

.field private static final MAX_NUM_PHONE_STATE_READS:I = 0x10

.field private static final MAX_RADIO_WAIT_TIME:I = 0x2ee0

.field private static final MAX_SHUTDOWN_WAIT_TIME:I = 0x4e20

.field private static final PHONE_STATE_POLL_SLEEP_MSEC:I = 0x1f4

.field public static final REBOOT_SAFEMODE_PROPERTY:Ljava/lang/String; = "persist.sys.safemode"

.field public static final SHUTDOWN_ACTION_PROPERTY:Ljava/lang/String; = "sys.shutdown.requested"

.field private static final SHUTDOWN_VIBRATE_MS:I = 0x1f4

.field private static final TAG:Ljava/lang/String; = "HibernateThread"

.field private static isCharging:Z

.field private static mProcess:Ljava/lang/Process;

.field private static mStorageManager:Landroid/os/storage/StorageManager;

.field private static pd:Landroid/app/ProgressDialog;

.field private static sInstance:Lcom/android/server/pm/HibernateThread;

.field private static sIsStarted:Z

.field private static sIsStartedGuard:Ljava/lang/Object;

.field private static vibrator:Landroid/os/Vibrator;


# instance fields
.field private DEBUG:Z

.field private mActionDone:Z

.field private final mActionDoneSync:Ljava/lang/Object;

.field private mChargerHandler:Landroid/os/Handler;

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mPackageDontKillSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPowerManager:Landroid/os/PowerManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 113
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/server/pm/HibernateThread;->sIsStartedGuard:Ljava/lang/Object;

    .line 114
    sput-boolean v1, Lcom/android/server/pm/HibernateThread;->sIsStarted:Z

    .line 129
    sput-boolean v1, Lcom/android/server/pm/HibernateThread;->isCharging:Z

    .line 136
    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/pm/HibernateThread;->mProcess:Ljava/lang/Process;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 141
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 100
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/pm/HibernateThread;->DEBUG:Z

    .line 125
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/HibernateThread;->mActionDoneSync:Ljava/lang/Object;

    .line 130
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/HibernateThread;->mChargerHandler:Landroid/os/Handler;

    .line 137
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/HibernateThread;->mPackageDontKillSet:Ljava/util/HashSet;

    .line 142
    return-void
.end method

.method private Hibernate()V
    .locals 5

    .prologue
    .line 662
    iget-object v2, p0, Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/server/pm/HibernateThread;->forceKillActiveServices(Landroid/content/Context;)V

    .line 668
    iget-object v2, p0, Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;

    const-string v3, "power"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 670
    .local v1, "pm":Landroid/os/PowerManager;
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->goToSleep(J)V

    .line 671
    const-string v2, "HibernateThread"

    const-string v3, "QuickBoot DOWN Hibernate goToSleep"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    const-string v2, "service.quickboot.state"

    const-string v3, "1"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 676
    :try_start_0
    sget-object v2, Lcom/android/server/pm/HibernateThread;->vibrator:Landroid/os/Vibrator;

    const-wide/16 v3, 0x1f4

    invoke-virtual {v2, v3, v4}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 681
    :goto_0
    sget-object v2, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    if-eqz v2, :cond_0

    .line 682
    sget-object v2, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 684
    :cond_0
    sget-object v2, Lcom/android/server/pm/HibernateThread;->mProcess:Ljava/lang/Process;

    if-eqz v2, :cond_1

    .line 685
    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    .line 686
    sget-object v2, Lcom/android/server/pm/HibernateThread;->mProcess:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V

    .line 687
    const/4 v2, 0x0

    sput-object v2, Lcom/android/server/pm/HibernateThread;->mProcess:Ljava/lang/Process;

    .line 689
    :cond_1
    return-void

    .line 677
    :catch_0
    move-exception v0

    .line 678
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "HibernateThread"

    const-string v3, "Failed to vibrate during shutdown."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static PowerShutdown()V
    .locals 0

    .prologue
    .line 844
    invoke-static {}, Lcom/android/server/power/PowerManagerService;->lowLevelShutdown()V

    .line 845
    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 97
    invoke-static {p0}, Lcom/android/server/pm/HibernateThread;->beginShutdownSequence(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$100()Landroid/os/storage/StorageManager;
    .locals 1

    .prologue
    .line 97
    sget-object v0, Lcom/android/server/pm/HibernateThread;->mStorageManager:Landroid/os/storage/StorageManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/pm/HibernateThread;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/server/pm/HibernateThread;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/pm/HibernateThread;

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/android/server/pm/HibernateThread;->DEBUG:Z

    return v0
.end method

.method private static beWallpaperApk(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 693
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.service.wallpaper.WallpaperService"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 694
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v4, v1, v5}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 696
    .local v2, "ris":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 697
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    iget-object v3, v4, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 698
    .local v3, "rsi":Landroid/content/pm/ServiceInfo;
    iget-object v4, v3, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 699
    const/4 v4, 0x1

    .line 702
    .end local v3    # "rsi":Landroid/content/pm/ServiceInfo;
    :goto_1
    return v4

    .line 696
    .restart local v3    # "rsi":Landroid/content/pm/ServiceInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 702
    .end local v3    # "rsi":Landroid/content/pm/ServiceInfo;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private static beginShutdownSequence(Landroid/content/Context;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 225
    sget-object v5, Lcom/android/server/pm/HibernateThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v5

    .line 226
    :try_start_0
    sget-boolean v4, Lcom/android/server/pm/HibernateThread;->sIsStarted:Z

    if-eqz v4, :cond_0

    .line 227
    const-string v4, "HibernateThread"

    const-string v6, "Shutdown sequence already running, returning."

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    monitor-exit v5

    .line 291
    :goto_0
    return-void

    .line 230
    :cond_0
    const/4 v4, 0x1

    sput-boolean v4, Lcom/android/server/pm/HibernateThread;->sIsStarted:Z

    .line 231
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 233
    const-string v4, "service.quickboot.state"

    const-string v5, "2"

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    new-instance v1, Landroid/content/Intent;

    const-string v4, "zte.com.cn.action.quickshutdown"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 235
    .local v1, "intentshutdown":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 237
    const-string v4, "vibrator"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Vibrator;

    sput-object v4, Lcom/android/server/pm/HibernateThread;->vibrator:Landroid/os/Vibrator;

    .line 239
    const-string v4, "storage"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/storage/StorageManager;

    sput-object v4, Lcom/android/server/pm/HibernateThread;->mStorageManager:Landroid/os/storage/StorageManager;

    .line 240
    const-string v4, "window"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v2

    .line 242
    .local v2, "mWm":Landroid/view/IWindowManager;
    const-string v4, "window"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    .line 244
    .local v3, "wm":Landroid/view/WindowManager;
    const-string v4, "HibernateThread"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Shutdown getRotation() "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Display;->getRotation()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-eqz v4, :cond_1

    .line 248
    const/4 v4, 0x0

    :try_start_1
    invoke-interface {v2, v4}, Landroid/view/IWindowManager;->freezeRotation(I)V

    .line 249
    const-string v4, "persist.sys.rotationconfig"

    const-string v5, "1"

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    const-string v4, "HibernateThread"

    const-string v5, "Shutdown freezeRotation "

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 259
    :goto_1
    new-instance v4, Lcom/android/server/pm/HibernateThread;

    invoke-direct {v4}, Lcom/android/server/pm/HibernateThread;-><init>()V

    sput-object v4, Lcom/android/server/pm/HibernateThread;->sInstance:Lcom/android/server/pm/HibernateThread;

    .line 260
    new-instance v0, Ljava/io/File;

    const-string v4, "/system/media/shutdownanimation.zip"

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 261
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 263
    :try_start_2
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "/system/bin/bootanimation"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "-s"

    aput-object v7, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    sput-object v4, Lcom/android/server/pm/HibernateThread;->mProcess:Ljava/lang/Process;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 283
    :goto_2
    sget-object v4, Lcom/android/server/pm/HibernateThread;->sInstance:Lcom/android/server/pm/HibernateThread;

    iput-object p0, v4, Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;

    .line 284
    sget-object v5, Lcom/android/server/pm/HibernateThread;->sInstance:Lcom/android/server/pm/HibernateThread;

    const-string v4, "power"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    iput-object v4, v5, Lcom/android/server/pm/HibernateThread;->mPowerManager:Landroid/os/PowerManager;

    .line 285
    sget-object v4, Lcom/android/server/pm/HibernateThread;->sInstance:Lcom/android/server/pm/HibernateThread;

    iget-object v4, v4, Lcom/android/server/pm/HibernateThread;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v4}, Landroid/os/PowerManager;->isPowered()Z

    move-result v4

    sput-boolean v4, Lcom/android/server/pm/HibernateThread;->isCharging:Z

    .line 288
    sget-object v4, Lcom/android/server/pm/HibernateThread;->sInstance:Lcom/android/server/pm/HibernateThread;

    new-instance v5, Lcom/android/server/pm/HibernateThread$2;

    invoke-direct {v5}, Lcom/android/server/pm/HibernateThread$2;-><init>()V

    iput-object v5, v4, Lcom/android/server/pm/HibernateThread;->mHandler:Landroid/os/Handler;

    .line 290
    sget-object v4, Lcom/android/server/pm/HibernateThread;->sInstance:Lcom/android/server/pm/HibernateThread;

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 231
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "intentshutdown":Landroid/content/Intent;
    .end local v2    # "mWm":Landroid/view/IWindowManager;
    .end local v3    # "wm":Landroid/view/WindowManager;
    :catchall_0
    move-exception v4

    :try_start_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v4

    .line 256
    .restart local v1    # "intentshutdown":Landroid/content/Intent;
    .restart local v2    # "mWm":Landroid/view/IWindowManager;
    .restart local v3    # "wm":Landroid/view/WindowManager;
    :cond_1
    const-string v4, "persist.sys.rotationconfig"

    const-string v5, "0"

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 270
    .restart local v0    # "file":Ljava/io/File;
    :cond_2
    new-instance v4, Landroid/app/ProgressDialog;

    invoke-direct {v4, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    sput-object v4, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    .line 271
    sget-object v4, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    const v5, 0x10400f1

    invoke-virtual {p0, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 273
    sget-object v4, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    const v5, 0x10400f5

    invoke-virtual {p0, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 275
    sget-object v4, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v4, v8}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 276
    sget-object v4, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v4, v7}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 277
    sget-object v4, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x7d9

    invoke-virtual {v4, v5}, Landroid/view/Window;->setType(I)V

    .line 280
    sget-object v4, Lcom/android/server/pm/HibernateThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    goto :goto_2

    .line 265
    :catch_0
    move-exception v4

    goto :goto_2

    .line 252
    .end local v0    # "file":Ljava/io/File;
    :catch_1
    move-exception v4

    goto/16 :goto_1
.end method

.method private displayHomeScreen()V
    .locals 4

    .prologue
    .line 793
    const-string v2, "HibernateThread"

    const-string v3, "start homescreen activity"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 794
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 795
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "android.intent.category.HOME"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 796
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 798
    :try_start_0
    iget-object v2, p0, Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 802
    :goto_0
    return-void

    .line 799
    :catch_0
    move-exception v0

    .line 800
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method private static forceKillActiveServices(Landroid/content/Context;)V
    .locals 15
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 706
    const-string v12, "activity"

    invoke-virtual {p0, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 708
    .local v0, "am":Landroid/app/ActivityManager;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    .line 709
    .local v9, "pm":Landroid/content/pm/PackageManager;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 710
    .local v7, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v8

    .line 712
    .local v8, "listRun":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    const-string v13, "default_input_method"

    invoke-static {v12, v13}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 715
    .local v1, "defaultImiId":Ljava/lang/String;
    const-string v2, "com.zte.input"

    .line 716
    .local v2, "defaultImiIdName":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v12

    const/16 v13, 0xc

    if-le v12, v13, :cond_0

    .line 717
    const/4 v13, 0x0

    const-string v12, "/"

    invoke-virtual {v1, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    if-lez v12, :cond_2

    const-string v12, "/"

    invoke-virtual {v1, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    :goto_0
    invoke-virtual {v1, v13, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 720
    :cond_0
    const-string v12, "HibernateThread"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "QuickBoot DOWN do not kill persist process default INPUT METHOD="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 725
    .local v11, "ti":Landroid/app/ActivityManager$RunningAppProcessInfo;
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 726
    .local v10, "size":I
    const/4 v4, 0x0

    .line 727
    .local v4, "flag":I
    iget v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->flags:I

    and-int/lit8 v12, v12, 0x2

    if-eqz v12, :cond_3

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.mms"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_3

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "zte.com.cn.driverMode"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_3

    .line 730
    const-string v12, "HibernateThread"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "QuickBoot DOWN do not kill persist process="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 717
    .end local v4    # "flag":I
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v10    # "size":I
    .end local v11    # "ti":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_2
    const/16 v12, 0xd

    goto :goto_0

    .line 734
    .restart local v4    # "flag":I
    .restart local v6    # "i$":Ljava/util/Iterator;
    .restart local v10    # "size":I
    .restart local v11    # "ti":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_3
    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.launcher"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.inputmethod.latin"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.systemui"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.google.process.gapps"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.smspush"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.phone"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.google.android"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "android.process.media"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.wallpaper"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.qihoo360"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "zte.com.cn.alarmclock"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.quicinc.cne"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v12, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.providers.calendar"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.deskclock"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.voicedialer"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.qualcomm"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.qualcomm"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.nfc"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.android.settings"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "com.zte.milauncher"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v13, "system"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 756
    :cond_4
    const-string v12, "HibernateThread"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "QuickBoot DOWN do not kill protect process="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 761
    :cond_5
    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-static {p0, v12}, Lcom/android/server/pm/HibernateThread;->beWallpaperApk(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 762
    const-string v12, "HibernateThread"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "QuickBoot DOWN do not kill wallpaper process="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 767
    :cond_6
    new-instance v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    iget v13, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    iget-object v14, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    invoke-direct {v3, v12, v13, v14}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>(Ljava/lang/String;I[Ljava/lang/String;)V

    .line 769
    .local v3, "dp":Landroid/app/ActivityManager$RunningAppProcessInfo;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    if-ge v5, v10, :cond_7

    .line 770
    iget-object v13, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/app/ActivityManager$RunningAppProcessInfo;

    iget-object v12, v12, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    if-ne v13, v12, :cond_8

    .line 771
    const/4 v4, 0x1

    .line 776
    :cond_7
    if-nez v4, :cond_1

    .line 777
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 769
    :cond_8
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 782
    .end local v3    # "dp":Landroid/app/ActivityManager$RunningAppProcessInfo;
    .end local v4    # "flag":I
    .end local v5    # "i":I
    .end local v10    # "size":I
    .end local v11    # "ti":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_9
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 783
    .restart local v11    # "ti":Landroid/app/ActivityManager$RunningAppProcessInfo;
    const-string v12, "HibernateThread"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "QuickBoot DOWN quickShutKill Kill ti.processName="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 785
    iget-object v12, v11, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v0, v12}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V

    goto :goto_3

    .line 787
    .end local v11    # "ti":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_a
    return-void
.end method

.method public static rebootOrShutdown(ZLjava/lang/String;)V
    .locals 4
    .param p0, "reboot"    # Z
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 814
    if-eqz p0, :cond_0

    .line 815
    const-string v1, "HibernateThread"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Rebooting, reason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 817
    :try_start_0
    invoke-static {p1}, Lcom/android/server/power/PowerManagerService;->lowLevelReboot(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 839
    :goto_0
    const-string v1, "HibernateThread"

    const-string v2, "Performing low-level shutdown..."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 840
    invoke-static {}, Lcom/android/server/power/PowerManagerService;->lowLevelShutdown()V

    .line 841
    return-void

    .line 818
    :catch_0
    move-exception v0

    .line 819
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "HibernateThread"

    const-string v2, "Reboot failed, will attempt shutdown instead"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 824
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :try_start_1
    sget-object v1, Lcom/android/server/pm/HibernateThread;->vibrator:Landroid/os/Vibrator;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 833
    :goto_1
    const-wide/16 v1, 0x1f4

    :try_start_2
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 834
    :catch_1
    move-exception v1

    goto :goto_0

    .line 825
    :catch_2
    move-exception v0

    .line 827
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v1, "HibernateThread"

    const-string v2, "Failed to vibrate during shutdown."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private resetProperty()V
    .locals 2

    .prologue
    .line 848
    const-string v0, "sys.hibernate.state"

    const-string v1, "hibernating"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 849
    return-void
.end method

.method public static shutdown(Landroid/content/Context;Z)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "confirm"    # Z

    .prologue
    .line 154
    const-string v5, "service.quickboot.lowbattery"

    const/4 v6, 0x0

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 155
    .local v0, "batteryLow":I
    const-string v5, "HibernateThread"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "batteryLevel."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const/4 v5, 0x1

    if-ne v0, v5, :cond_0

    .line 157
    invoke-static {}, Lcom/android/server/power/PowerManagerService;->lowLevelShutdown()V

    .line 200
    :goto_0
    return-void

    .line 163
    :cond_0
    sget-object v6, Lcom/android/server/pm/HibernateThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v6

    .line 164
    :try_start_0
    sget-boolean v5, Lcom/android/server/pm/HibernateThread;->sIsStarted:Z

    if-eqz v5, :cond_1

    .line 165
    const-string v5, "HibernateThread"

    const-string v7, "Request to shutdown already running, returning."

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    monitor-exit v6

    goto :goto_0

    .line 168
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    :cond_1
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x10e001c

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    .line 172
    .local v3, "longPressBehavior":I
    const/4 v5, 0x2

    if-ne v3, v5, :cond_2

    const v4, 0x10400f7

    .line 175
    .local v4, "resourceId":I
    :goto_1
    const-string v5, "HibernateThread"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Notifying thread to start shutdown longPressBehavior="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    if-eqz p1, :cond_3

    .line 179
    new-instance v1, Lcom/android/server/pm/HibernateThread$CloseDialogReceiver;

    invoke-direct {v1, p0}, Lcom/android/server/pm/HibernateThread$CloseDialogReceiver;-><init>(Landroid/content/Context;)V

    .line 180
    .local v1, "closer":Lcom/android/server/pm/HibernateThread$CloseDialogReceiver;
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-direct {v5, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v6, 0x10400f1

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x1040013

    new-instance v7, Lcom/android/server/pm/HibernateThread$1;

    invoke-direct {v7, p0}, Lcom/android/server/pm/HibernateThread$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x1040009

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 192
    .local v2, "dialog":Landroid/app/AlertDialog;
    iput-object v2, v1, Lcom/android/server/pm/HibernateThread$CloseDialogReceiver;->dialog:Landroid/app/Dialog;

    .line 193
    invoke-virtual {v2, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 194
    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/16 v6, 0x7d9

    invoke-virtual {v5, v6}, Landroid/view/Window;->setType(I)V

    .line 196
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 172
    .end local v1    # "closer":Lcom/android/server/pm/HibernateThread$CloseDialogReceiver;
    .end local v2    # "dialog":Landroid/app/AlertDialog;
    .end local v4    # "resourceId":I
    :cond_2
    const v4, 0x10400f6

    goto :goto_1

    .line 198
    .restart local v4    # "resourceId":I
    :cond_3
    invoke-static {p0}, Lcom/android/server/pm/HibernateThread;->beginShutdownSequence(Landroid/content/Context;)V

    goto/16 :goto_0
.end method

.method private shutdownRadios(I)V
    .locals 12
    .param p1, "timeout"    # I

    .prologue
    const/4 v11, 0x0

    .line 408
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    int-to-long v9, p1

    add-long v1, v7, v9

    .line 409
    .local v1, "endTime":J
    const/4 v7, 0x1

    new-array v0, v7, [Z

    .line 410
    .local v0, "done":[Z
    new-instance v6, Lcom/android/server/pm/HibernateThread$5;

    invoke-direct {v6, p0, v1, v2, v0}, Lcom/android/server/pm/HibernateThread$5;-><init>(Lcom/android/server/pm/HibernateThread;J[Z)V

    .line 627
    .local v6, "t":Ljava/lang/Thread;
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 629
    int-to-long v7, p1

    :try_start_0
    invoke-virtual {v6, v7, v8}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 632
    :goto_0
    aget-boolean v7, v0, v11

    if-nez v7, :cond_0

    .line 633
    const-string v7, "HibernateThread"

    const-string v8, "Timed out waiting for Bluetooth Radio and Wifi shutdown."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 635
    const/4 v7, 0x0

    invoke-static {v11, v7}, Lcom/android/server/pm/HibernateThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 658
    :goto_1
    return-void

    .line 637
    :cond_0
    sget-object v7, Lcom/android/server/pm/HibernateThread;->mProcess:Ljava/lang/Process;

    if-eqz v7, :cond_3

    .line 638
    const-string v7, "HibernateThread"

    const-string v8, "Waiting for shutdown animation..."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    sget-object v7, Lcom/android/server/pm/HibernateThread;->mProcess:Ljava/lang/Process;

    invoke-virtual {v7}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v5

    .line 640
    .local v5, "stream":Ljava/io/InputStream;
    if-eqz v5, :cond_2

    .line 642
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 643
    .local v3, "now":J
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v3

    const-wide/16 v9, 0x4e20

    cmp-long v7, v7, v9

    if-gtz v7, :cond_1

    .line 644
    invoke-virtual {v5}, Ljava/io/InputStream;->available()I

    move-result v7

    if-lez v7, :cond_4

    .line 649
    :cond_1
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 653
    .end local v3    # "now":J
    :cond_2
    :goto_3
    const-string v7, "HibernateThread"

    const-string v8, "Shutdown animation completed."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    .end local v5    # "stream":Ljava/io/InputStream;
    :cond_3
    invoke-direct {p0}, Lcom/android/server/pm/HibernateThread;->Hibernate()V

    goto :goto_1

    .line 647
    .restart local v3    # "now":J
    .restart local v5    # "stream":Ljava/io/InputStream;
    :cond_4
    const-wide/16 v7, 0x1f4

    :try_start_2
    invoke-static {v7, v8}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 650
    .end local v3    # "now":J
    :catch_0
    move-exception v7

    goto :goto_3

    .line 630
    .end local v5    # "stream":Ljava/io/InputStream;
    :catch_1
    move-exception v7

    goto :goto_0
.end method


# virtual methods
.method actionDone()V
    .locals 2

    .prologue
    .line 294
    iget-object v1, p0, Lcom/android/server/pm/HibernateThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v1

    .line 295
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/server/pm/HibernateThread;->mActionDone:Z

    .line 296
    iget-object v0, p0, Lcom/android/server/pm/HibernateThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 297
    monitor-exit v1

    .line 298
    return-void

    .line 297
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 15

    .prologue
    .line 311
    invoke-direct {p0}, Lcom/android/server/pm/HibernateThread;->displayHomeScreen()V

    .line 313
    invoke-direct {p0}, Lcom/android/server/pm/HibernateThread;->resetProperty()V

    .line 320
    const-string v0, "persist.sys.hibernate.debug"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/pm/HibernateThread;->DEBUG:Z

    .line 322
    const-string v0, "persist.sys.usb.config"

    const-string v1, "mtp,adb"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 323
    .local v13, "persistSysUsbConfig":Ljava/lang/String;
    const-string v0, "HibernateThread"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "persist.sys.usb.config is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    const-string v0, "sys.usb.config"

    const-string v1, "charge_only"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    const-string v0, "mass_storage,adb"

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 326
    sget-object v0, Lcom/android/server/pm/HibernateThread;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v0}, Landroid/os/storage/StorageManager;->disableUsbMassStorage()V

    .line 328
    :cond_0
    const-string v0, "sys.usb.config"

    const-string v1, "error:not_set"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 329
    .local v14, "sysusbconfigResult":Ljava/lang/String;
    const-string v0, "HibernateThread"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sys.usb.config is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    new-instance v3, Lcom/android/server/pm/HibernateThread$3;

    invoke-direct {v3, p0}, Lcom/android/server/pm/HibernateThread$3;-><init>(Lcom/android/server/pm/HibernateThread;)V

    .line 339
    .local v3, "br":Landroid/content/BroadcastReceiver;
    const-string v0, "HibernateThread"

    const-string v1, "Sending hibernate broadcast..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/pm/HibernateThread;->mActionDone:Z

    .line 343
    iget-object v0, p0, Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.ACTION_HIBERNATE_ON"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/android/server/pm/HibernateThread;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 346
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v4, 0x2710

    add-long v11, v0, v4

    .line 347
    .local v11, "endTime":J
    iget-object v1, p0, Lcom/android/server/pm/HibernateThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v1

    .line 348
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/android/server/pm/HibernateThread;->mActionDone:Z

    if-nez v0, :cond_1

    .line 349
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long v9, v11, v4

    .line 350
    .local v9, "delay":J
    const-wide/16 v4, 0x0

    cmp-long v0, v9, v4

    if-gtz v0, :cond_3

    .line 351
    const-string v0, "HibernateThread"

    const-string v2, "hibernate broadcast timed out"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    .end local v9    # "delay":J
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 361
    const-string v0, "HibernateThread"

    const-string v1, "hibernate activity manager..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    const-string v0, "activity"

    invoke-static {v0}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/app/ActivityManagerNative;->asInterface(Landroid/os/IBinder;)Landroid/app/IActivityManager;

    move-result-object v8

    .line 373
    .local v8, "am":Landroid/app/IActivityManager;
    iget-object v0, p0, Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "persist.sys.quickboot.modereset"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 377
    const/16 v0, 0x2ee0

    invoke-direct {p0, v0}, Lcom/android/server/pm/HibernateThread;->shutdownRadios(I)V

    .line 378
    sget-boolean v0, Lcom/android/server/pm/HibernateThread;->isCharging:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 379
    iget-object v0, p0, Lcom/android/server/pm/HibernateThread;->mChargerHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/pm/HibernateThread$4;

    invoke-direct {v1, p0}, Lcom/android/server/pm/HibernateThread$4;-><init>(Lcom/android/server/pm/HibernateThread;)V

    const-wide/16 v4, 0xfa0

    invoke-virtual {v0, v1, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 398
    :cond_2
    sget-object v1, Lcom/android/server/pm/HibernateThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v1

    .line 399
    const/4 v0, 0x0

    :try_start_1
    sput-boolean v0, Lcom/android/server/pm/HibernateThread;->sIsStarted:Z

    .line 400
    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/pm/HibernateThread;->sInstance:Lcom/android/server/pm/HibernateThread;

    .line 401
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 402
    return-void

    .line 355
    .end local v8    # "am":Landroid/app/IActivityManager;
    .restart local v9    # "delay":J
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/android/server/pm/HibernateThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v0, v9, v10}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 356
    :catch_0
    move-exception v0

    goto :goto_0

    .line 359
    .end local v9    # "delay":J
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    .line 401
    .restart local v8    # "am":Landroid/app/IActivityManager;
    :catchall_1
    move-exception v0

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0
.end method
