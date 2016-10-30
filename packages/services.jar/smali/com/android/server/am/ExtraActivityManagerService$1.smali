.class final Lcom/android/server/am/ExtraActivityManagerService$1;
.super Landroid/database/ContentObserver;
.source "ExtraActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ExtraActivityManagerService;->initScreenPaperMode(Lcom/android/server/am/ActivityManagerService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$service:Lcom/android/server/am/ActivityManagerService;


# direct methods
.method constructor <init>(Landroid/os/Handler;Lcom/android/server/am/ActivityManagerService;Landroid/content/Context;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Handler;

    .prologue
    .line 199
    iput-object p2, p0, Lcom/android/server/am/ExtraActivityManagerService$1;->val$service:Lcom/android/server/am/ActivityManagerService;

    iput-object p3, p0, Lcom/android/server/am/ExtraActivityManagerService$1;->val$context:Landroid/content/Context;

    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 4
    .param p1, "selfChange"    # Z

    .prologue
    .line 202
    iget-object v1, p0, Lcom/android/server/am/ExtraActivityManagerService$1;->val$service:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    .line 203
    :try_start_0
    iget-object v0, p0, Lcom/android/server/am/ExtraActivityManagerService$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "screen_paper_mode_enabled"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/provider/SystemSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    # setter for: Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeEnabled:Z
    invoke-static {v0}, Lcom/android/server/am/ExtraActivityManagerService;->access$002(Z)Z

    .line 207
    invoke-static {}, Lcom/android/server/am/ExtraActivityManagerService;->updateScreenPaperMode()V

    .line 208
    monitor-exit v1

    .line 209
    return-void

    .line 208
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
