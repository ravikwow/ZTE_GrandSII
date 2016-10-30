.class final Lcom/android/server/am/ExtraActivityManagerService$5;
.super Landroid/content/BroadcastReceiver;
.source "ExtraActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ExtraActivityManagerService;->registerScreenStatusChangeReceiver(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 322
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 325
    # getter for: Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeSupported:Z
    invoke-static {}, Lcom/android/server/am/ExtraActivityManagerService;->access$300()Z

    move-result v1

    if-eqz v1, :cond_0

    # getter for: Lcom/android/server/am/ExtraActivityManagerService;->sIsScreenPaperModeEnabled:Z
    invoke-static {}, Lcom/android/server/am/ExtraActivityManagerService;->access$000()Z

    move-result v1

    if-nez v1, :cond_1

    .line 338
    :cond_0
    :goto_0
    return-void

    .line 329
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 330
    .local v0, "action":Ljava/lang/String;
    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 331
    # getter for: Lcom/android/server/am/ExtraActivityManagerService;->sPaperModePkg:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/am/ExtraActivityManagerService;->access$400()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/server/am/ExtraActivityManagerService;->updateScreenPaperMode(Ljava/lang/String;)V

    goto :goto_0

    .line 332
    :cond_2
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 333
    # getter for: Lcom/android/server/am/ExtraActivityManagerService;->sScreenPaperMode:I
    invoke-static {}, Lcom/android/server/am/ExtraActivityManagerService;->access$100()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    invoke-static {}, Landroid/provider/MiuiSettings$System;->isScreenPaperMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 335
    const/4 v1, 0x0

    invoke-static {v1}, Landroid/provider/MiuiSettings$System;->setScreenPaperMode(Z)V

    goto :goto_0
.end method
