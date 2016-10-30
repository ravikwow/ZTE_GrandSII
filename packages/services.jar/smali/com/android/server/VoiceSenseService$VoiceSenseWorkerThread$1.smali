.class Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;
.super Ljava/lang/Thread;
.source "VoiceSenseService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;


# direct methods
.method constructor <init>(Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;)V
    .locals 0

    .prologue
    .line 249
    iput-object p1, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 251
    const/4 v3, -0x1

    .line 252
    .local v3, "ret":I
    const/4 v6, -0x1

    .line 253
    .local v6, "vs":I
    const/4 v2, -0x1

    .line 254
    .local v2, "mic":I
    const/4 v4, -0x1

    .line 255
    .local v4, "retMode":I
    const/4 v5, -0x1

    .line 258
    .local v5, "retSensitivity":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v8, 0x14

    if-ge v1, v8, :cond_0

    .line 259
    iget-object v8, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    iget-object v8, v8, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const-string v9, "ES325 Bootup Status"

    invoke-virtual {v8, v9}, Lcom/android/server/VoiceSenseService;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 260
    .local v7, "vsBootupStatus":Ljava/lang/String;
    const-string v8, "VoiceSense-Service"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onCheckedChanged vsBootupStatus vsBootupStatus ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    const-string v8, "1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 263
    :try_start_0
    const-string v8, "VoiceSense-Service"

    const-string v9, "onCheckedChanged vsBootupStatus 1"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    const-wide/16 v8, 0x1770

    invoke-static {v8, v9}, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->sleep(J)V

    .line 265
    iget-object v8, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    iget-object v8, v8, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const/4 v9, 0x2

    # invokes: Lcom/android/server/VoiceSenseService;->setVoiceStateState(I)V
    invoke-static {v8, v9}, Lcom/android/server/VoiceSenseService;->access$100(Lcom/android/server/VoiceSenseService;I)V

    .line 266
    iget-object v8, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    iget-object v8, v8, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const-string v9, "Set Power State"

    const-string v10, "Active"

    invoke-virtual {v8, v9, v10}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 267
    iget-object v8, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    iget-object v8, v8, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const-string v9, "Voice Sense Auto Mode"

    const-string v10, "Detect builtin"

    invoke-virtual {v8, v9, v10}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 268
    iget-object v8, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    iget-object v8, v8, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const-string v9, "Set Power State"

    const-string v10, "VS"

    invoke-virtual {v8, v9, v10}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 269
    iget-object v8, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    iget-object v8, v8, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const-string v9, "MIC BIAS1 Switch"

    const-string v10, "1"

    invoke-virtual {v8, v9, v10}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 270
    iget-object v8, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    iget-object v8, v8, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const/4 v9, 0x3

    # invokes: Lcom/android/server/VoiceSenseService;->setVoiceStateState(I)V
    invoke-static {v8, v9}, Lcom/android/server/VoiceSenseService;->access$100(Lcom/android/server/VoiceSenseService;I)V

    .line 274
    iget-object v8, p0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->this$1:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    iget-object v8, v8, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;->this$0:Lcom/android/server/VoiceSenseService;

    const/4 v9, 0x1

    iput-boolean v9, v8, Lcom/android/server/VoiceSenseService;->mIsVsOpen:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    .end local v7    # "vsBootupStatus":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 275
    .restart local v7    # "vsBootupStatus":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 276
    .local v0, "e":Ljava/lang/Exception;
    const-string v8, "VoiceSense-Service"

    const-string v9, "onCheckedChanged set shot state success"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 282
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    const-wide/16 v8, 0x3e8

    :try_start_1
    invoke-static {v8, v9}, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread$1;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 258
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 283
    :catch_1
    move-exception v0

    .line 284
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v8, "VoiceSense-Service"

    const-string v9, "onCheckedChanged set shot state success"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2
.end method
