.class Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;
.super Landroid/os/Handler;
.source "VoiceSenseService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/VoiceSenseService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VoiceSenseWorkerHandler"
.end annotation


# static fields
.field private static final MESSAGE_SET:I


# instance fields
.field final synthetic this$0:Lcom/android/server/VoiceSenseService;


# direct methods
.method private constructor <init>(Lcom/android/server/VoiceSenseService;)V
    .locals 0

    .prologue
    .line 300
    iput-object p1, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;->this$0:Lcom/android/server/VoiceSenseService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/VoiceSenseService;Lcom/android/server/VoiceSenseService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/VoiceSenseService;
    .param p2, "x1"    # Lcom/android/server/VoiceSenseService$1;

    .prologue
    .line 300
    invoke-direct {p0, p1}, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;-><init>(Lcom/android/server/VoiceSenseService;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 305
    :try_start_0
    iget v1, p1, Landroid/os/Message;->what:I

    if-nez v1, :cond_0

    .line 306
    const-string v1, "VoiceSense-Service"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#### set message received: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ####"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 312
    :cond_0
    :goto_0
    return-void

    .line 308
    :catch_0
    move-exception v0

    .line 310
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "VoiceSense-Service"

    const-string v2, "Exception in VoiceSenseWorkerHandler.handleMessage:"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
