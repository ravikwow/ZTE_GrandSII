.class Lcom/miui/server/SecuritySmsHandler;
.super Ljava/lang/Object;
.source "SecuritySmsHandler.java"


# instance fields
.field private mBlockType:I

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mInterceptSmsCallerPkgName:Ljava/lang/String;

.field private mInterceptSmsCallerUid:I

.field private mInterceptSmsCount:I

.field private mInterceptSmsLock:Ljava/lang/Object;

.field private mInterceptSmsSenderNum:Ljava/lang/String;

.field private mInterceptedResultReceiver:Landroid/content/BroadcastReceiver;

.field private mNormalSmsResultReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput v0, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerUid:I

    .line 37
    iput-object v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerPkgName:Ljava/lang/String;

    .line 39
    iput v0, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCount:I

    .line 40
    iput-object v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsSenderNum:Ljava/lang/String;

    .line 41
    iput v0, p0, Lcom/miui/server/SecuritySmsHandler;->mBlockType:I

    .line 43
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsLock:Ljava/lang/Object;

    .line 237
    new-instance v0, Lcom/miui/server/SecuritySmsHandler$1;

    invoke-direct {v0, p0}, Lcom/miui/server/SecuritySmsHandler$1;-><init>(Lcom/miui/server/SecuritySmsHandler;)V

    iput-object v0, p0, Lcom/miui/server/SecuritySmsHandler;->mNormalSmsResultReceiver:Landroid/content/BroadcastReceiver;

    .line 253
    new-instance v0, Lcom/miui/server/SecuritySmsHandler$2;

    invoke-direct {v0, p0}, Lcom/miui/server/SecuritySmsHandler$2;-><init>(Lcom/miui/server/SecuritySmsHandler;)V

    iput-object v0, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptedResultReceiver:Landroid/content/BroadcastReceiver;

    .line 46
    iput-object p2, p0, Lcom/miui/server/SecuritySmsHandler;->mHandler:Landroid/os/Handler;

    .line 47
    iput-object p1, p0, Lcom/miui/server/SecuritySmsHandler;->mContext:Landroid/content/Context;

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/miui/server/SecuritySmsHandler;)Landroid/content/BroadcastReceiver;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/SecuritySmsHandler;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/miui/server/SecuritySmsHandler;->mNormalSmsResultReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method static synthetic access$100(Lcom/miui/server/SecuritySmsHandler;Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/SecuritySmsHandler;
    .param p1, "x1"    # Landroid/content/Intent;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # I
    .param p4, "x4"    # Landroid/content/BroadcastReceiver;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/server/SecuritySmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/server/SecuritySmsHandler;Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/SecuritySmsHandler;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/miui/server/SecuritySmsHandler;->checkByAntiSpam(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/miui/server/SecuritySmsHandler;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/SecuritySmsHandler;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/miui/server/SecuritySmsHandler;->dispatchNormalSms(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/server/SecuritySmsHandler;)I
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/SecuritySmsHandler;

    .prologue
    .line 31
    iget v0, p0, Lcom/miui/server/SecuritySmsHandler;->mBlockType:I

    return v0
.end method

.method static synthetic access$500(Lcom/miui/server/SecuritySmsHandler;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/server/SecuritySmsHandler;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/miui/server/SecuritySmsHandler;->dispatchSmsToAntiSpam(Landroid/content/Intent;)V

    return-void
.end method

.method private checkByAntiSpam(Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 1
    .param p1, "sender"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "slotId"    # I

    .prologue
    .line 164
    iget-object v0, p0, Lcom/miui/server/SecuritySmsHandler;->mContext:Landroid/content/Context;

    invoke-static {v0, p1, p2, p3}, Lmiui/provider/ExtraTelephony;->getSmsBlockType(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/server/SecuritySmsHandler;->mBlockType:I

    .line 166
    iget v0, p0, Lcom/miui/server/SecuritySmsHandler;->mBlockType:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkWithInterceptedSender(Ljava/lang/String;)Z
    .locals 7
    .param p1, "sender"    # Ljava/lang/String;

    .prologue
    .line 146
    const/4 v0, 0x0

    .line 147
    .local v0, "result":Z
    iget-object v2, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 148
    :try_start_0
    const-string v1, "SecurityManagerService"

    const-string v3, "checkWithInterceptedSender: callerUid:%d, senderNum:%s, count:%d"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget v6, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerUid:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsSenderNum:Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    iget v6, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCount:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    iget v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerUid:I

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsSenderNum:Ljava/lang/String;

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 151
    iget v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCount:I

    if-lez v1, :cond_0

    .line 152
    iget v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCount:I

    .line 153
    const/4 v0, 0x1

    .line 155
    :cond_0
    iget v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCount:I

    if-nez v1, :cond_1

    .line 156
    invoke-direct {p0}, Lcom/miui/server/SecuritySmsHandler;->releaseSmsIntercept()V

    .line 159
    :cond_1
    monitor-exit v2

    .line 160
    return v0

    .line 159
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "permission"    # Ljava/lang/String;
    .param p3, "appOp"    # I
    .param p4, "resultReceiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    const/4 v7, 0x0

    .line 184
    iget-object v0, p0, Lcom/miui/server/SecuritySmsHandler;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/miui/server/SecuritySmsHandler;->mHandler:Landroid/os/Handler;

    const/4 v6, -0x1

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v8, v7

    invoke-virtual/range {v0 .. v8}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 186
    return-void
.end method

.method private dispatchInterceptedSms(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 177
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 178
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 179
    const-string v0, "android.permission.RECEIVE_SMS"

    const/16 v1, 0x10

    iget-object v2, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptedResultReceiver:Landroid/content/BroadcastReceiver;

    invoke-direct {p0, p2, v0, v1, v2}, Lcom/miui/server/SecuritySmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 181
    return-void
.end method

.method private dispatchMmsToAntiSpam(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 210
    const-string v0, "SecurityManagerService"

    const-string v1, "dispatchMmsToAntiSpam"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    sget-boolean v0, Lmiui/util/OldmanUtil;->IS_ELDER_MODE:Z

    if-eqz v0, :cond_0

    .line 213
    const-string v0, "com.jeejen.family.miui.mms"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 217
    :goto_0
    const-string v0, "android.provider.Telephony.WAP_PUSH_DELIVER"

    invoke-direct {p0, v0, p1}, Lcom/miui/server/SecuritySmsHandler;->dispatchInterceptedSms(Ljava/lang/String;Landroid/content/Intent;)V

    .line 218
    return-void

    .line 215
    :cond_0
    const-string v0, "com.android.mms"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private dispatchNormalSms(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x1

    .line 221
    const-string v1, "SecurityManagerService"

    const-string v2, "dispatchNormalSms"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 223
    const-string v1, "android.provider.Telephony.SMS_DELIVER"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 226
    iget-object v1, p0, Lcom/miui/server/SecuritySmsHandler;->mContext:Landroid/content/Context;

    invoke-static {v1, v3}, Lcom/android/internal/telephony/SmsApplication;->getDefaultSmsApplication(Landroid/content/Context;Z)Landroid/content/ComponentName;

    move-result-object v0

    .line 227
    .local v0, "componentName":Landroid/content/ComponentName;
    if-eqz v0, :cond_0

    .line 229
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 230
    const-string v1, "SecurityManagerService"

    const-string v2, "Delivering SMS to: %s"

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    :cond_0
    const/high16 v1, 0x8000000

    invoke-virtual {p1, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 233
    const-string v1, "android.permission.RECEIVE_SMS"

    const/16 v2, 0x10

    iget-object v3, p0, Lcom/miui/server/SecuritySmsHandler;->mNormalSmsResultReceiver:Landroid/content/BroadcastReceiver;

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/miui/server/SecuritySmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 235
    return-void
.end method

.method private dispatchSmsToAntiSpam(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 198
    const-string v0, "SecurityManagerService"

    const-string v1, "dispatchSmsToAntiSpam"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    sget-boolean v0, Lmiui/util/OldmanUtil;->IS_ELDER_MODE:Z

    if-eqz v0, :cond_0

    .line 201
    const-string v0, "com.jeejen.family.miui"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 205
    :goto_0
    const-string v0, "android.provider.Telephony.SMS_DELIVER"

    invoke-direct {p0, v0, p1}, Lcom/miui/server/SecuritySmsHandler;->dispatchInterceptedSms(Ljava/lang/String;Landroid/content/Intent;)V

    .line 206
    return-void

    .line 203
    :cond_0
    const-string v0, "com.android.mms"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private dispatchToInterceptApp(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 189
    const-string v0, "SecurityManagerService"

    const-string v1, "dispatchToInterceptApp"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 191
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 192
    iget-object v0, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerPkgName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 193
    const-string v0, "android.provider.Telephony.SMS_RECEIVED"

    invoke-direct {p0, v0, p1}, Lcom/miui/server/SecuritySmsHandler;->dispatchInterceptedSms(Ljava/lang/String;Landroid/content/Intent;)V

    .line 194
    return-void
.end method

.method public static getSlotIdFromIntent(Landroid/content/Intent;)I
    .locals 3
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 292
    const/4 v0, 0x0

    .line 293
    .local v0, "slotId":I
    invoke-static {}, Lmiui/telephony/TelephonyManager;->getDefault()Lmiui/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Lmiui/telephony/TelephonyManager;->getPhoneCount()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    .line 294
    invoke-static {p0, v0}, Lmiui/telephony/SubscriptionManager;->getSlotIdExtra(Landroid/content/Intent;I)I

    move-result v0

    .line 295
    if-gez v0, :cond_0

    .line 296
    const-string v1, "SecurityManagerService"

    const-string v2, "getSlotIdFromIntent slotId < 0"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    :cond_0
    return v0
.end method

.method private releaseSmsIntercept()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 170
    iput v0, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerUid:I

    .line 171
    iput-object v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerPkgName:Ljava/lang/String;

    .line 172
    iput-object v1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsSenderNum:Ljava/lang/String;

    .line 173
    iput v0, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCount:I

    .line 174
    return-void
.end method


# virtual methods
.method checkSmsBlocked(Landroid/content/Intent;)Z
    .locals 17
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 51
    const-string v14, "SecurityManagerService"

    const-string v15, "enter checkSmsBlocked"

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    const/4 v3, 0x0

    .line 54
    .local v3, "blocked":Z
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x13

    if-ge v14, v15, :cond_0

    move v4, v3

    .line 104
    .end local v3    # "blocked":Z
    .local v4, "blocked":I
    :goto_0
    return v4

    .line 58
    .end local v4    # "blocked":I
    .restart local v3    # "blocked":Z
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "action":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/miui/server/SecuritySmsHandler;->getSlotIdFromIntent(Landroid/content/Intent;)I

    move-result v13

    .line 61
    .local v13, "slotId":I
    const-string v14, "android.provider.Telephony.SMS_DELIVER"

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 62
    invoke-static/range {p1 .. p1}, Landroid/provider/Telephony$Sms$Intents;->getMessagesFromIntent(Landroid/content/Intent;)[Landroid/telephony/SmsMessage;

    move-result-object v8

    .line 63
    .local v8, "msgs":[Landroid/telephony/SmsMessage;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .local v12, "sb":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    array-length v14, v8

    if-ge v7, v14, :cond_1

    .line 65
    aget-object v14, v8, v7

    invoke-virtual {v14}, Landroid/telephony/SmsMessage;->getDisplayMessageBody()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 68
    :cond_1
    const/4 v14, 0x0

    aget-object v14, v8, v14

    invoke-virtual {v14}, Landroid/telephony/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "address":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 71
    .local v5, "body":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/miui/server/SecuritySmsHandler;->checkWithInterceptedSender(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 72
    const-string v14, "SecurityManagerService"

    const-string v15, "Intercepted by sender address"

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    invoke-direct/range {p0 .. p1}, Lcom/miui/server/SecuritySmsHandler;->dispatchToInterceptApp(Landroid/content/Intent;)V

    .line 74
    const/4 v3, 0x1

    .line 77
    :cond_2
    if-nez v3, :cond_3

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v5, v13}, Lcom/miui/server/SecuritySmsHandler;->checkByAntiSpam(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 78
    const-string v14, "SecurityManagerService"

    const-string v15, "Intercepted by AntiSpam"

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const-string v14, "blockType"

    move-object/from16 v0, p0

    iget v15, v0, Lcom/miui/server/SecuritySmsHandler;->mBlockType:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 80
    invoke-direct/range {p0 .. p1}, Lcom/miui/server/SecuritySmsHandler;->dispatchSmsToAntiSpam(Landroid/content/Intent;)V

    .line 81
    const/4 v3, 0x1

    .line 103
    .end local v2    # "address":Ljava/lang/String;
    .end local v5    # "body":Ljava/lang/String;
    .end local v7    # "i":I
    .end local v8    # "msgs":[Landroid/telephony/SmsMessage;
    .end local v12    # "sb":Ljava/lang/StringBuilder;
    :cond_3
    :goto_2
    const-string v14, "SecurityManagerService"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "leave checkSmsBlocked, blocked:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v4, v3

    .line 104
    .restart local v4    # "blocked":I
    goto/16 :goto_0

    .line 84
    .end local v4    # "blocked":I
    :cond_4
    const-string v14, "android.provider.Telephony.WAP_PUSH_DELIVER"

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 87
    :try_start_0
    const-string v14, "data"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v11

    .line 88
    .local v11, "pushData":[B
    new-instance v9, Lcom/google/android/mms/pdu/PduParser;

    invoke-direct {v9, v11}, Lcom/google/android/mms/pdu/PduParser;-><init>([B)V

    .line 89
    .local v9, "parser":Lcom/google/android/mms/pdu/PduParser;
    invoke-virtual {v9}, Lcom/google/android/mms/pdu/PduParser;->parse()Lcom/google/android/mms/pdu/GenericPdu;

    move-result-object v10

    .line 90
    .local v10, "pdu":Lcom/google/android/mms/pdu/GenericPdu;
    invoke-virtual {v10}, Lcom/google/android/mms/pdu/GenericPdu;->getFrom()Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v14

    invoke-virtual {v14}, Lcom/google/android/mms/pdu/EncodedStringValue;->getTextString()[B

    move-result-object v14

    invoke-static {v14}, Lcom/google/android/mms/pdu/PduPersister;->toIsoString([B)Ljava/lang/String;

    move-result-object v2

    .line 92
    .restart local v2    # "address":Ljava/lang/String;
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v14, v13}, Lcom/miui/server/SecuritySmsHandler;->checkByAntiSpam(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 93
    const-string v14, "SecurityManagerService"

    const-string v15, "Intercepted wap push by AntiSpam"

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    const-string v14, "blockType"

    move-object/from16 v0, p0

    iget v15, v0, Lcom/miui/server/SecuritySmsHandler;->mBlockType:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 95
    invoke-direct/range {p0 .. p1}, Lcom/miui/server/SecuritySmsHandler;->dispatchMmsToAntiSpam(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    const/4 v3, 0x1

    goto :goto_2

    .line 98
    .end local v2    # "address":Ljava/lang/String;
    .end local v9    # "parser":Lcom/google/android/mms/pdu/PduParser;
    .end local v10    # "pdu":Lcom/google/android/mms/pdu/GenericPdu;
    .end local v11    # "pushData":[B
    :catch_0
    move-exception v6

    .line 99
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method startInterceptSmsBySender(Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 5
    .param p1, "pkgName"    # Ljava/lang/String;
    .param p2, "sender"    # Ljava/lang/String;
    .param p3, "count"    # I

    .prologue
    const/4 v1, 0x0

    .line 108
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-ge v2, v3, :cond_0

    .line 123
    :goto_0
    return v1

    .line 112
    :cond_0
    iget-object v2, p0, Lcom/miui/server/SecuritySmsHandler;->mContext:Landroid/content/Context;

    const-string v3, "com.miui.permission.MANAGE_SMS_INTERCEPT"

    const-string v4, "SecurityManagerService"

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    .line 114
    .local v0, "callerUid":I
    iget-object v2, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 115
    :try_start_0
    iget v3, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerUid:I

    if-nez v3, :cond_1

    .line 116
    iput v0, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerUid:I

    .line 117
    iput-object p1, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerPkgName:Ljava/lang/String;

    .line 118
    iput-object p2, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsSenderNum:Ljava/lang/String;

    .line 119
    iput p3, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCount:I

    .line 120
    const/4 v1, 0x1

    monitor-exit v2

    goto :goto_0

    .line 122
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method stopInterceptSmsBySender()Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 127
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-ge v3, v4, :cond_0

    .line 142
    :goto_0
    return v1

    .line 131
    :cond_0
    iget-object v3, p0, Lcom/miui/server/SecuritySmsHandler;->mContext:Landroid/content/Context;

    const-string v4, "com.miui.permission.MANAGE_SMS_INTERCEPT"

    const-string v5, "SecurityManagerService"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    .line 133
    .local v0, "callerUid":I
    iget-object v3, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsLock:Ljava/lang/Object;

    monitor-enter v3

    .line 134
    :try_start_0
    iget v4, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerUid:I

    if-nez v4, :cond_1

    .line 135
    monitor-exit v3

    move v1, v2

    goto :goto_0

    .line 137
    :cond_1
    iget v4, p0, Lcom/miui/server/SecuritySmsHandler;->mInterceptSmsCallerUid:I

    if-ne v4, v0, :cond_2

    .line 138
    invoke-direct {p0}, Lcom/miui/server/SecuritySmsHandler;->releaseSmsIntercept()V

    .line 139
    monitor-exit v3

    move v1, v2

    goto :goto_0

    .line 141
    :cond_2
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
