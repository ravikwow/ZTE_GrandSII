.class public Lcom/miui/server/BackupManagerService;
.super Lmiui/app/backup/IBackupManager$Stub;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/server/BackupManagerService$DeathLinker;,
        Lcom/miui/server/BackupManagerService$BackupHandler;,
        Lcom/miui/server/BackupManagerService$FullBackupRestoreObserver;
    }
.end annotation


# static fields
.field private static final COMPONENT_ENABLED_STATE_NONE:I = -0x1

.field private static final FD_NONE:I = -0x1

.field private static final PID_NONE:I = -0x1

.field private static final TAG:Ljava/lang/String; = "Backup:BackupManagerService"


# instance fields
.field private BackupManagerService_fullBackup:Ljava/lang/reflect/Method;

.field private mActivityManager:Landroid/app/ActivityManager;

.field private mBackupReadSide:Landroid/os/ParcelFileDescriptor;

.field private mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

.field private mCallerFd:I

.field private mContext:Landroid/content/Context;

.field private mCurrentCompletedSize:J

.field private mCurrentTotalSize:J

.field private mCurrentWorkingFeature:I

.field private mCurrentWorkingPkg:Ljava/lang/String;

.field private mDeathLinker:Lcom/miui/server/BackupManagerService$DeathLinker;

.field private mEncryptedPwd:Ljava/lang/String;

.field private mEncryptedPwdInBakFile:Ljava/lang/String;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mICaller:Landroid/os/IBinder;

.field private mIsNeedBeKilled:Z

.field private mLastError:I

.field private mOwnerPid:I

.field private mPackageLastEnableState:I

.field private mPackageManager:Landroid/content/pm/PackageManager;

.field private mPackageStatsObserver:Landroid/content/pm/IPackageStatsObserver;

.field private mProgType:I

.field private mPwd:Ljava/lang/String;

.field private mState:I

.field private mStateObservers:Landroid/os/RemoteCallbackList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/RemoteCallbackList",
            "<",
            "Lmiui/app/backup/IBackupServiceStateObserver;",
            ">;"
        }
    .end annotation
.end field

.field private mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, -0x1

    const/4 v3, 0x0

    .line 88
    invoke-direct {p0}, Lmiui/app/backup/IBackupManager$Stub;-><init>()V

    .line 67
    new-instance v0, Landroid/os/RemoteCallbackList;

    invoke-direct {v0}, Landroid/os/RemoteCallbackList;-><init>()V

    iput-object v0, p0, Lcom/miui/server/BackupManagerService;->mStateObservers:Landroid/os/RemoteCallbackList;

    .line 68
    iput v1, p0, Lcom/miui/server/BackupManagerService;->mOwnerPid:I

    .line 69
    iput-object v3, p0, Lcom/miui/server/BackupManagerService;->mICaller:Landroid/os/IBinder;

    .line 70
    new-instance v0, Lcom/miui/server/BackupManagerService$DeathLinker;

    invoke-direct {v0, p0, v3}, Lcom/miui/server/BackupManagerService$DeathLinker;-><init>(Lcom/miui/server/BackupManagerService;Lcom/miui/server/BackupManagerService$1;)V

    iput-object v0, p0, Lcom/miui/server/BackupManagerService;->mDeathLinker:Lcom/miui/server/BackupManagerService$DeathLinker;

    .line 71
    iput-object v3, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    iput-object v3, p0, Lcom/miui/server/BackupManagerService;->mBackupReadSide:Landroid/os/ParcelFileDescriptor;

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z

    .line 79
    iput v1, p0, Lcom/miui/server/BackupManagerService;->mCallerFd:I

    .line 80
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/server/BackupManagerService;->mState:I

    .line 634
    new-instance v0, Lcom/miui/server/BackupManagerService$3;

    invoke-direct {v0, p0}, Lcom/miui/server/BackupManagerService$3;-><init>(Lcom/miui/server/BackupManagerService;)V

    iput-object v0, p0, Lcom/miui/server/BackupManagerService;->mPackageStatsObserver:Landroid/content/pm/IPackageStatsObserver;

    .line 89
    iput-object p1, p0, Lcom/miui/server/BackupManagerService;->mContext:Landroid/content/Context;

    .line 90
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 91
    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lcom/miui/server/BackupManagerService;->mActivityManager:Landroid/app/ActivityManager;

    .line 92
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "MiuiBackup"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/miui/server/BackupManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 93
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 94
    new-instance v0, Lcom/miui/server/BackupManagerService$BackupHandler;

    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1, v3}, Lcom/miui/server/BackupManagerService$BackupHandler;-><init>(Lcom/miui/server/BackupManagerService;Landroid/os/Looper;Lcom/miui/server/BackupManagerService$1;)V

    iput-object v0, p0, Lcom/miui/server/BackupManagerService;->mHandler:Landroid/os/Handler;

    .line 95
    return-void
.end method

.method static synthetic access$1000(Lcom/miui/server/BackupManagerService;)Lcom/miui/server/BackupManagerService$DeathLinker;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mDeathLinker:Lcom/miui/server/BackupManagerService$DeathLinker;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/miui/server/BackupManagerService;)Landroid/os/IBinder;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mICaller:Landroid/os/IBinder;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/miui/server/BackupManagerService;Landroid/os/IBinder;)Landroid/os/IBinder;
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;
    .param p1, "x1"    # Landroid/os/IBinder;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/miui/server/BackupManagerService;->mICaller:Landroid/os/IBinder;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/miui/server/BackupManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/miui/server/BackupManagerService;->broadcastServiceIdle()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/server/BackupManagerService;)Landroid/content/pm/PackageManager;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/miui/server/BackupManagerService;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1502(Lcom/miui/server/BackupManagerService;J)J
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;
    .param p1, "x1"    # J

    .prologue
    .line 47
    iput-wide p1, p0, Lcom/miui/server/BackupManagerService;->mCurrentTotalSize:J

    return-wide p1
.end method

.method static synthetic access$200(Lcom/miui/server/BackupManagerService;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mPwd:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/miui/server/BackupManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/miui/server/BackupManagerService;->releaseBackupWriteStream()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/server/BackupManagerService;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/miui/server/BackupManagerService;)Lmiui/app/backup/IPackageBackupRestoreObserver;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    return-object v0
.end method

.method static synthetic access$700(Lcom/miui/server/BackupManagerService;)I
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    iget v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingFeature:I

    return v0
.end method

.method static synthetic access$800(Lcom/miui/server/BackupManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/miui/server/BackupManagerService;->waitForTheLastWorkingTask()V

    return-void
.end method

.method static synthetic access$902(Lcom/miui/server/BackupManagerService;I)I
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/BackupManagerService;
    .param p1, "x1"    # I

    .prologue
    .line 47
    iput p1, p0, Lcom/miui/server/BackupManagerService;->mOwnerPid:I

    return p1
.end method

.method private appHasOwnBackupAgent(Ljava/lang/String;)Z
    .locals 5
    .param p1, "pkg"    # Ljava/lang/String;

    .prologue
    .line 209
    const/4 v1, 0x0

    .line 211
    .local v1, "has":Z
    :try_start_0
    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;

    const/16 v4, 0x40

    invoke-virtual {v3, p1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 212
    .local v2, "info":Landroid/content/pm/PackageInfo;
    iget-object v3, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v3, :cond_0

    .line 213
    const-class v3, Lmiui/app/backup/FullBackupAgent;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->backupAgentName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_0

    .line 214
    const/4 v1, 0x1

    .line 220
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    :cond_0
    :goto_0
    return v1

    .line 217
    :catch_0
    move-exception v0

    .line 218
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method private broadcastServiceIdle()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 469
    monitor-enter p0

    .line 470
    :try_start_0
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mStateObservers:Landroid/os/RemoteCallbackList;

    invoke-virtual {v2}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v0

    .line 471
    .local v0, "cnt":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 472
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mStateObservers:Landroid/os/RemoteCallbackList;

    invoke-virtual {v2, v1}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v2

    check-cast v2, Lmiui/app/backup/IBackupServiceStateObserver;

    invoke-interface {v2}, Lmiui/app/backup/IBackupServiceStateObserver;->onServiceStateIdle()V

    .line 471
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 474
    :cond_0
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mStateObservers:Landroid/os/RemoteCallbackList;

    invoke-virtual {v2}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    .line 475
    monitor-exit p0

    .line 476
    return-void

    .line 475
    .end local v0    # "cnt":I
    .end local v1    # "i":I
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private doFullBackup(Landroid/os/ParcelFileDescriptor;Z[Ljava/lang/String;)V
    .locals 7
    .param p1, "fd"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "includeApk"    # Z
    .param p3, "pkgs"    # [Ljava/lang/String;

    .prologue
    .line 170
    const-string v2, "backup"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    check-cast v0, Landroid/app/backup/IBackupManager;

    .line 171
    .local v0, "bm":Landroid/app/backup/IBackupManager;
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->BackupManagerService_fullBackup:Ljava/lang/reflect/Method;

    if-nez v2, :cond_0

    .line 173
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_2

    .line 174
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "fullBackup"

    const/16 v4, 0x9

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/os/ParcelFileDescriptor;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x7

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-class v6, [Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/server/BackupManagerService;->BackupManagerService_fullBackup:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->BackupManagerService_fullBackup:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_5

    .line 192
    :try_start_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_4

    .line 193
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->BackupManagerService_fullBackup:Ljava/lang/reflect/Method;

    const/16 v3, 0x9

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x7

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/16 v4, 0x8

    aput-object p3, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2

    .line 206
    :cond_1
    :goto_1
    return-void

    .line 178
    :cond_2
    :try_start_2
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_3

    .line 179
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "fullBackup"

    const/4 v4, 0x7

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/os/ParcelFileDescriptor;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-class v6, [Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/server/BackupManagerService;->BackupManagerService_fullBackup:Ljava/lang/reflect/Method;
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 185
    :catch_0
    move-exception v1

    .line 186
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    const-string v2, "Backup:BackupManagerService"

    const-string v3, "Could not find the method fullBackup"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 183
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :cond_3
    :try_start_3
    const-string v2, "Backup:BackupManagerService"

    const-string v3, "unsupported SDK version"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 194
    :cond_4
    :try_start_4
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_1

    .line 195
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->BackupManagerService_fullBackup:Ljava/lang/reflect/Method;

    const/4 v3, 0x7

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    aput-object p3, v3, v4

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_1

    .line 197
    :catch_1
    move-exception v1

    .line 198
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto/16 :goto_1

    .line 199
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v1

    .line 200
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto/16 :goto_1

    .line 203
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_5
    const-string v2, "Backup:BackupManagerService"

    const-string v3, "Error: could not find method fullBackup in BackupManagerService"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1
.end method

.method private enablePackage(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "pkg"    # Ljava/lang/String;
    .param p2, "enable"    # Z

    .prologue
    .line 520
    invoke-direct {p0, p1}, Lcom/miui/server/BackupManagerService;->isApplicationInstalled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 531
    :goto_0
    return-void

    .line 523
    :cond_0
    if-eqz p2, :cond_1

    .line 524
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;

    iget v1, p0, Lcom/miui/server/BackupManagerService;->mPackageLastEnableState:I

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/pm/PackageManager;->setApplicationEnabledSetting(Ljava/lang/String;II)V

    goto :goto_0

    .line 526
    :cond_1
    iget v0, p0, Lcom/miui/server/BackupManagerService;->mPackageLastEnableState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 527
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/server/BackupManagerService;->mPackageLastEnableState:I

    .line 529
    :cond_2
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/pm/PackageManager;->setApplicationEnabledSetting(Ljava/lang/String;II)V

    goto :goto_0
.end method

.method private isApplicationInstalled(Ljava/lang/String;)Z
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 224
    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v1

    .line 225
    .local v1, "installedList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    const/4 v2, 0x0

    .line 226
    .local v2, "isInstalled":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 227
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 228
    const/4 v2, 0x1

    .line 232
    :cond_0
    return v2

    .line 226
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private isApplicationRunning(Ljava/lang/String;)Z
    .locals 9
    .param p1, "pkg"    # Ljava/lang/String;

    .prologue
    .line 236
    const/4 v5, 0x0

    .line 237
    .local v5, "isRunning":Z
    if-eqz p1, :cond_2

    .line 238
    iget-object v8, p0, Lcom/miui/server/BackupManagerService;->mActivityManager:Landroid/app/ActivityManager;

    invoke-virtual {v8}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v4

    .line 239
    .local v4, "infos":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 240
    .local v3, "info":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget-object v8, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    if-eqz v8, :cond_0

    .line 241
    iget-object v0, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v6, :cond_0

    aget-object v7, v0, v2

    .line 242
    .local v7, "runningPkg":Ljava/lang/String;
    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 243
    const/4 v5, 0x1

    .line 244
    goto :goto_0

    .line 241
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 250
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "info":Landroid/app/ActivityManager$RunningAppProcessInfo;
    .end local v4    # "infos":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v6    # "len$":I
    .end local v7    # "runningPkg":Ljava/lang/String;
    :cond_2
    return v5
.end method

.method private static readHeaderLine(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 373
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x50

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 374
    .local v0, "buffer":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .local v1, "c":I
    if-ltz v1, :cond_0

    .line 375
    const/16 v2, 0xa

    if-ne v1, v2, :cond_1

    .line 378
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 376
    :cond_1
    int-to-char v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private releaseBackupWriteStream()V
    .locals 5

    .prologue
    .line 508
    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mBackupReadSide:Landroid/os/ParcelFileDescriptor;

    if-eqz v3, :cond_1

    .line 509
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 510
    .local v0, "b":[B
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mBackupReadSide:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 512
    .local v2, "fis":Ljava/io/FileInputStream;
    :cond_0
    :try_start_0
    invoke-virtual {v2, v0}, Ljava/io/FileInputStream;->read([B)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-gtz v3, :cond_0

    .line 517
    .end local v0    # "b":[B
    .end local v2    # "fis":Ljava/io/FileInputStream;
    :cond_1
    :goto_0
    return-void

    .line 513
    .restart local v0    # "b":[B
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :catch_0
    move-exception v1

    .line 514
    .local v1, "e":Ljava/io/IOException;
    const-string v3, "Backup:BackupManagerService"

    const-string v4, "realeaseBackupReadStream"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private waitForTheLastWorkingTask()V
    .locals 3

    .prologue
    .line 479
    monitor-enter p0

    .line 480
    :try_start_0
    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mBackupReadSide:Landroid/os/ParcelFileDescriptor;

    if-eqz v1, :cond_0

    .line 485
    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/miui/server/BackupManagerService$2;

    invoke-direct {v2, p0}, Lcom/miui/server/BackupManagerService$2;-><init>(Lcom/miui/server/BackupManagerService;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 493
    :cond_0
    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    if-eqz v1, :cond_2

    .line 494
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 495
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_1

    .line 497
    :try_start_2
    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 498
    :catch_0
    move-exception v0

    .line 499
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 502
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1

    .line 504
    :catchall_1
    move-exception v1

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1

    .line 502
    :cond_1
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 504
    :cond_2
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 505
    return-void
.end method


# virtual methods
.method public acquire(Lmiui/app/backup/IBackupServiceStateObserver;Landroid/os/IBinder;)Z
    .locals 3
    .param p1, "stateObserver"    # Lmiui/app/backup/IBackupServiceStateObserver;
    .param p2, "iCaller"    # Landroid/os/IBinder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 433
    if-nez p2, :cond_0

    .line 434
    const-string v1, "Backup:BackupManagerService"

    const-string v2, "caller should not be null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    :goto_0
    return v0

    .line 438
    :cond_0
    monitor-enter p0

    .line 439
    :try_start_0
    iget v1, p0, Lcom/miui/server/BackupManagerService;->mOwnerPid:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 440
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    iput v0, p0, Lcom/miui/server/BackupManagerService;->mOwnerPid:I

    .line 441
    iput-object p2, p0, Lcom/miui/server/BackupManagerService;->mICaller:Landroid/os/IBinder;

    .line 442
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mICaller:Landroid/os/IBinder;

    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mDeathLinker:Lcom/miui/server/BackupManagerService$DeathLinker;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 443
    const/4 v0, 0x1

    monitor-exit p0

    goto :goto_0

    .line 448
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 445
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mStateObservers:Landroid/os/RemoteCallbackList;

    invoke-virtual {v1, p1}, Landroid/os/RemoteCallbackList;->register(Landroid/os/IInterface;)Z

    .line 446
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public addCompletedSize(J)V
    .locals 9
    .param p1, "size"    # J

    .prologue
    .line 327
    iget-wide v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentCompletedSize:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentCompletedSize:J

    .line 328
    iget v0, p0, Lcom/miui/server/BackupManagerService;->mProgType:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    if-eqz v0, :cond_0

    .line 330
    :try_start_0
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    iget v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingFeature:I

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/miui/server/BackupManagerService;->mCurrentCompletedSize:J

    iget-wide v6, p0, Lcom/miui/server/BackupManagerService;->mCurrentTotalSize:J

    invoke-interface/range {v0 .. v7}, Lmiui/app/backup/IPackageBackupRestoreObserver;->onCustomProgressChange(Ljava/lang/String;IIJJ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 336
    :cond_0
    :goto_0
    return-void

    .line 332
    :catch_0
    move-exception v8

    .line 333
    .local v8, "e":Landroid/os/RemoteException;
    invoke-virtual {v8}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method public backupPackage(Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZZLmiui/app/backup/IPackageBackupRestoreObserver;)V
    .locals 6
    .param p1, "outFileDescriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "readSide"    # Landroid/os/ParcelFileDescriptor;
    .param p3, "pkg"    # Ljava/lang/String;
    .param p4, "feature"    # I
    .param p5, "pwd"    # Ljava/lang/String;
    .param p6, "encryptedPwd"    # Ljava/lang/String;
    .param p7, "includeApk"    # Z
    .param p8, "forceBackup"    # Z
    .param p9, "observer"    # Lmiui/app/backup/IPackageBackupRestoreObserver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v1

    .line 103
    .local v1, "pid":I
    iput-object p2, p0, Lcom/miui/server/BackupManagerService;->mBackupReadSide:Landroid/os/ParcelFileDescriptor;

    .line 104
    iget v2, p0, Lcom/miui/server/BackupManagerService;->mOwnerPid:I

    if-eq v1, v2, :cond_0

    .line 105
    const-string v2, "Backup:BackupManagerService"

    const-string v3, "You must acquire first to use the backup or restore service"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    :goto_0
    return-void

    .line 109
    :cond_0
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mICaller:Landroid/os/IBinder;

    if-nez v2, :cond_1

    .line 110
    const-string v2, "Backup:BackupManagerService"

    const-string v3, "Caller is null You must acquire first with a binder"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 114
    :cond_1
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 115
    iput-object p5, p0, Lcom/miui/server/BackupManagerService;->mPwd:Ljava/lang/String;

    .line 116
    iput-object p6, p0, Lcom/miui/server/BackupManagerService;->mEncryptedPwd:Ljava/lang/String;

    .line 119
    :cond_2
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mContext:Landroid/content/Context;

    invoke-static {v2, p3}, Lmiui/app/backup/BackupManager;->isSysAppForBackup(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    .line 120
    .local v0, "isSystemApp":Z
    if-eqz v0, :cond_5

    invoke-direct {p0, p3}, Lcom/miui/server/BackupManagerService;->appHasOwnBackupAgent(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-direct {p0, p3}, Lcom/miui/server/BackupManagerService;->isApplicationRunning(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 121
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z

    .line 126
    :goto_1
    const/4 v2, -0x1

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mPackageLastEnableState:I

    .line 127
    if-nez v0, :cond_3

    .line 128
    const/4 v2, 0x0

    invoke-direct {p0, p3, v2}, Lcom/miui/server/BackupManagerService;->enablePackage(Ljava/lang/String;Z)V

    .line 131
    :cond_3
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v2

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mCallerFd:I

    .line 133
    monitor-enter p0

    .line 134
    :try_start_0
    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v2, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 135
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    iput-object p9, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    .line 137
    iput p4, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingFeature:I

    .line 138
    iput-object p3, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    .line 139
    const/4 v2, 0x0

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mLastError:I

    .line 140
    const/4 v2, 0x0

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mProgType:I

    .line 142
    const/4 v2, 0x1

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mState:I

    .line 144
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentCompletedSize:J

    .line 145
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentTotalSize:J

    .line 146
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mPackageStatsObserver:Landroid/content/pm/IPackageStatsObserver;

    invoke-virtual {v2, p3, v3}, Landroid/content/pm/PackageManager;->getPackageSizeInfo(Ljava/lang/String;Landroid/content/pm/IPackageStatsObserver;)V

    .line 147
    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    monitor-enter v3

    .line 148
    if-nez v0, :cond_6

    const/4 v2, 0x1

    :goto_2
    const/4 v4, 0x1

    :try_start_1
    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p3, v4, v5

    invoke-direct {p0, p1, v2, v4}, Lcom/miui/server/BackupManagerService;->doFullBackup(Landroid/os/ParcelFileDescriptor;Z[Ljava/lang/String;)V

    .line 149
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 150
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 151
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 153
    if-nez v0, :cond_4

    .line 154
    const/4 v2, 0x1

    invoke-direct {p0, p3, v2}, Lcom/miui/server/BackupManagerService;->enablePackage(Ljava/lang/String;Z)V

    .line 157
    :cond_4
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/miui/server/BackupManagerService;->mPwd:Ljava/lang/String;

    .line 158
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/miui/server/BackupManagerService;->mEncryptedPwd:Ljava/lang/String;

    .line 159
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 160
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z

    .line 161
    const/4 v2, -0x1

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mCallerFd:I

    .line 162
    const/4 v2, 0x0

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mProgType:I

    .line 163
    const/4 v2, 0x0

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mState:I

    .line 164
    const/4 v2, -0x1

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mPackageLastEnableState:I

    .line 165
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentTotalSize:J

    .line 166
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentCompletedSize:J

    goto/16 :goto_0

    .line 123
    :cond_5
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z

    goto :goto_1

    .line 135
    :catchall_0
    move-exception v2

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 148
    :cond_6
    const/4 v2, 0x0

    goto :goto_2

    .line 151
    :catchall_1
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2
.end method

.method public errorOccur(I)V
    .locals 3
    .param p1, "err"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 542
    iget v0, p0, Lcom/miui/server/BackupManagerService;->mLastError:I

    if-nez v0, :cond_0

    .line 543
    iput p1, p0, Lcom/miui/server/BackupManagerService;->mLastError:I

    .line 544
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    if-eqz v0, :cond_0

    .line 545
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    iget v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingFeature:I

    invoke-interface {v0, v1, v2, p1}, Lmiui/app/backup/IPackageBackupRestoreObserver;->onError(Ljava/lang/String;II)V

    .line 548
    :cond_0
    return-void
.end method

.method public getCurrentRunningPackage()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 552
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentWorkingFeature()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 557
    iget v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingFeature:I

    return v0
.end method

.method public getState()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 562
    iget v0, p0, Lcom/miui/server/BackupManagerService;->mState:I

    return v0
.end method

.method public isNeedBeKilled(Ljava/lang/String;)Z
    .locals 1
    .param p1, "pkg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 340
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 341
    iget-boolean v0, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z

    .line 343
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isRunningFromMiui(I)Z
    .locals 1
    .param p1, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 355
    iget v0, p0, Lcom/miui/server/BackupManagerService;->mCallerFd:I

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isServiceIdle()Z
    .locals 1

    .prologue
    .line 360
    iget v0, p0, Lcom/miui/server/BackupManagerService;->mState:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onApkInstalled()V
    .locals 2

    .prologue
    .line 535
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    invoke-static {v0, v1}, Lmiui/app/backup/BackupManager;->isSysAppForBackup(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 536
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/miui/server/BackupManagerService;->enablePackage(Ljava/lang/String;Z)V

    .line 538
    :cond_0
    return-void
.end method

.method public readMiuiBackupHeader(Landroid/os/ParcelFileDescriptor;)V
    .locals 7
    .param p1, "inFileDescriptor"    # Landroid/os/ParcelFileDescriptor;

    .prologue
    .line 290
    const/4 v2, 0x0

    .line 292
    .local v2, "in":Ljava/io/InputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 294
    .end local v2    # "in":Ljava/io/InputStream;
    .local v3, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-static {v3}, Lmiui/app/backup/BackupFileResolver;->readMiuiHeader(Ljava/io/InputStream;)Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;

    move-result-object v1

    .line 295
    .local v1, "header":Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;
    if-eqz v1, :cond_0

    iget v5, v1, Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;->version:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    .line 296
    iget-object v5, v1, Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;->packageName:Ljava/lang/String;

    iput-object v5, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    .line 297
    iget v5, v1, Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;->featureId:I

    iput v5, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingFeature:I

    .line 298
    iget-boolean v5, v1, Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;->isEncrypted:Z

    if-eqz v5, :cond_2

    const/4 v5, 0x0

    :goto_0
    iput-object v5, p0, Lcom/miui/server/BackupManagerService;->mEncryptedPwdInBakFile:Ljava/lang/String;

    .line 300
    iget-object v5, p0, Lcom/miui/server/BackupManagerService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    invoke-static {v5, v6}, Lmiui/app/backup/BackupManager;->isSysAppForBackup(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    .line 301
    .local v4, "isSystemApp":Z
    if-eqz v4, :cond_3

    iget-object v5, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/miui/server/BackupManagerService;->appHasOwnBackupAgent(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/miui/server/BackupManagerService;->isApplicationRunning(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 303
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z

    .line 308
    :goto_1
    if-nez v4, :cond_0

    .line 309
    iget-object v5, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-direct {p0, v5, v6}, Lcom/miui/server/BackupManagerService;->enablePackage(Ljava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 315
    .end local v4    # "isSystemApp":Z
    :cond_0
    if-eqz v3, :cond_1

    .line 317
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 323
    :cond_1
    return-void

    .line 298
    :cond_2
    :try_start_3
    iget-object v5, v1, Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;->encryptedPwd:Ljava/lang/String;

    goto :goto_0

    .line 305
    .restart local v4    # "isSystemApp":Z
    :cond_3
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 315
    .end local v1    # "header":Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;
    .end local v4    # "isSystemApp":Z
    :catchall_0
    move-exception v5

    move-object v2, v3

    .end local v3    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :goto_2
    if-eqz v2, :cond_4

    .line 317
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 315
    :cond_4
    throw v5

    .line 318
    :catch_0
    move-exception v0

    .line 319
    .local v0, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 318
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "header":Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;
    .restart local v3    # "in":Ljava/io/InputStream;
    :catch_1
    move-exception v0

    .line 319
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 315
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "header":Lmiui/app/backup/BackupFileResolver$BackupFileMiuiHeader;
    .end local v3    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catchall_1
    move-exception v5

    goto :goto_2
.end method

.method public release(Lmiui/app/backup/IBackupServiceStateObserver;)V
    .locals 2
    .param p1, "stateObserver"    # Lmiui/app/backup/IBackupServiceStateObserver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 453
    monitor-enter p0

    .line 454
    if-eqz p1, :cond_0

    .line 455
    :try_start_0
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    .line 456
    .local v0, "pid":I
    iget v1, p0, Lcom/miui/server/BackupManagerService;->mOwnerPid:I

    if-ne v0, v1, :cond_1

    .line 457
    invoke-direct {p0}, Lcom/miui/server/BackupManagerService;->waitForTheLastWorkingTask()V

    .line 458
    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/server/BackupManagerService;->mOwnerPid:I

    .line 459
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/server/BackupManagerService;->mICaller:Landroid/os/IBinder;

    .line 460
    invoke-direct {p0}, Lcom/miui/server/BackupManagerService;->broadcastServiceIdle()V

    .line 465
    .end local v0    # "pid":I
    :cond_0
    :goto_0
    monitor-exit p0

    .line 466
    return-void

    .line 462
    .restart local v0    # "pid":I
    :cond_1
    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mStateObservers:Landroid/os/RemoteCallbackList;

    invoke-virtual {v1, p1}, Landroid/os/RemoteCallbackList;->unregister(Landroid/os/IInterface;)Z

    goto :goto_0

    .line 465
    .end local v0    # "pid":I
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public restoreFile(Landroid/os/ParcelFileDescriptor;Ljava/lang/String;ZLmiui/app/backup/IPackageBackupRestoreObserver;)V
    .locals 10
    .param p1, "bakFd"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "forceBackup"    # Z
    .param p4, "observer"    # Lmiui/app/backup/IPackageBackupRestoreObserver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    const/4 v7, -0x1

    const/4 v6, 0x0

    .line 386
    invoke-static {}, Lcom/miui/server/BackupManagerService;->getCallingPid()I

    move-result v1

    .line 387
    .local v1, "pid":I
    iget v2, p0, Lcom/miui/server/BackupManagerService;->mOwnerPid:I

    if-eq v1, v2, :cond_0

    .line 388
    const-string v2, "Backup:BackupManagerService"

    const-string v3, "You must acquire first to use the backup or restore service"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    :goto_0
    return-void

    .line 392
    :cond_0
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mICaller:Landroid/os/IBinder;

    if-nez v2, :cond_1

    .line 393
    const-string v2, "Backup:BackupManagerService"

    const-string v3, "Caller is null You must acquire first with a binder"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 397
    :cond_1
    iput-object p2, p0, Lcom/miui/server/BackupManagerService;->mPwd:Ljava/lang/String;

    .line 398
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v2

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mCallerFd:I

    .line 400
    iput v6, p0, Lcom/miui/server/BackupManagerService;->mLastError:I

    .line 401
    iput v6, p0, Lcom/miui/server/BackupManagerService;->mProgType:I

    .line 402
    iput v7, p0, Lcom/miui/server/BackupManagerService;->mPackageLastEnableState:I

    .line 403
    const/4 v2, 0x2

    iput v2, p0, Lcom/miui/server/BackupManagerService;->mState:I

    .line 405
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getStatSize()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentTotalSize:J

    .line 406
    monitor-enter p0

    .line 407
    :try_start_0
    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v2, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 408
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 409
    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    monitor-enter v3

    .line 410
    :try_start_1
    iput-object p4, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    .line 411
    const-string v2, "backup"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    check-cast v0, Landroid/app/backup/IBackupManager;

    .line 412
    .local v0, "bm":Landroid/app/backup/IBackupManager;
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/miui/server/BackupManagerService;->mCurrentCompletedSize:J

    .line 413
    invoke-interface {v0, p1}, Landroid/app/backup/IBackupManager;->fullRestore(Landroid/os/ParcelFileDescriptor;)V

    .line 414
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 415
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 416
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 417
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    invoke-static {v2, v3}, Lmiui/app/backup/BackupManager;->isSysAppForBackup(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 418
    iget-object v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    invoke-direct {p0, v2, v8}, Lcom/miui/server/BackupManagerService;->enablePackage(Ljava/lang/String;Z)V

    .line 420
    :cond_2
    iput-object v9, p0, Lcom/miui/server/BackupManagerService;->mPwd:Ljava/lang/String;

    .line 421
    iput-object v9, p0, Lcom/miui/server/BackupManagerService;->mEncryptedPwd:Ljava/lang/String;

    .line 422
    iput-object v9, p0, Lcom/miui/server/BackupManagerService;->mTaskLatch:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 423
    iput-boolean v8, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z

    .line 424
    iput v7, p0, Lcom/miui/server/BackupManagerService;->mCallerFd:I

    .line 425
    iput v6, p0, Lcom/miui/server/BackupManagerService;->mProgType:I

    .line 426
    iput v6, p0, Lcom/miui/server/BackupManagerService;->mState:I

    .line 427
    iput v7, p0, Lcom/miui/server/BackupManagerService;->mPackageLastEnableState:I

    .line 428
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentTotalSize:J

    goto :goto_0

    .line 408
    .end local v0    # "bm":Landroid/app/backup/IBackupManager;
    :catchall_0
    move-exception v2

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 416
    :catchall_1
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2
.end method

.method public setCustomProgress(III)V
    .locals 8
    .param p1, "progType"    # I
    .param p2, "prog"    # I
    .param p3, "total"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 365
    iput p1, p0, Lcom/miui/server/BackupManagerService;->mProgType:I

    .line 366
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    if-eqz v0, :cond_0

    .line 367
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mBackupRestoreObserver:Lmiui/app/backup/IPackageBackupRestoreObserver;

    iget-object v1, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    iget v2, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingFeature:I

    int-to-long v4, p2

    int-to-long v6, p3

    move v3, p1

    invoke-interface/range {v0 .. v7}, Lmiui/app/backup/IPackageBackupRestoreObserver;->onCustomProgressChange(Ljava/lang/String;IIJJ)V

    .line 369
    :cond_0
    return-void
.end method

.method public setIsNeedBeKilled(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "pkg"    # Ljava/lang/String;
    .param p2, "isNeedBeKilled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 348
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 349
    iput-boolean p2, p0, Lcom/miui/server/BackupManagerService;->mIsNeedBeKilled:Z

    .line 351
    :cond_0
    return-void
.end method

.method public startConfirmationUi(ILjava/lang/String;)V
    .locals 2
    .param p1, "token"    # I
    .param p2, "action"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 255
    iget-object v0, p0, Lcom/miui/server/BackupManagerService;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/miui/server/BackupManagerService$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/server/BackupManagerService$1;-><init>(Lcom/miui/server/BackupManagerService;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 267
    return-void
.end method

.method public writeMiuiBackupHeader(Landroid/os/ParcelFileDescriptor;)V
    .locals 7
    .param p1, "outFileDescriptor"    # Landroid/os/ParcelFileDescriptor;

    .prologue
    .line 271
    const/4 v1, 0x0

    .line 273
    .local v1, "os":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 274
    .end local v1    # "os":Ljava/io/FileOutputStream;
    .local v2, "os":Ljava/io/FileOutputStream;
    :try_start_1
    iget-object v3, p0, Lcom/miui/server/BackupManagerService;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingPkg:Ljava/lang/String;

    iget v5, p0, Lcom/miui/server/BackupManagerService;->mCurrentWorkingFeature:I

    iget-object v6, p0, Lcom/miui/server/BackupManagerService;->mEncryptedPwd:Ljava/lang/String;

    invoke-static {v2, v3, v4, v5, v6}, Lmiui/app/backup/BackupFileResolver;->writeMiuiHeader(Ljava/io/OutputStream;Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 278
    if-eqz v2, :cond_0

    .line 280
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 286
    :cond_0
    return-void

    .line 275
    .end local v2    # "os":Ljava/io/FileOutputStream;
    .restart local v1    # "os":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v0

    .line 276
    .local v0, "e":Ljava/io/IOException;
    :goto_0
    :try_start_3
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 278
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_1
    if-eqz v1, :cond_1

    .line 280
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 278
    :cond_1
    throw v3

    .line 281
    :catch_1
    move-exception v0

    .line 282
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 281
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "os":Ljava/io/FileOutputStream;
    .restart local v2    # "os":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v0

    .line 282
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 278
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "os":Ljava/io/FileOutputStream;
    .restart local v1    # "os":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 275
    .end local v1    # "os":Ljava/io/FileOutputStream;
    .restart local v2    # "os":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v0

    move-object v1, v2

    .end local v2    # "os":Ljava/io/FileOutputStream;
    .restart local v1    # "os":Ljava/io/FileOutputStream;
    goto :goto_0
.end method
