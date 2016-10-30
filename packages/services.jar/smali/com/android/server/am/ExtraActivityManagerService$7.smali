.class final Lcom/android/server/am/ExtraActivityManagerService$7;
.super Landroid/content/BroadcastReceiver;
.source "ExtraActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ExtraActivityManagerService;->monitorPrivacyModeChange(Lcom/android/server/am/ActivityManagerService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$service:Lcom/android/server/am/ActivityManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityManagerService;)V
    .locals 0

    .prologue
    .line 640
    iput-object p1, p0, Lcom/android/server/am/ExtraActivityManagerService$7;->val$service:Lcom/android/server/am/ActivityManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 643
    new-instance v0, Lcom/android/server/am/ExtraActivityManagerService$7$1;

    invoke-direct {v0, p0}, Lcom/android/server/am/ExtraActivityManagerService$7$1;-><init>(Lcom/android/server/am/ExtraActivityManagerService$7;)V

    invoke-virtual {v0}, Lcom/android/server/am/ExtraActivityManagerService$7$1;->start()V

    .line 664
    return-void
.end method
