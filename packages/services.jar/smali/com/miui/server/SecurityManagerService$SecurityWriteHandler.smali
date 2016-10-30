.class Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;
.super Landroid/os/Handler;
.source "SecurityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/server/SecurityManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SecurityWriteHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/server/SecurityManagerService;


# direct methods
.method constructor <init>(Lcom/miui/server/SecurityManagerService;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    .line 152
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 153
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/16 v8, 0xa

    const/4 v3, 0x0

    .line 156
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 199
    :goto_0
    return-void

    .line 159
    :pswitch_0
    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 160
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mPackages:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/miui/server/SecurityManagerService;->access$400(Lcom/miui/server/SecurityManagerService;)Ljava/util/HashMap;

    move-result-object v3

    monitor-enter v3

    .line 161
    const/4 v2, 0x1

    :try_start_0
    invoke-virtual {p0, v2}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->removeMessages(I)V

    .line 162
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # invokes: Lcom/miui/server/SecurityManagerService;->writeSettings()V
    invoke-static {v2}, Lcom/miui/server/SecurityManagerService;->access$500(Lcom/miui/server/SecurityManagerService;)V

    .line 163
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    invoke-static {v8}, Landroid/os/Process;->setThreadPriority(I)V

    goto :goto_0

    .line 163
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 168
    :pswitch_1
    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 169
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/miui/server/SecurityManagerService;->access$600(Lcom/miui/server/SecurityManagerService;)Ljava/util/HashMap;

    move-result-object v3

    monitor-enter v3

    .line 170
    const/4 v2, 0x2

    :try_start_2
    invoke-virtual {p0, v2}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->removeMessages(I)V

    .line 171
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # invokes: Lcom/miui/server/SecurityManagerService;->writeWakeUpTime()V
    invoke-static {v2}, Lcom/miui/server/SecurityManagerService;->access$700(Lcom/miui/server/SecurityManagerService;)V

    .line 172
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 173
    invoke-static {v8}, Landroid/os/Process;->setThreadPriority(I)V

    goto :goto_0

    .line 172
    :catchall_1
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2

    .line 177
    :pswitch_2
    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 178
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mWakeUpTime:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/miui/server/SecurityManagerService;->access$600(Lcom/miui/server/SecurityManagerService;)Ljava/util/HashMap;

    move-result-object v3

    monitor-enter v3

    .line 179
    const/4 v2, 0x3

    :try_start_4
    invoke-virtual {p0, v2}, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->removeMessages(I)V

    .line 180
    const-string v2, "vendor"

    const/4 v4, 0x3

    invoke-static {v2, v4}, Lmiui/util/FeatureParser;->hasFeature(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 181
    const-string v2, "vendor"

    invoke-static {v2}, Lmiui/util/FeatureParser;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 182
    .local v1, "vendor":Ljava/lang/String;
    const-string v2, "mediatek"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 184
    iget-object v2, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/miui/server/SecurityManagerService;->access$000(Lcom/miui/server/SecurityManagerService;)Landroid/content/Context;

    move-result-object v2

    const-string v4, "alarm"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 185
    .local v0, "am":Landroid/app/AlarmManager;
    const/16 v2, 0x8

    iget-object v4, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mWakeTime:J
    invoke-static {v4}, Lcom/miui/server/SecurityManagerService;->access$800(Lcom/miui/server/SecurityManagerService;)J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    const/4 v6, 0x0

    invoke-virtual {v0, v2, v4, v5, v6}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 194
    .end local v0    # "am":Landroid/app/AlarmManager;
    .end local v1    # "vendor":Ljava/lang/String;
    :goto_1
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 195
    invoke-static {v8}, Landroid/os/Process;->setThreadPriority(I)V

    goto :goto_0

    .line 186
    .restart local v1    # "vendor":Ljava/lang/String;
    :cond_0
    :try_start_5
    const-string v2, "leadcore"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 187
    const-string v2, "/sys/comip/rtc_alarm"

    iget-object v4, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mWakeTime:J
    invoke-static {v4}, Lcom/miui/server/SecurityManagerService;->access$800(Lcom/miui/server/SecurityManagerService;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/miui/Shell;->write(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_1

    .line 194
    .end local v1    # "vendor":Ljava/lang/String;
    :catchall_2
    move-exception v2

    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v2

    .line 189
    .restart local v1    # "vendor":Ljava/lang/String;
    :cond_1
    :try_start_6
    const-string v2, "/sys/class/rtc/rtc0/wakealarm"

    iget-object v4, p0, Lcom/miui/server/SecurityManagerService$SecurityWriteHandler;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mWakeTime:J
    invoke-static {v4}, Lcom/miui/server/SecurityManagerService;->access$800(Lcom/miui/server/SecurityManagerService;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/miui/Shell;->write(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_1

    .line 192
    .end local v1    # "vendor":Ljava/lang/String;
    :cond_2
    const-string v2, "SecurityManagerService"

    const-string v4, "There is no corresponding feature!"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_1

    .line 156
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
