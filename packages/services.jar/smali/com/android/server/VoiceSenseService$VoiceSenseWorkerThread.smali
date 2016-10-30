.class Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;
.super Ljava/lang/Thread;
.source "VoiceSenseService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/VoiceSenseService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VoiceSenseWorkerThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/VoiceSenseService;


# direct methods
.method public constructor <init>(Lcom/android/server/VoiceSenseService;Ljava/lang/String;)V
    .locals 0
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    .line 239
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 240
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 242
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 243
    iget-object v2, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    new-instance v3, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;

    iget-object v4, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;-><init>(Lcom/android/server/VoiceSenseService;Lcom/android/server/VoiceSenseService$1;)V

    # setter for: Lcom/android/server/VoiceSenseService;->mHandler:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;
    invoke-static {v2, v3}, Lcom/android/server/VoiceSenseService;->access$202(Lcom/android/server/VoiceSenseService;Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;)Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;

    .line 244
    iget-object v2, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    new-instance v3, Lcom/android/server/VoiceSenseService$VoiseSenseObserver;

    iget-object v4, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    iget-object v5, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    # getter for: Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lcom/android/server/VoiceSenseService;->access$500(Lcom/android/server/VoiceSenseService;)Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/android/server/VoiceSenseService$VoiseSenseObserver;-><init>(Lcom/android/server/VoiceSenseService;Landroid/content/Context;)V

    # setter for: Lcom/android/server/VoiceSenseService;->vsObserver:Lcom/android/server/VoiceSenseService$VoiseSenseObserver;
    invoke-static {v2, v3}, Lcom/android/server/VoiceSenseService;->access$402(Lcom/android/server/VoiceSenseService;Lcom/android/server/VoiceSenseService$VoiseSenseObserver;)Lcom/android/server/VoiceSenseService$VoiseSenseObserver;

    .line 247
    const-string v2, "persist.sys.voicesence"

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 248
    .local v1, "voiceenable":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object v2, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    iget-boolean v2, v2, Lcom/android/server/VoiceSenseService;->mIsVsOpen:Z

    if-nez v2, :cond_0

    .line 249
    new-instance v0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;

    invoke-direct {v0, p0}, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;-><init>(Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;)V

    .line 291
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 294
    .end local v0    # "t":Ljava/lang/Thread;
    :cond_0
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 297
    return-void
.end method
