.class Lcom/android/server/LocationPolicyManagerService$6;
.super Landroid/content/BroadcastReceiver;
.source "LocationPolicyManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/LocationPolicyManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/LocationPolicyManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/LocationPolicyManagerService;)V
    .locals 0

    .prologue
    .line 377
    iput-object p1, p0, Lcom/android/server/LocationPolicyManagerService$6;->this$0:Lcom/android/server/LocationPolicyManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 380
    const-string v1, "LocationPolicy"

    const-string v2, "location mode changed"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 382
    .local v0, "cr":Landroid/content/ContentResolver;
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$6;->this$0:Lcom/android/server/LocationPolicyManagerService;

    const-string v2, "location_mode"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    # setter for: Lcom/android/server/LocationPolicyManagerService;->mLocationMode:I
    invoke-static {v1, v2}, Lcom/android/server/LocationPolicyManagerService;->access$1102(Lcom/android/server/LocationPolicyManagerService;I)I

    .line 383
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$6;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # getter for: Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$000(Lcom/android/server/LocationPolicyManagerService;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 384
    :try_start_0
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$6;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # invokes: Lcom/android/server/LocationPolicyManagerService;->updateLocationModeChangeLocked()V
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$1200(Lcom/android/server/LocationPolicyManagerService;)V

    .line 385
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$6;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # invokes: Lcom/android/server/LocationPolicyManagerService;->updateLocationRulesLocked()V
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$1300(Lcom/android/server/LocationPolicyManagerService;)V

    .line 386
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService$6;->this$0:Lcom/android/server/LocationPolicyManagerService;

    # invokes: Lcom/android/server/LocationPolicyManagerService;->updateNotificationsLocked()V
    invoke-static {v1}, Lcom/android/server/LocationPolicyManagerService;->access$1400(Lcom/android/server/LocationPolicyManagerService;)V

    .line 387
    monitor-exit v2

    .line 388
    return-void

    .line 387
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
