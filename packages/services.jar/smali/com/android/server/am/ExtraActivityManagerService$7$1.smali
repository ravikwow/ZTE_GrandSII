.class Lcom/android/server/am/ExtraActivityManagerService$7$1;
.super Ljava/lang/Thread;
.source "ExtraActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ExtraActivityManagerService$7;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/am/ExtraActivityManagerService$7;


# direct methods
.method constructor <init>(Lcom/android/server/am/ExtraActivityManagerService$7;)V
    .locals 0

    .prologue
    .line 643
    iput-object p1, p0, Lcom/android/server/am/ExtraActivityManagerService$7$1;->this$0:Lcom/android/server/am/ExtraActivityManagerService$7;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 646
    const/4 v1, 0x0

    .line 647
    .local v1, "currentPackageName":Ljava/lang/String;
    iget-object v5, p0, Lcom/android/server/am/ExtraActivityManagerService$7$1;->this$0:Lcom/android/server/am/ExtraActivityManagerService$7;

    iget-object v6, v5, Lcom/android/server/am/ExtraActivityManagerService$7;->val$service:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v6

    .line 648
    :try_start_0
    iget-object v5, p0, Lcom/android/server/am/ExtraActivityManagerService$7$1;->this$0:Lcom/android/server/am/ExtraActivityManagerService$7;

    iget-object v5, v5, Lcom/android/server/am/ExtraActivityManagerService$7;->val$service:Lcom/android/server/am/ActivityManagerService;

    iget-object v5, v5, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/IActivityStackSupervisor;

    invoke-virtual {v5}, Lcom/android/server/am/IActivityStackSupervisor;->topRunningActivityLocked()Lcom/android/server/am/ActivityRecord;

    move-result-object v4

    .line 649
    .local v4, "topRecord":Lcom/android/server/am/ActivityRecord;
    if-eqz v4, :cond_0

    iget-boolean v5, v4, Lcom/android/server/am/ActivityRecord;->finishing:Z

    if-nez v5, :cond_0

    sget-object v5, Lcom/android/server/am/ExtraActivityManagerService;->sMonitorPrivacyPackage:Ljava/util/HashSet;

    iget-object v7, v4, Lcom/android/server/am/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 651
    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/android/server/am/ActivityRecord;->forceNewConfig:Z

    .line 652
    iget-object v1, v4, Lcom/android/server/am/ActivityRecord;->packageName:Ljava/lang/String;

    .line 653
    iget-object v5, p0, Lcom/android/server/am/ExtraActivityManagerService$7$1;->this$0:Lcom/android/server/am/ExtraActivityManagerService$7;

    iget-object v5, v5, Lcom/android/server/am/ExtraActivityManagerService$7;->val$service:Lcom/android/server/am/ActivityManagerService;

    iget-object v7, p0, Lcom/android/server/am/ExtraActivityManagerService$7$1;->this$0:Lcom/android/server/am/ExtraActivityManagerService$7;

    iget-object v7, v7, Lcom/android/server/am/ExtraActivityManagerService$7;->val$service:Lcom/android/server/am/ActivityManagerService;

    iget-object v7, v7, Lcom/android/server/am/ActivityManagerService;->mConfiguration:Landroid/content/res/Configuration;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v5, v7, v4, v8, v9}, Lcom/android/server/am/ActivityManagerService;->updateConfigurationLocked(Landroid/content/res/Configuration;Lcom/android/server/am/ActivityRecord;ZZ)Z

    .line 655
    :cond_0
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 656
    iget-object v5, p0, Lcom/android/server/am/ExtraActivityManagerService$7$1;->this$0:Lcom/android/server/am/ExtraActivityManagerService$7;

    iget-object v5, v5, Lcom/android/server/am/ExtraActivityManagerService$7;->val$service:Lcom/android/server/am/ActivityManagerService;

    iget-object v5, v5, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    const-string v6, "activity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 657
    .local v0, "am":Landroid/app/ActivityManager;
    sget-object v5, Lcom/android/server/am/ExtraActivityManagerService;->sMonitorPrivacyPackage:Ljava/util/HashSet;

    invoke-virtual {v5}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 658
    .local v3, "packageName":Ljava/lang/String;
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 659
    invoke-virtual {v0, v3}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V

    goto :goto_0

    .line 655
    .end local v0    # "am":Landroid/app/ActivityManager;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v4    # "topRecord":Lcom/android/server/am/ActivityRecord;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 662
    .restart local v0    # "am":Landroid/app/ActivityManager;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "topRecord":Lcom/android/server/am/ActivityRecord;
    :cond_2
    return-void
.end method
