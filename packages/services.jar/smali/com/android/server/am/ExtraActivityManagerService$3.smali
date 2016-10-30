.class final Lcom/android/server/am/ExtraActivityManagerService$3;
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
    .line 247
    iput-object p2, p0, Lcom/android/server/am/ExtraActivityManagerService$3;->val$service:Lcom/android/server/am/ActivityManagerService;

    iput-object p3, p0, Lcom/android/server/am/ExtraActivityManagerService$3;->val$context:Landroid/content/Context;

    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 2
    .param p1, "selfChange"    # Z

    .prologue
    .line 250
    iget-object v1, p0, Lcom/android/server/am/ExtraActivityManagerService$3;->val$service:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    .line 251
    :try_start_0
    iget-object v0, p0, Lcom/android/server/am/ExtraActivityManagerService$3;->val$context:Landroid/content/Context;

    invoke-static {v0}, Landroid/provider/MiuiSettings$System;->getScreenPaperModePkgList(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v0

    # setter for: Lcom/android/server/am/ExtraActivityManagerService;->sPkg2PaperMode:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/android/server/am/ExtraActivityManagerService;->access$202(Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 252
    monitor-exit v1

    .line 253
    return-void

    .line 252
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
