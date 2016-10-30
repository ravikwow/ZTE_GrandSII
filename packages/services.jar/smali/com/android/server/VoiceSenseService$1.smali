.class Lcom/android/server/VoiceSenseService$1;
.super Landroid/database/ContentObserver;
.source "VoiceSenseService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/VoiceSenseService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/VoiceSenseService;


# direct methods
.method constructor <init>(Lcom/android/server/VoiceSenseService;Landroid/os/Handler;)V
    .locals 0
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/android/server/VoiceSenseService$1;->this$0:Lcom/android/server/VoiceSenseService;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 2
    .param p1, "selfChange"    # Z

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/server/VoiceSenseService$1;->this$0:Lcom/android/server/VoiceSenseService;

    # invokes: Lcom/android/server/VoiceSenseService;->isVoiceSenseToggled()Z
    invoke-static {v0}, Lcom/android/server/VoiceSenseService;->access$000(Lcom/android/server/VoiceSenseService;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/android/server/VoiceSenseService$1;->this$0:Lcom/android/server/VoiceSenseService;

    const/4 v1, 0x3

    # invokes: Lcom/android/server/VoiceSenseService;->setVoiceStateState(I)V
    invoke-static {v0, v1}, Lcom/android/server/VoiceSenseService;->access$100(Lcom/android/server/VoiceSenseService;I)V

    .line 126
    :goto_0
    return-void

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/android/server/VoiceSenseService$1;->this$0:Lcom/android/server/VoiceSenseService;

    const/4 v1, 0x1

    # invokes: Lcom/android/server/VoiceSenseService;->setVoiceStateState(I)V
    invoke-static {v0, v1}, Lcom/android/server/VoiceSenseService;->access$100(Lcom/android/server/VoiceSenseService;I)V

    goto :goto_0
.end method
