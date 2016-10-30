.class public Lcom/android/server/VoiceSenseService;
.super Landroid/os/IVoiceSenseService$Stub;
.source "VoiceSenseService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/VoiceSenseService$VoiseSenseObserver;,
        Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;,
        Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;
    }
.end annotation


# static fields
.field public static final EXTRA_VOICESENSE_STATE:Ljava/lang/String; = "android.media.EXTRA_VOICESENSE_STATE"

.field private static final TAG:Ljava/lang/String; = "VoiceSense-Service"

.field private static final VOICESENSE_DISABLED:I = 0x0

.field private static final VOICESENSE_ENABLED:I = 0x1

.field public static final VOICESENSE_STATE_CHANGED_ACTION:Ljava/lang/String; = "android.media.VOICESENSE_STATE_CHANGED"

.field public static final VOICESENSE_STATE_DISABLED:I = 0x1

.field public static final VOICESENSE_STATE_DISABLING:I = 0x0

.field public static final VOICESENSE_STATE_ENABLED:I = 0x3

.field public static final VOICESENSE_STATE_ENABLING:I = 0x2

.field public static final VOICESENSE_STATE_UNKNOWN:I = 0x4

.field private static final VOICE_SWITCH:Ljava/lang/String; = "voicesenseenable"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mHandler:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;

.field mIsVsOpen:Z

.field private mObserver:Landroid/database/ContentObserver;

.field private final mVsState:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mWorker:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

.field private final uri:Landroid/net/Uri;

.field private vsObserver:Lcom/android/server/VoiceSenseService$VoiseSenseObserver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    .line 130
    invoke-direct {p0}, Landroid/os/IVoiceSenseService$Stub;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/VoiceSenseService;->mIsVsOpen:Z

    .line 114
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/android/server/VoiceSenseService;->mVsState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 116
    const-string v0, "voicesenseenable"

    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/VoiceSenseService;->uri:Landroid/net/Uri;

    .line 118
    new-instance v0, Lcom/android/server/VoiceSenseService$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/server/VoiceSenseService$1;-><init>(Lcom/android/server/VoiceSenseService;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/server/VoiceSenseService;->mObserver:Landroid/database/ContentObserver;

    .line 131
    iput-object p1, p0, Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;

    .line 132
    new-instance v0, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    const-string v1, "VoiceSenseServiceWorker"

    invoke-direct {v0, p0, v1}, Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;-><init>(Lcom/android/server/VoiceSenseService;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/VoiceSenseService;->mWorker:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    .line 133
    iget-object v0, p0, Lcom/android/server/VoiceSenseService;->mWorker:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerThread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 134
    iget-object v0, p0, Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/VoiceSenseService;->uri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/android/server/VoiceSenseService;->mObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 135
    const-string v0, "VoiceSense-Service"

    const-string v1, "#### Spawned worker thread ####"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/VoiceSenseService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/VoiceSenseService;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/android/server/VoiceSenseService;->isVoiceSenseToggled()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/android/server/VoiceSenseService;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/VoiceSenseService;
    .param p1, "x1"    # I

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/android/server/VoiceSenseService;->setVoiceStateState(I)V

    return-void
.end method

.method static synthetic access$202(Lcom/android/server/VoiceSenseService;Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;)Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/VoiceSenseService;
    .param p1, "x1"    # Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/server/VoiceSenseService;->mHandler:Lcom/android/server/VoiceSenseService$VoiceSenseWorkerHandler;

    return-object p1
.end method

.method static synthetic access$402(Lcom/android/server/VoiceSenseService;Lcom/android/server/VoiceSenseService$VoiseSenseObserver;)Lcom/android/server/VoiceSenseService$VoiseSenseObserver;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/VoiceSenseService;
    .param p1, "x1"    # Lcom/android/server/VoiceSenseService$VoiseSenseObserver;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/server/VoiceSenseService;->vsObserver:Lcom/android/server/VoiceSenseService$VoiseSenseObserver;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/server/VoiceSenseService;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/VoiceSenseService;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static native getKeywordJni(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private getPersistedVoiceSenseState()I
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 224
    iget-object v3, p0, Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 226
    .local v0, "cr":Landroid/content/ContentResolver;
    :try_start_0
    const-string v3, "voicesenseenable"

    invoke-static {v0, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 229
    :goto_0
    return v2

    .line 227
    :catch_0
    move-exception v1

    .line 228
    .local v1, "e":Landroid/provider/Settings$SettingNotFoundException;
    const-string v3, "voicesenseenable"

    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0
.end method

.method static native getValueJni(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private isVoiceSenseToggled()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 234
    invoke-direct {p0}, Lcom/android/server/VoiceSenseService;->getPersistedVoiceSenseState()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private persistVoiceSenseState(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    .line 218
    iget-object v1, p0, Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 220
    .local v0, "cr":Landroid/content/ContentResolver;
    const-string v1, "voicesenseenable"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 221
    return-void
.end method

.method static native readSysfsJni(Ljava/lang/String;)Ljava/lang/String;
.end method

.method static native runSysCmdJni(Ljava/lang/String;)I
.end method

.method static native setKeywordJni(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method static native setValueJni(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private setVoiceStateState(I)V
    .locals 4
    .param p1, "vsState"    # I

    .prologue
    .line 207
    iget-object v1, p0, Lcom/android/server/VoiceSenseService;->mVsState:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 209
    const-string v1, "VoiceSense-Service"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setVoiceStateState: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.VOICESENSE_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 212
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 213
    const-string v1, "android.media.EXTRA_VOICESENSE_STATE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 214
    iget-object v1, p0, Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendStickyBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 215
    return-void
.end method

.method static native writeSysfsJni(Ljava/lang/String;Ljava/lang/String;I)I
.end method


# virtual methods
.method public getKeyword(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p1, "sysfs"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 154
    const-string v0, "VoiceSense-Service"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#### getKeyword ==> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ####"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    invoke-static {p1, p2}, Lcom/android/server/VoiceSenseService;->getKeywordJni(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 144
    const-string v0, "VoiceSense-Service"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#### getValue ==> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ####"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    invoke-static {p1}, Lcom/android/server/VoiceSenseService;->getValueJni(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVoiceSenseState()I
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/android/server/VoiceSenseService;->mVsState:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public readSysfs(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "sysfs"    # Ljava/lang/String;

    .prologue
    .line 169
    const-string v0, "VoiceSense-Service"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#### readSysfs ==> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ####"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    invoke-static {p1}, Lcom/android/server/VoiceSenseService;->readSysfsJni(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public runSysCmd(Ljava/lang/String;)I
    .locals 3
    .param p1, "cmd"    # Ljava/lang/String;

    .prologue
    .line 159
    const-string v0, "VoiceSense-Service"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#### runSysCmd ==> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ####"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    invoke-static {p1}, Lcom/android/server/VoiceSenseService;->runSysCmdJni(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public setKeyword(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p1, "sysfs"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 149
    const-string v0, "VoiceSense-Service"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#### setKeyword ==> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ####"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    invoke-static {p1, p2}, Lcom/android/server/VoiceSenseService;->setKeywordJni(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public setValue(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;

    .prologue
    .line 139
    const-string v0, "VoiceSense-Service"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#### setValue ==> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ####"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    invoke-static {p1, p2}, Lcom/android/server/VoiceSenseService;->setValueJni(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public setVoiceSenseEnabled(Z)Z
    .locals 7
    .param p1, "enabled"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 174
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    .line 175
    .local v1, "ident":J
    if-eqz p1, :cond_0

    .line 176
    const/4 v3, 0x2

    invoke-direct {p0, v3}, Lcom/android/server/VoiceSenseService;->setVoiceStateState(I)V

    .line 177
    const-string v3, "Set Power State"

    const-string v4, "Active"

    invoke-virtual {p0, v3, v4}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    const-string v3, "Voice Sense Auto Mode"

    const-string v4, "Detect builtin"

    invoke-virtual {p0, v3, v4}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    const-string v3, "Set Power State"

    const-string v4, "VS"

    invoke-virtual {p0, v3, v4}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    const-string v3, "MIC BIAS1 Switch"

    const-string v4, "1"

    invoke-virtual {p0, v3, v4}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 182
    .local v0, "i":Landroid/content/Intent;
    const-string v3, "android.intent.action.SETTINGS_SWITCH_ON"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 183
    iget-object v3, p0, Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 184
    invoke-direct {p0, v6}, Lcom/android/server/VoiceSenseService;->persistVoiceSenseState(I)V

    .line 185
    const-string v3, "persist.sys.voicesence"

    const-string v4, "1"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    :goto_0
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 198
    return v6

    .line 187
    .end local v0    # "i":Landroid/content/Intent;
    :cond_0
    invoke-direct {p0, v5}, Lcom/android/server/VoiceSenseService;->setVoiceStateState(I)V

    .line 188
    const-string v3, "Set Power State"

    const-string v4, "Active"

    invoke-virtual {p0, v3, v4}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    const-string v3, "Set Power State"

    const-string v4, "Sleep"

    invoke-virtual {p0, v3, v4}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    const-string v3, "MIC BIAS1 Switch"

    const-string v4, "0"

    invoke-virtual {p0, v3, v4}, Lcom/android/server/VoiceSenseService;->setValue(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 192
    .restart local v0    # "i":Landroid/content/Intent;
    const-string v3, "android.intent.action.SETTINGS_SWITCH_OFF"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 193
    iget-object v3, p0, Lcom/android/server/VoiceSenseService;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 194
    invoke-direct {p0, v5}, Lcom/android/server/VoiceSenseService;->persistVoiceSenseState(I)V

    .line 195
    const-string v3, "persist.sys.voicesence"

    const-string v4, "0"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public writeSysfs(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 3
    .param p1, "sysfs"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "size"    # I

    .prologue
    .line 164
    const-string v0, "VoiceSense-Service"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#### writeSysfs ==> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", size = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes ####"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-static {p1, p2, p3}, Lcom/android/server/VoiceSenseService;->writeSysfsJni(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method
