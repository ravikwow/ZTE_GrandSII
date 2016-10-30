.class public Lcom/android/server/LocationManagerServiceInjector;
.super Ljava/lang/Object;
.source "LocationManagerServiceInjector.java"


# static fields
.field private static TAG:Ljava/lang/String;

.field private static final sBackupGpsListeners:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/location/IGpsStatusListener;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private static final sBackupReceivers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Lcom/android/server/LocationManagerService$Receiver;",
            ">;"
        }
    .end annotation
.end field

.field private static final sGpsStatusListeners:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/location/IGpsStatusListener;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private static sGpsStatusProviderRef:Landroid/location/IGpsStatusProvider;

.field private static sLocationManagerService:Lcom/android/server/LocationManagerService;

.field private static sLock:Ljava/lang/Object;

.field private static sPolicyListener:Landroid/location/ILocationPolicyListener;

.field private static sPolicyManager:Landroid/location/ILocationPolicyManager;

.field private static sReceivers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Lcom/android/server/LocationManagerService$Receiver;",
            ">;"
        }
    .end annotation
.end field

.field private static sRestrictBackgroundAll:Z

.field private static final sUidRules:Landroid/util/SparseIntArray;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-string v0, "LocationManagerInjector"

    sput-object v0, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    .line 33
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/LocationManagerServiceInjector;->sRestrictBackgroundAll:Z

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    .line 43
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Lcom/android/server/LocationManagerServiceInjector;->sUidRules:Landroid/util/SparseIntArray;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusListeners:Ljava/util/HashMap;

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/server/LocationManagerServiceInjector;->sBackupGpsListeners:Ljava/util/HashMap;

    .line 285
    new-instance v0, Lcom/android/server/LocationManagerServiceInjector$1;

    invoke-direct {v0}, Lcom/android/server/LocationManagerServiceInjector$1;-><init>()V

    sput-object v0, Lcom/android/server/LocationManagerServiceInjector;->sPolicyListener:Landroid/location/ILocationPolicyListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100()Landroid/util/SparseIntArray;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sUidRules:Landroid/util/SparseIntArray;

    return-object v0
.end method

.method static synthetic access$200(II)V
    .locals 0
    .param p0, "x0"    # I
    .param p1, "x1"    # I

    .prologue
    .line 22
    invoke-static {p0, p1}, Lcom/android/server/LocationManagerServiceInjector;->checkCurrentLocationRequest(II)V

    return-void
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 22
    sput-boolean p0, Lcom/android/server/LocationManagerServiceInjector;->sRestrictBackgroundAll:Z

    return p0
.end method

.method public static bindLocationPolicyService(Landroid/location/ILocationPolicyManager;)V
    .locals 2
    .param p0, "policyManager"    # Landroid/location/ILocationPolicyManager;

    .prologue
    .line 64
    sput-object p0, Lcom/android/server/LocationManagerServiceInjector;->sPolicyManager:Landroid/location/ILocationPolicyManager;

    .line 66
    :try_start_0
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sPolicyManager:Landroid/location/ILocationPolicyManager;

    sget-object v1, Lcom/android/server/LocationManagerServiceInjector;->sPolicyListener:Landroid/location/ILocationPolicyListener;

    invoke-interface {v0, v1}, Landroid/location/ILocationPolicyManager;->registerListener(Landroid/location/ILocationPolicyListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static checkCurrentLocationRequest(II)V
    .locals 7
    .param p0, "uid"    # I
    .param p1, "uidRules"    # I

    .prologue
    .line 236
    if-eqz p1, :cond_3

    .line 237
    sget-object v5, Lcom/android/server/LocationManagerServiceInjector;->sLock:Ljava/lang/Object;

    monitor-enter v5

    .line 239
    :try_start_0
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 240
    .local v3, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    if-eqz v3, :cond_2

    .line 241
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v6, "remove gps listener from GpsStatusProvider"

    invoke-static {v4, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 243
    .local v2, "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    if-eqz v4, :cond_0

    .line 245
    :try_start_1
    sget-object v6, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusProviderRef:Landroid/location/IGpsStatusProvider;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/location/IGpsStatusListener;

    invoke-interface {v6, v4}, Landroid/location/IGpsStatusProvider;->removeGpsStatusListener(Landroid/location/IGpsStatusListener;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 246
    :catch_0
    move-exception v0

    .line 247
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v6, "mGpsStatusProvider.removeGpsStatusListener failed"

    invoke-static {v4, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 257
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    .end local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 250
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    :cond_1
    :try_start_3
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v6, "backup gps listener in mBackupGpsListeners"

    invoke-static {v4, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 252
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->sBackupGpsListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-static {p0}, Lcom/android/server/LocationManagerServiceInjector;->removeAndBackupLocationRequestIfNeeded(I)V

    .line 257
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 283
    :goto_1
    return-void

    .line 260
    .end local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    :cond_3
    sget-object v5, Lcom/android/server/LocationManagerServiceInjector;->sLock:Ljava/lang/Object;

    monitor-enter v5

    .line 262
    :try_start_4
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->sBackupGpsListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 263
    .restart local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    if-eqz v3, :cond_6

    .line 264
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v6, "add gps listener to GpsStatusProvider"

    invoke-static {v4, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_4
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 266
    .restart local v2    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v4

    if-eqz v4, :cond_4

    .line 268
    :try_start_5
    sget-object v6, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusProviderRef:Landroid/location/IGpsStatusProvider;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/location/IGpsStatusListener;

    invoke-interface {v6, v4}, Landroid/location/IGpsStatusProvider;->addGpsStatusListener(Landroid/location/IGpsStatusListener;)V
    :try_end_5
    .catch Landroid/os/DeadObjectException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    .line 269
    :catch_1
    move-exception v0

    .line 270
    .local v0, "e":Landroid/os/DeadObjectException;
    :try_start_6
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v6, "listener already dead"

    invoke-static {v4, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 281
    .end local v0    # "e":Landroid/os/DeadObjectException;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    .end local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v4

    .line 272
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    .restart local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    :catch_2
    move-exception v0

    .line 273
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v6, "mGpsStatusProvider.addGpsStatusListener failed"

    invoke-static {v4, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 276
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    :cond_5
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v6, "remove gps listener in mBackupGpsListeners"

    invoke-static {v4, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->sBackupGpsListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_6
    invoke-static {p0}, Lcom/android/server/LocationManagerServiceInjector;->restoreBlockedLocationRequestIfNeeded(I)V

    .line 281
    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_1
.end method

.method public static checkIfRequestBlockedByPolicy(ILjava/lang/String;Landroid/location/IGpsStatusListener;)Z
    .locals 7
    .param p0, "uid"    # I
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/location/IGpsStatusListener;

    .prologue
    const/4 v4, 0x0

    .line 93
    invoke-static {p0}, Lcom/android/server/LocationManagerServiceInjector;->isRequestBlockedByPolicy(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 94
    sget-object v3, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " addGpsStatusListener("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") is blocked by policy"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    const/4 v3, 0x1

    .line 113
    :goto_0
    return v3

    .line 98
    :cond_0
    sget-object v5, Lcom/android/server/LocationManagerServiceInjector;->sLock:Ljava/lang/Object;

    monitor-enter v5

    .line 99
    :try_start_0
    sget-object v3, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 100
    .local v2, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    if-nez v2, :cond_1

    .line 101
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .restart local v2    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 104
    .local v1, "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 105
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/IGpsStatusListener;

    invoke-interface {v3}, Landroid/location/IGpsStatusListener;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-interface {p2}, Landroid/location/IGpsStatusListener;->asBinder()Landroid/os/IBinder;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 107
    monitor-exit v5

    move v3, v4

    goto :goto_0

    .line 110
    .end local v1    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    :cond_3
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    sget-object v3, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    monitor-exit v5

    move v3, v4

    .line 113
    goto :goto_0

    .line 112
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    :catchall_0
    move-exception v3

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public static checkIfRequestBlockedByPolicy(ILjava/lang/String;Landroid/location/LocationRequest;)Z
    .locals 3
    .param p0, "uid"    # I
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "request"    # Landroid/location/LocationRequest;

    .prologue
    .line 84
    invoke-static {p0}, Lcom/android/server/LocationManagerServiceInjector;->isRequestBlockedByPolicy(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/location/LocationRequest;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is blocked by policy"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const/4 v0, 0x1

    .line 88
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static checkWhenRemoveListenerLocked(ILandroid/location/IGpsStatusListener;)Z
    .locals 6
    .param p0, "uid"    # I
    .param p1, "listener"    # Landroid/location/IGpsStatusListener;

    .prologue
    .line 143
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 144
    .local v2, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_4

    .line 145
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .local v3, "tr":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 147
    .local v1, "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    .line 148
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 151
    :cond_1
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/location/IGpsStatusListener;

    invoke-interface {v4}, Landroid/location/IGpsStatusListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-interface {p1}, Landroid/location/IGpsStatusListener;->asBinder()Landroid/os/IBinder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 152
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 155
    .end local v1    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 156
    .restart local v1    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 158
    .end local v1    # "l":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;"
    :cond_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_4

    .line 159
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v3    # "tr":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Landroid/location/IGpsStatusListener;>;>;"
    :cond_4
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->sBackupGpsListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 165
    sget-object v4, Lcom/android/server/LocationManagerServiceInjector;->sBackupGpsListeners:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    const/4 v4, 0x1

    .line 169
    :goto_2
    return v4

    :cond_5
    const/4 v4, 0x0

    goto :goto_2
.end method

.method public static checkWhenRemoveLocationRequestLocked(Landroid/location/ILocationListener;Landroid/app/PendingIntent;)Z
    .locals 5
    .param p0, "listener"    # Landroid/location/ILocationListener;
    .param p1, "intent"    # Landroid/app/PendingIntent;

    .prologue
    .line 119
    if-nez p1, :cond_0

    if-nez p0, :cond_0

    .line 120
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "need either listener or intent"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 121
    :cond_0
    if-eqz p1, :cond_1

    if-eqz p0, :cond_1

    .line 122
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "cannot register both listener and intent"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 123
    :cond_1
    if-eqz p1, :cond_2

    .line 124
    sget-object v3, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/LocationManagerService$Receiver;

    .line 125
    .local v2, "receiver":Lcom/android/server/LocationManagerService$Receiver;
    move-object v1, p1

    .line 133
    :goto_0
    if-eqz v2, :cond_3

    .line 134
    sget-object v3, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const/4 v3, 0x1

    .line 138
    :goto_1
    return v3

    .line 127
    .end local v2    # "receiver":Lcom/android/server/LocationManagerService$Receiver;
    :cond_2
    invoke-interface {p0}, Landroid/location/ILocationListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    .line 128
    .local v0, "binder":Landroid/os/IBinder;
    sget-object v3, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/LocationManagerService$Receiver;

    .line 129
    .restart local v2    # "receiver":Lcom/android/server/LocationManagerService$Receiver;
    move-object v1, v0

    .local v1, "key":Landroid/os/IBinder;
    goto :goto_0

    .line 138
    .end local v0    # "binder":Landroid/os/IBinder;
    .end local v1    # "key":Landroid/os/IBinder;
    :cond_3
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static init(Lcom/android/server/LocationManagerService;Ljava/lang/Object;Ljava/util/HashMap;)V
    .locals 0
    .param p0, "lms"    # Lcom/android/server/LocationManagerService;
    .param p1, "lmsLock"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/LocationManagerService;",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Lcom/android/server/LocationManagerService$Receiver;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p2, "allReceivers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Object;Lcom/android/server/LocationManagerService$Receiver;>;"
    sput-object p1, Lcom/android/server/LocationManagerServiceInjector;->sLock:Ljava/lang/Object;

    .line 55
    sput-object p2, Lcom/android/server/LocationManagerServiceInjector;->sReceivers:Ljava/util/HashMap;

    .line 56
    sput-object p0, Lcom/android/server/LocationManagerServiceInjector;->sLocationManagerService:Lcom/android/server/LocationManagerService;

    .line 57
    return-void
.end method

.method private static isRequestBlockedByPolicy(I)Z
    .locals 5
    .param p0, "uid"    # I

    .prologue
    const/4 v1, 0x0

    .line 73
    sget-object v2, Lcom/android/server/LocationManagerServiceInjector;->sLock:Ljava/lang/Object;

    monitor-enter v2

    .line 74
    :try_start_0
    sget-object v3, Lcom/android/server/LocationManagerServiceInjector;->sUidRules:Landroid/util/SparseIntArray;

    const/4 v4, 0x0

    invoke-virtual {v3, p0, v4}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 75
    .local v0, "rules":I
    if-eqz v0, :cond_0

    .line 76
    const/4 v1, 0x1

    monitor-exit v2

    .line 78
    :goto_0
    return v1

    :cond_0
    monitor-exit v2

    goto :goto_0

    .line 79
    .end local v0    # "rules":I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static removeAndBackupLocationRequestIfNeeded(I)V
    .locals 9
    .param p0, "uid"    # I

    .prologue
    .line 173
    sget-object v6, Lcom/android/server/LocationManagerServiceInjector;->sLock:Ljava/lang/Object;

    monitor-enter v6

    .line 174
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .local v0, "backupList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v5, Lcom/android/server/LocationManagerServiceInjector;->sReceivers:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 176
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Lcom/android/server/LocationManagerService$Receiver;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/LocationManagerService$Receiver;

    .line 177
    .local v4, "r":Lcom/android/server/LocationManagerService$Receiver;
    iget v5, v4, Lcom/android/server/LocationManagerService$Receiver;->mUid:I

    if-ne v5, p0, :cond_0

    .line 178
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 189
    .end local v0    # "backupList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Lcom/android/server/LocationManagerService$Receiver;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "r":Lcom/android/server/LocationManagerService$Receiver;
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 181
    .restart local v0    # "backupList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_2

    .line 182
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 184
    .local v3, "o":Ljava/lang/Object;
    sget-object v7, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "backup receiver:"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v5, Lcom/android/server/LocationManagerServiceInjector;->sReceivers:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/LocationManagerService$Receiver;

    invoke-virtual {v5}, Lcom/android/server/LocationManagerService$Receiver;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    sget-object v5, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    sget-object v7, Lcom/android/server/LocationManagerServiceInjector;->sReceivers:Ljava/util/HashMap;

    invoke-virtual {v7, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v7, Lcom/android/server/LocationManagerServiceInjector;->sLocationManagerService:Lcom/android/server/LocationManagerService;

    sget-object v5, Lcom/android/server/LocationManagerServiceInjector;->sReceivers:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/LocationManagerService$Receiver;

    invoke-virtual {v7, v5}, Lcom/android/server/LocationManagerService;->removeUpdatesLocked(Lcom/android/server/LocationManagerService$Receiver;)V

    goto :goto_1

    .line 189
    .end local v3    # "o":Ljava/lang/Object;
    :cond_2
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 190
    return-void
.end method

.method private static restoreBlockedLocationRequestIfNeeded(I)V
    .locals 14
    .param p0, "uid"    # I

    .prologue
    .line 193
    sget-object v13, Lcom/android/server/LocationManagerServiceInjector;->sLock:Ljava/lang/Object;

    monitor-enter v13

    .line 194
    :try_start_0
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 195
    .local v12, "restoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 196
    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Lcom/android/server/LocationManagerService$Receiver;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/LocationManagerService$Receiver;

    .line 197
    .local v2, "r":Lcom/android/server/LocationManagerService$Receiver;
    iget v0, v2, Lcom/android/server/LocationManagerService$Receiver;->mUid:I

    if-ne v0, p0, :cond_0

    .line 198
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 232
    .end local v2    # "r":Lcom/android/server/LocationManagerService$Receiver;
    .end local v7    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Lcom/android/server/LocationManagerService$Receiver;>;"
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v12    # "restoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v0

    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 201
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v12    # "restoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    :try_start_1
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 202
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .end local v8    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .line 203
    .local v10, "o":Ljava/lang/Object;
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/LocationManagerService$Receiver;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 207
    .restart local v2    # "r":Lcom/android/server/LocationManagerService$Receiver;
    :try_start_2
    iget-object v0, v2, Lcom/android/server/LocationManagerService$Receiver;->mListener:Landroid/location/ILocationListener;

    if-eqz v0, :cond_2

    .line 208
    invoke-virtual {v2}, Lcom/android/server/LocationManagerService$Receiver;->getListener()Landroid/location/ILocationListener;

    move-result-object v0

    invoke-interface {v0}, Landroid/location/ILocationListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 219
    :cond_2
    :try_start_3
    iget-object v0, v2, Lcom/android/server/LocationManagerService$Receiver;->mListener:Landroid/location/ILocationListener;

    if-eqz v0, :cond_3

    .line 220
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "restore receiver:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sReceivers:Ljava/util/HashMap;

    invoke-virtual {v0, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    iget-object v0, v2, Lcom/android/server/LocationManagerService$Receiver;->mUpdateRecords:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 223
    .local v11, "p":Ljava/lang/String;
    iget-object v0, v2, Lcom/android/server/LocationManagerService$Receiver;->mUpdateRecords:Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/LocationManagerService$UpdateRecord;

    iget-object v1, v0, Lcom/android/server/LocationManagerService$UpdateRecord;->mRequest:Landroid/location/LocationRequest;

    .line 224
    .local v1, "lr":Landroid/location/LocationRequest;
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sLocationManagerService:Lcom/android/server/LocationManagerService;

    iget v3, v2, Lcom/android/server/LocationManagerService$Receiver;->mPid:I

    iget v4, v2, Lcom/android/server/LocationManagerService$Receiver;->mUid:I

    iget-object v5, v2, Lcom/android/server/LocationManagerService$Receiver;->mPackageName:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/LocationManagerService;->requestLocationUpdatesLocked(Landroid/location/LocationRequest;Lcom/android/server/LocationManagerService$Receiver;IILjava/lang/String;)V

    goto :goto_2

    .line 210
    .end local v1    # "lr":Landroid/location/LocationRequest;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v11    # "p":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 212
    .local v6, "e":Landroid/os/DeadObjectException;
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 214
    .end local v6    # "e":Landroid/os/DeadObjectException;
    :catch_1
    move-exception v6

    .line 215
    .local v6, "e":Landroid/os/RemoteException;
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v3, "linkToDeath failed:"

    invoke-static {v0, v3, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 229
    .end local v6    # "e":Landroid/os/RemoteException;
    :cond_3
    sget-object v0, Lcom/android/server/LocationManagerServiceInjector;->sBackupReceivers:Ljava/util/HashMap;

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 232
    .end local v2    # "r":Lcom/android/server/LocationManagerService$Receiver;
    .end local v10    # "o":Ljava/lang/Object;
    :cond_4
    monitor-exit v13
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 233
    return-void
.end method

.method public static updateGpsStatusProvider(Landroid/location/IGpsStatusProvider;)V
    .locals 0
    .param p0, "gpsStatusProvider"    # Landroid/location/IGpsStatusProvider;

    .prologue
    .line 60
    sput-object p0, Lcom/android/server/LocationManagerServiceInjector;->sGpsStatusProviderRef:Landroid/location/IGpsStatusProvider;

    .line 61
    return-void
.end method
