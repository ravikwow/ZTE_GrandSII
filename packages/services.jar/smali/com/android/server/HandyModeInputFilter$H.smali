.class Lcom/android/server/HandyModeInputFilter$H;
.super Landroid/os/Handler;
.source "HandyModeInputFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/HandyModeInputFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "H"
.end annotation


# static fields
.field public static final MSG_DOUBLE_CLICK_DELAY:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/android/server/HandyModeInputFilter;


# direct methods
.method public constructor <init>(Lcom/android/server/HandyModeInputFilter;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/android/server/HandyModeInputFilter$H;->this$0:Lcom/android/server/HandyModeInputFilter;

    .line 62
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 63
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 67
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 72
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 73
    return-void

    .line 69
    :pswitch_0
    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter$H;->this$0:Lcom/android/server/HandyModeInputFilter;

    invoke-virtual {v0}, Lcom/android/server/HandyModeInputFilter;->flushPending()V

    goto :goto_0

    .line 67
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
