.class public Lcom/android/server/am/BroadcastQueueInjector;
.super Ljava/lang/Object;
.source "BroadcastQueueInjector.java"


# static fields
.field private static final PERCEPTIBLE_APP_ADJ:I = 0x2

.field private static final TAG:Ljava/lang/String; = "BroadcastQueueInjector"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CheckIfBroadcastGenralRistrictApply(II)Z
    .locals 5
    .param p0, "uid"    # I
    .param p1, "pid"    # I

    .prologue
    const/4 v3, 0x0

    .line 18
    const/16 v4, 0x2710

    if-gt p0, v4, :cond_1

    .line 30
    :cond_0
    :goto_0
    return v3

    .line 22
    :cond_1
    invoke-static {p1}, Lcom/android/server/am/ExtraActivityManagerService;->getCurAdjByPid(I)I

    move-result v0

    .line 23
    .local v0, "curAdj":I
    invoke-static {p1}, Lcom/android/server/am/ExtraActivityManagerService;->getProcStateByPid(I)I

    move-result v2

    .line 24
    .local v2, "procState":I
    invoke-static {p1}, Lcom/android/server/am/ExtraActivityManagerService;->hasForegroundActivities(I)Z

    move-result v1

    .line 26
    .local v1, "hasForegroundActivities":Z
    if-nez v1, :cond_0

    const/4 v4, 0x2

    if-gt v0, v4, :cond_2

    const/16 v4, 0x8

    if-ne v2, v4, :cond_0

    .line 30
    :cond_2
    const/4 v3, 0x1

    goto :goto_0
.end method

.method static checkApplicationAutoStart(Lcom/android/server/am/BroadcastQueue;Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/BroadcastRecord;Landroid/content/pm/ResolveInfo;)Z
    .locals 8
    .param p0, "bq"    # Lcom/android/server/am/BroadcastQueue;
    .param p1, "s"    # Lcom/android/server/am/ActivityManagerService;
    .param p2, "r"    # Lcom/android/server/am/BroadcastRecord;
    .param p3, "info"    # Landroid/content/pm/ResolveInfo;

    .prologue
    const/4 v0, 0x1

    const/4 v6, 0x0

    .line 50
    iget-object v1, p3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v1, v1, 0x81

    if-eqz v1, :cond_1

    .line 51
    sget-boolean v1, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    if-nez v1, :cond_0

    .line 52
    const-string v1, "BroadcastQueueInjector"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "System app: \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" started by broadcast "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/android/server/am/BroadcastRecord;->intent:Landroid/content/Intent;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    move v6, v0

    .line 75
    :goto_0
    return v6

    .line 57
    :cond_1
    iget-object v1, p2, Lcom/android/server/am/BroadcastRecord;->intent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_2

    move v6, v0

    .line 58
    goto :goto_0

    .line 61
    :cond_2
    iget-object v1, p1, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    iget-object v2, p3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/miui/AppOpsUtils;->getApplicationAutoStart(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    .line 62
    .local v7, "autoStartMode":I
    if-nez v7, :cond_3

    move v6, v0

    .line 63
    goto :goto_0

    .line 66
    :cond_3
    const-string v0, "BroadcastQueueInjector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to launch app "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for broadcast "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/android/server/am/BroadcastRecord;->intent:Landroid/content/Intent;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": process is not permitted to autostart"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    invoke-virtual {p0, p2}, Lcom/android/server/am/BroadcastQueue;->logBroadcastReceiverDiscardLocked(Lcom/android/server/am/BroadcastRecord;)V

    .line 71
    iget v2, p2, Lcom/android/server/am/BroadcastRecord;->resultCode:I

    iget-object v3, p2, Lcom/android/server/am/BroadcastRecord;->resultData:Ljava/lang/String;

    iget-object v4, p2, Lcom/android/server/am/BroadcastRecord;->resultExtras:Landroid/os/Bundle;

    iget-boolean v5, p2, Lcom/android/server/am/BroadcastRecord;->resultAbort:Z

    move-object v0, p0

    move-object v1, p2

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/am/BroadcastQueue;->finishReceiverLocked(Lcom/android/server/am/BroadcastRecord;ILjava/lang/String;Landroid/os/Bundle;ZZ)Z

    .line 73
    invoke-virtual {p0}, Lcom/android/server/am/BroadcastQueue;->scheduleBroadcastsLocked()V

    .line 74
    iput v6, p2, Lcom/android/server/am/BroadcastRecord;->state:I

    goto :goto_0
.end method

.method static checkReceiverAppDealBroadcast(Lcom/android/server/am/BroadcastQueue;Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/BroadcastRecord;Lcom/android/server/am/ProcessRecord;Z)Z
    .locals 6
    .param p0, "bq"    # Lcom/android/server/am/BroadcastQueue;
    .param p1, "s"    # Lcom/android/server/am/ActivityManagerService;
    .param p2, "r"    # Lcom/android/server/am/BroadcastRecord;
    .param p3, "app"    # Lcom/android/server/am/ProcessRecord;
    .param p4, "isStatic"    # Z

    .prologue
    const/4 v0, 0x1

    .line 34
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    iget-object v1, p2, Lcom/android/server/am/BroadcastRecord;->intent:Landroid/content/Intent;

    if-eqz v1, :cond_0

    iget-object v1, p2, Lcom/android/server/am/BroadcastRecord;->intent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 46
    :cond_0
    :goto_0
    return v0

    .line 37
    :cond_1
    iget v1, p3, Lcom/android/server/am/ProcessRecord;->pid:I

    iget v2, p3, Lcom/android/server/am/ProcessRecord;->uid:I

    iget-object v3, p2, Lcom/android/server/am/BroadcastRecord;->intent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    iget v4, p3, Lcom/android/server/am/ProcessRecord;->uid:I

    iget v5, p3, Lcom/android/server/am/ProcessRecord;->pid:I

    invoke-static {v4, v5}, Lcom/android/server/am/BroadcastQueueInjector;->CheckIfBroadcastGenralRistrictApply(II)Z

    move-result v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/whetstone/client/WhetstoneClientManager;->isBroadcastAllowedLocked(IILjava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 40
    const-string v0, "BroadcastQueueInjector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Skipping "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " becauseofapp "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    iget-boolean v0, p2, Lcom/android/server/am/BroadcastRecord;->ordered:Z

    if-nez v0, :cond_2

    if-eqz p4, :cond_3

    .line 42
    :cond_2
    invoke-virtual {p0, p3}, Lcom/android/server/am/BroadcastQueue;->skipCurrentReceiverLocked(Lcom/android/server/am/ProcessRecord;)V

    .line 44
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method
