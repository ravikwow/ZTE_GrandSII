.class public Lcom/android/server/power/PowerManagerServiceInjector;
.super Ljava/lang/Object;
.source "PowerManagerServiceInjector.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final FOREGROUND_APP_ADJ:I = 0x0

.field private static final PERCEPTIBLE_APP_ADJ:I = 0x2

.field private static final TAG:Ljava/lang/String; = "PowerManagerServiceInjector"

.field private static sBatteryService:Lcom/android/server/BatteryService;

.field private static sDisplayPowerRequest:Lcom/android/server/power/DisplayPowerRequest;

.field private static sLock:Ljava/lang/Object;

.field private static sPowerManagerService:Lcom/android/server/power/PowerManagerService;

.field private static sWakeLocks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/power/PowerManagerService$WakeLock;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkUserActivityTimeoutLocked(I)V
    .locals 12
    .param p0, "stayOnWhilePluggedInSetting"    # I

    .prologue
    .line 63
    invoke-static {}, Lcom/android/server/power/PowerManagerServiceInjector;->isProximitySensorInUse()Z

    move-result v9

    if-nez v9, :cond_0

    invoke-static {p0}, Lcom/android/server/power/PowerManagerServiceInjector;->isStayonWhilePluggedIn(I)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 106
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    const/4 v1, 0x0

    .line 69
    .local v1, "foregroundScreenWakeLock":I
    sget-object v9, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    if-eqz v9, :cond_5

    .line 70
    sget-object v9, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/power/PowerManagerService$WakeLock;

    .line 71
    .local v7, "wakeLock":Lcom/android/server/power/PowerManagerService$WakeLock;
    iget v9, v7, Lcom/android/server/power/PowerManagerService$WakeLock;->mFlags:I

    const v10, 0xffff

    and-int v8, v9, v10

    .line 72
    .local v8, "wakeLockType":I
    sparse-switch v8, :sswitch_data_0

    goto :goto_1

    .line 77
    :sswitch_0
    const-string v9, "PowerManagerServiceInjector"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "wakeLock held when timeout:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v7, Lcom/android/server/power/PowerManagerService$WakeLock;->mPackageName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v7, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerUid:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "]\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Lcom/android/server/power/PowerManagerService$WakeLock;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const/4 v9, 0x1

    if-eq v8, v9, :cond_2

    .line 80
    iget v9, v7, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerUid:I

    const/16 v10, 0x3e8

    if-ne v9, v10, :cond_3

    iget-object v9, v7, Lcom/android/server/power/PowerManagerService$WakeLock;->mPackageName:Ljava/lang/String;

    const-string v10, "android"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 82
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 87
    :cond_3
    iget v9, v7, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerPid:I

    invoke-static {v9}, Lcom/android/server/am/ExtraActivityManagerService;->getCurAdjByPid(I)I

    move-result v0

    .line 88
    .local v0, "curAdj":I
    iget v9, v7, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerPid:I

    invoke-static {v9}, Lcom/android/server/am/ExtraActivityManagerService;->getProcStateByPid(I)I

    move-result v6

    .line 89
    .local v6, "procState":I
    iget v9, v7, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerPid:I

    invoke-static {v9}, Lcom/android/server/am/ExtraActivityManagerService;->hasForegroundActivities(I)Z

    move-result v2

    .line 90
    .local v2, "hasForegroundActivities":Z
    if-nez v2, :cond_4

    if-gtz v0, :cond_2

    const/16 v9, 0x8

    if-eq v6, v9, :cond_2

    .line 91
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 101
    .end local v0    # "curAdj":I
    .end local v2    # "hasForegroundActivities":Z
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v6    # "procState":I
    .end local v7    # "wakeLock":Lcom/android/server/power/PowerManagerService$WakeLock;
    .end local v8    # "wakeLockType":I
    :cond_5
    if-nez v1, :cond_0

    .line 102
    const-string v9, "PowerManagerServiceInjector"

    const-string v10, "screen timeout, anyway, goto sleep"

    invoke-static {v9, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 104
    .local v4, "now":J
    sget-object v9, Lcom/android/server/power/PowerManagerServiceInjector;->sPowerManagerService:Lcom/android/server/power/PowerManagerService;

    const/4 v10, 0x2

    invoke-virtual {v9, v4, v5, v10}, Lcom/android/server/power/PowerManagerService;->goToSleepNoUpdateLocked(JI)Z

    goto/16 :goto_0

    .line 72
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x6 -> :sswitch_0
        0xa -> :sswitch_0
        0x1a -> :sswitch_0
    .end sparse-switch
.end method

.method public static checkWakelockBlocked(Ljava/lang/String;Landroid/os/WorkSource;I)Z
    .locals 9
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "ws"    # Landroid/os/WorkSource;
    .param p2, "uid"    # I

    .prologue
    const/4 v8, 0x1

    .line 226
    invoke-static {}, Lcom/miui/whetstone/PowerKeeperPolicy;->getInstance()Lcom/miui/whetstone/PowerKeeperPolicy;

    move-result-object v3

    .line 228
    .local v3, "powerKeeperPolicy":Lcom/miui/whetstone/PowerKeeperPolicy;
    :try_start_0
    invoke-virtual {v3, p2}, Lcom/miui/whetstone/PowerKeeperPolicy;->checkWakelockBlocked(I)Z

    move-result v4

    .line 229
    .local v4, "ret":Z
    if-ne v4, v8, :cond_0

    .line 230
    const-string v5, "PowerManagerServiceInjector"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "wakelock blocked: tag = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uid = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    :cond_0
    if-nez v4, :cond_1

    if-eqz p1, :cond_1

    .line 233
    invoke-virtual {p1}, Landroid/os/WorkSource;->size()I

    move-result v0

    .line 234
    .local v0, "N":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 235
    invoke-virtual {p1, v2}, Landroid/os/WorkSource;->get(I)I

    move-result v5

    invoke-virtual {v3, p0, v5}, Lcom/miui/whetstone/PowerKeeperPolicy;->checkWakelockBlocked(Ljava/lang/String;I)Z

    move-result v4

    .line 236
    if-ne v4, v8, :cond_2

    .line 237
    const-string v5, "PowerManagerServiceInjector"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "wakelock blocked: tag = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", ws = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Landroid/os/WorkSource;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uid = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    .end local v0    # "N":I
    .end local v2    # "i":I
    .end local v4    # "ret":Z
    :cond_1
    :goto_1
    return v4

    .line 234
    .restart local v0    # "N":I
    .restart local v2    # "i":I
    .restart local v4    # "ret":Z
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 242
    .end local v0    # "N":I
    .end local v2    # "i":I
    .end local v4    # "ret":Z
    :catch_0
    move-exception v1

    .line 243
    .local v1, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public static checkWakelockBlockedEnabled()Z
    .locals 3

    .prologue
    .line 250
    invoke-static {}, Lcom/miui/whetstone/PowerKeeperPolicy;->getInstance()Lcom/miui/whetstone/PowerKeeperPolicy;

    move-result-object v1

    .line 252
    .local v1, "powerKeeperPolicy":Lcom/miui/whetstone/PowerKeeperPolicy;
    :try_start_0
    invoke-virtual {v1}, Lcom/miui/whetstone/PowerKeeperPolicy;->checkWakelockBlockedEnabled()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 256
    :goto_0
    return v2

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static checkWhenSleepRequestedLocked(I)V
    .locals 5
    .param p0, "reason"    # I

    .prologue
    .line 110
    sget-object v2, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 111
    const-string v2, "PowerManagerServiceInjector"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "wakeLock held when sleep request ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p0}, Lcom/android/server/power/PowerManagerServiceInjector;->getReasonName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    sget-object v2, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/power/PowerManagerService$WakeLock;

    .line 113
    .local v1, "wakeLock":Lcom/android/server/power/PowerManagerService$WakeLock;
    iget v2, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mFlags:I

    const v3, 0xffff

    and-int/2addr v2, v3

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    .line 118
    :sswitch_0
    const-string v2, "PowerManagerServiceInjector"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mPackageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerUid:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/android/server/power/PowerManagerService$WakeLock;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 125
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "wakeLock":Lcom/android/server/power/PowerManagerService$WakeLock;
    :cond_0
    return-void

    .line 113
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x6 -> :sswitch_0
        0xa -> :sswitch_0
        0x1a -> :sswitch_0
    .end sparse-switch
.end method

.method static checkWorkSourceUid(ILcom/android/server/power/PowerManagerService$WakeLock;)Z
    .locals 5
    .param p0, "uid"    # I
    .param p1, "wl"    # Lcom/android/server/power/PowerManagerService$WakeLock;

    .prologue
    const/4 v2, 0x0

    .line 211
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    :try_start_0
    iget-object v3, p1, Lcom/android/server/power/PowerManagerService$WakeLock;->mWorkSource:Landroid/os/WorkSource;

    invoke-virtual {v3}, Landroid/os/WorkSource;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 212
    iget-object v3, p1, Lcom/android/server/power/PowerManagerService$WakeLock;->mWorkSource:Landroid/os/WorkSource;

    invoke-virtual {v3, v1}, Landroid/os/WorkSource;->get(I)I

    move-result v3

    if-ne p0, v3, :cond_1

    .line 213
    const-string v3, "PowerManagerServiceInjector"

    const-string v4, "WS uid matched"

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    const/4 v2, 0x1

    .line 221
    :cond_0
    :goto_1
    return v2

    .line 211
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 218
    :catch_0
    move-exception v0

    .line 219
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_1
.end method

.method public static getPartialWakeLockHoldByUid(I)I
    .locals 8
    .param p0, "uid"    # I

    .prologue
    const/4 v2, 0x0

    .line 141
    sget-object v6, Lcom/android/server/power/PowerManagerServiceInjector;->sLock:Ljava/lang/Object;

    monitor-enter v6

    .line 142
    :try_start_0
    sget-object v5, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    if-eqz v5, :cond_3

    sget-object v5, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_3

    .line 143
    const/4 v2, 0x0

    .line 144
    .local v2, "wakeLockNum":I
    sget-object v5, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/power/PowerManagerService$WakeLock;

    .line 145
    .local v1, "wakeLock":Lcom/android/server/power/PowerManagerService$WakeLock;
    iget-object v4, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mWorkSource:Landroid/os/WorkSource;

    .line 146
    .local v4, "ws":Landroid/os/WorkSource;
    iget v5, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerUid:I

    if-eq v5, p0, :cond_1

    if-eqz v4, :cond_1

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/os/WorkSource;->get(I)I

    move-result v5

    if-ne v5, p0, :cond_0

    .line 149
    :cond_1
    iget v5, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mFlags:I

    const v7, 0xffff

    and-int v3, v5, v7

    .line 150
    .local v3, "wakeLockType":I
    const/4 v5, 0x1

    if-ne v3, v5, :cond_0

    .line 151
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 154
    .end local v1    # "wakeLock":Lcom/android/server/power/PowerManagerService$WakeLock;
    .end local v3    # "wakeLockType":I
    .end local v4    # "ws":Landroid/os/WorkSource;
    :cond_2
    monitor-exit v6

    .line 156
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "wakeLockNum":I
    :goto_1
    return v2

    :cond_3
    monitor-exit v6

    goto :goto_1

    .line 157
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method

.method private static getReasonName(I)Ljava/lang/String;
    .locals 1
    .param p0, "reason"    # I

    .prologue
    .line 128
    packed-switch p0, :pswitch_data_0

    .line 136
    const-string v0, "unknown reason"

    :goto_0
    return-object v0

    .line 130
    :pswitch_0
    const-string v0, "device administration policy"

    goto :goto_0

    .line 132
    :pswitch_1
    const-string v0, "screen timeout"

    goto :goto_0

    .line 134
    :pswitch_2
    const-string v0, "user request"

    goto :goto_0

    .line 128
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getScreenWakeLockHoldByUid(I)I
    .locals 8
    .param p0, "uid"    # I

    .prologue
    const/4 v2, 0x0

    .line 161
    sget-object v6, Lcom/android/server/power/PowerManagerServiceInjector;->sLock:Ljava/lang/Object;

    monitor-enter v6

    .line 162
    :try_start_0
    sget-object v5, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    if-eqz v5, :cond_3

    sget-object v5, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_3

    .line 163
    const/4 v2, 0x0

    .line 164
    .local v2, "wakeLockNum":I
    sget-object v5, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/power/PowerManagerService$WakeLock;

    .line 165
    .local v1, "wakeLock":Lcom/android/server/power/PowerManagerService$WakeLock;
    iget-object v4, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mWorkSource:Landroid/os/WorkSource;

    .line 166
    .local v4, "ws":Landroid/os/WorkSource;
    iget v5, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerUid:I

    if-eq v5, p0, :cond_1

    if-eqz v4, :cond_1

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/os/WorkSource;->get(I)I

    move-result v5

    if-ne v5, p0, :cond_0

    .line 169
    :cond_1
    iget v5, v1, Lcom/android/server/power/PowerManagerService$WakeLock;->mFlags:I

    const v7, 0xffff

    and-int v3, v5, v7

    .line 170
    .local v3, "wakeLockType":I
    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 174
    :sswitch_0
    add-int/lit8 v2, v2, 0x1

    .line 175
    goto :goto_0

    .line 180
    .end local v1    # "wakeLock":Lcom/android/server/power/PowerManagerService$WakeLock;
    .end local v3    # "wakeLockType":I
    .end local v4    # "ws":Landroid/os/WorkSource;
    :cond_2
    monitor-exit v6

    .line 182
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "wakeLockNum":I
    :goto_1
    return v2

    :cond_3
    monitor-exit v6

    goto :goto_1

    .line 183
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 170
    nop

    :sswitch_data_0
    .sparse-switch
        0x6 -> :sswitch_0
        0xa -> :sswitch_0
        0x1a -> :sswitch_0
    .end sparse-switch
.end method

.method public static init(Lcom/android/server/power/PowerManagerService;Lcom/android/server/BatteryService;Lcom/android/server/power/DisplayPowerRequest;Ljava/util/ArrayList;Ljava/lang/Object;)V
    .locals 0
    .param p0, "powerManagerService"    # Lcom/android/server/power/PowerManagerService;
    .param p1, "batteryService"    # Lcom/android/server/BatteryService;
    .param p2, "displayPowerRequest"    # Lcom/android/server/power/DisplayPowerRequest;
    .param p4, "lock"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/power/PowerManagerService;",
            "Lcom/android/server/BatteryService;",
            "Lcom/android/server/power/DisplayPowerRequest;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/power/PowerManagerService$WakeLock;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p3, "allWakeLocks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/power/PowerManagerService$WakeLock;>;"
    sput-object p0, Lcom/android/server/power/PowerManagerServiceInjector;->sPowerManagerService:Lcom/android/server/power/PowerManagerService;

    .line 36
    sput-object p1, Lcom/android/server/power/PowerManagerServiceInjector;->sBatteryService:Lcom/android/server/BatteryService;

    .line 37
    sput-object p2, Lcom/android/server/power/PowerManagerServiceInjector;->sDisplayPowerRequest:Lcom/android/server/power/DisplayPowerRequest;

    .line 38
    sput-object p3, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    .line 39
    sput-object p4, Lcom/android/server/power/PowerManagerServiceInjector;->sLock:Ljava/lang/Object;

    .line 40
    return-void
.end method

.method private static isProximitySensorInUse()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 43
    sget-object v1, Lcom/android/server/power/PowerManagerServiceInjector;->sDisplayPowerRequest:Lcom/android/server/power/DisplayPowerRequest;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/server/power/PowerManagerServiceInjector;->sDisplayPowerRequest:Lcom/android/server/power/DisplayPowerRequest;

    iget-boolean v1, v1, Lcom/android/server/power/DisplayPowerRequest;->useProximitySensor:Z

    if-ne v1, v0, :cond_0

    .line 45
    const-string v1, "PowerManagerServiceInjector"

    const-string v2, "useProximitySensor is true"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isStayonWhilePluggedIn(I)Z
    .locals 2
    .param p0, "stayOnWhilePluggedInSetting"    # I

    .prologue
    const/4 v0, 0x0

    .line 52
    sget-object v1, Lcom/android/server/power/PowerManagerServiceInjector;->sBatteryService:Lcom/android/server/BatteryService;

    if-eqz v1, :cond_0

    .line 53
    if-eqz p0, :cond_0

    sget-object v1, Lcom/android/server/power/PowerManagerServiceInjector;->sBatteryService:Lcom/android/server/BatteryService;

    invoke-virtual {v1, p0}, Lcom/android/server/BatteryService;->isPowered(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 56
    :cond_0
    return v0
.end method

.method public static releaseWakeLockHoldByUid(I)V
    .locals 7
    .param p0, "uid"    # I

    .prologue
    const/16 v6, 0x3e8

    .line 187
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    .line 188
    .local v0, "callerUid":I
    if-eq v0, v6, :cond_1

    .line 207
    :cond_0
    return-void

    .line 189
    :cond_1
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    sget-object v3, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 190
    sget-object v3, Lcom/android/server/power/PowerManagerServiceInjector;->sWakeLocks:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/power/PowerManagerService$WakeLock;

    .line 191
    .local v2, "wl":Lcom/android/server/power/PowerManagerService$WakeLock;
    if-eqz v2, :cond_2

    .line 192
    iget-object v3, v2, Lcom/android/server/power/PowerManagerService$WakeLock;->mTag:Ljava/lang/String;

    const-string v4, "*sync*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget v3, v2, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerUid:I

    if-ne v3, v6, :cond_3

    .line 193
    sget-object v3, Lcom/android/server/power/PowerManagerServiceInjector;->sPowerManagerService:Lcom/android/server/power/PowerManagerService;

    iget-object v4, v2, Lcom/android/server/power/PowerManagerService$WakeLock;->mLock:Landroid/os/IBinder;

    iget v5, v2, Lcom/android/server/power/PowerManagerService$WakeLock;->mFlags:I

    invoke-virtual {v3, v4, v5}, Lcom/android/server/power/PowerManagerService;->releaseWakeLockInternal(Landroid/os/IBinder;I)V

    .line 194
    add-int/lit8 v1, v1, -0x1

    .line 195
    const-string v3, "PowerManagerServiceInjector"

    const-string v4, "Internally releasing the wakelockacquired by SyncManager"

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 200
    :cond_3
    iget v3, v2, Lcom/android/server/power/PowerManagerService$WakeLock;->mOwnerUid:I

    if-eq v3, p0, :cond_4

    invoke-static {p0, v2}, Lcom/android/server/power/PowerManagerServiceInjector;->checkWorkSourceUid(ILcom/android/server/power/PowerManagerService$WakeLock;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 201
    :cond_4
    sget-object v3, Lcom/android/server/power/PowerManagerServiceInjector;->sPowerManagerService:Lcom/android/server/power/PowerManagerService;

    iget-object v4, v2, Lcom/android/server/power/PowerManagerService$WakeLock;->mLock:Landroid/os/IBinder;

    iget v5, v2, Lcom/android/server/power/PowerManagerService$WakeLock;->mFlags:I

    invoke-virtual {v3, v4, v5}, Lcom/android/server/power/PowerManagerService;->releaseWakeLockInternal(Landroid/os/IBinder;I)V

    .line 202
    add-int/lit8 v1, v1, -0x1

    .line 203
    const-string v3, "PowerManagerServiceInjector"

    const-string v4, "Internally releasing it"

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
