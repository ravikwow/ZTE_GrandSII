.class final Lcom/android/server/am/ExtraActivityManagerService$6;
.super Landroid/os/Handler;
.source "ExtraActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/am/ExtraActivityManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 383
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 387
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 396
    :goto_0
    return-void

    .line 389
    :pswitch_0
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/server/am/ExtraActivityManagerService$CompatibleMessage;

    .line 390
    .local v1, "cMsg":Lcom/android/server/am/ExtraActivityManagerService$CompatibleMessage;
    iget-object v2, v1, Lcom/android/server/am/ExtraActivityManagerService$CompatibleMessage;->context:Landroid/content/Context;

    iget-object v3, v1, Lcom/android/server/am/ExtraActivityManagerService$CompatibleMessage;->message:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 393
    .end local v1    # "cMsg":Lcom/android/server/am/ExtraActivityManagerService$CompatibleMessage;
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    .line 394
    .local v0, "c":Landroid/content/Context;
    new-instance v2, Lmiui/drm/DrmBroadcast;

    invoke-direct {v2, v0}, Lmiui/drm/DrmBroadcast;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lmiui/drm/DrmBroadcast;->broadcast()V

    goto :goto_0

    .line 387
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
