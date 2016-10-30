.class public Lcom/android/server/PPPOEService;
.super Ljava/lang/Object;
.source "PPPOEService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/PPPOEService$InterfaceObserver;
    }
.end annotation


# static fields
.field public static final ACTION_PPPOE_EXIT_ACTION:Ljava/lang/String; = "android.net.wifi.PPPOE_EXIT_ACTION"

.field public static final ACTION_PPPOE_STATE_CHANGED:Ljava/lang/String; = "android.net.wifi.PPPOE_STATE_CHANGED"

.field public static final ACTION_STOP_PPPOE:Ljava/lang/String; = "android.net.wifi.PPPOE_ALARM_STOP_ACTION"

.field public static final CMD_START_PPPOE:I = 0x0

.field public static final CMD_STOP_PPPOE:I = 0x1

.field public static final EXTRA_PPPOE_STATE:Ljava/lang/String; = "pppoe_state"

.field public static final PPPOE_CLOSE:I = 0x1

.field public static final PPPOE_CONNECTED:I = 0x1

.field public static final PPPOE_CONNECTING:I = 0x2

.field public static final PPPOE_CONNECT_FAILURE:I = 0x3

.field private static final PPPOE_FRAGMENT:Ljava/lang/String; = "android.settings.PPPOE_SETTINGS"

.field private static final STOP_REQUEST:I = 0x0

.field public static final TAG:Ljava/lang/String; = "PPPOEService"


# instance fields
.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mConnectedtime:J

.field private mContext:Landroid/content/Context;

.field private mNwService:Landroid/os/INetworkManagementService;

.field private mPppoeNotification:Landroid/app/Notification;

.field private mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;

.field private mWaitIntent:Landroid/app/PendingIntent;

.field private mWifiService:Lcom/android/server/wifi/WifiService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/server/wifi/WifiService;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "wifiService"    # Lcom/android/server/wifi/WifiService;

    .prologue
    const/4 v8, 0x0

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    sget-object v6, Landroid/net/wifi/PPPOEInfo$Status;->OFFLINE:Landroid/net/wifi/PPPOEInfo$Status;

    iput-object v6, p0, Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;

    .line 137
    iput-object p1, p0, Lcom/android/server/PPPOEService;->mContext:Landroid/content/Context;

    .line 138
    iput-object p2, p0, Lcom/android/server/PPPOEService;->mWifiService:Lcom/android/server/wifi/WifiService;

    .line 140
    iget-object v6, p0, Lcom/android/server/PPPOEService;->mContext:Landroid/content/Context;

    const-string v7, "alarm"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/AlarmManager;

    iput-object v6, p0, Lcom/android/server/PPPOEService;->mAlarmManager:Landroid/app/AlarmManager;

    .line 141
    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.net.wifi.PPPOE_ALARM_STOP_ACTION"

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 142
    .local v5, "waitIntent":Landroid/content/Intent;
    iget-object v6, p0, Lcom/android/server/PPPOEService;->mContext:Landroid/content/Context;

    invoke-static {v6, v8, v5, v8}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/PPPOEService;->mWaitIntent:Landroid/app/PendingIntent;

    .line 144
    const-string v6, "network_management"

    invoke-static {v6}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 145
    .local v0, "b":Landroid/os/IBinder;
    invoke-static {v0}, Landroid/os/INetworkManagementService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/INetworkManagementService;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/PPPOEService;->mNwService:Landroid/os/INetworkManagementService;

    .line 146
    new-instance v2, Lcom/android/server/PPPOEService$InterfaceObserver;

    invoke-direct {v2, p0}, Lcom/android/server/PPPOEService$InterfaceObserver;-><init>(Lcom/android/server/PPPOEService;)V

    .line 148
    .local v2, "mInterfaceObserver":Lcom/android/server/PPPOEService$InterfaceObserver;
    :try_start_0
    iget-object v6, p0, Lcom/android/server/PPPOEService;->mNwService:Landroid/os/INetworkManagementService;

    invoke-interface {v6, v2}, Landroid/os/INetworkManagementService;->registerObserver(Landroid/net/INetworkManagementEventObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    :goto_0
    new-instance v4, Landroid/content/IntentFilter;

    invoke-direct {v4}, Landroid/content/IntentFilter;-><init>()V

    .line 154
    .local v4, "screenFilter":Landroid/content/IntentFilter;
    const-string v6, "android.net.wifi.PPPOE_ALARM_STOP_ACTION"

    invoke-virtual {v4, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 155
    const-string v6, "android.net.wifi.PPPOE_STATE_CHANGED"

    invoke-virtual {v4, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 158
    new-instance v3, Lcom/android/server/PPPOEService$1;

    invoke-direct {v3, p0}, Lcom/android/server/PPPOEService$1;-><init>(Lcom/android/server/PPPOEService;)V

    .line 188
    .local v3, "pppoeReceiver":Landroid/content/BroadcastReceiver;
    iget-object v6, p0, Lcom/android/server/PPPOEService;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 189
    return-void

    .line 149
    .end local v3    # "pppoeReceiver":Landroid/content/BroadcastReceiver;
    .end local v4    # "screenFilter":Landroid/content/IntentFilter;
    :catch_0
    move-exception v1

    .line 150
    .local v1, "e":Landroid/os/RemoteException;
    const-string v6, "PPPOEService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Couldn\'t register interface observer: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/android/server/PPPOEService;)Landroid/net/wifi/PPPOEInfo$Status;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/PPPOEService;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;

    return-object v0
.end method

.method static synthetic access$002(Lcom/android/server/PPPOEService;Landroid/net/wifi/PPPOEInfo$Status;)Landroid/net/wifi/PPPOEInfo$Status;
    .locals 0
    .param p0, "x0"    # Lcom/android/server/PPPOEService;
    .param p1, "x1"    # Landroid/net/wifi/PPPOEInfo$Status;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/server/PPPOEService;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/PPPOEService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/android/server/PPPOEService;->setRouteAndDNS(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(Lcom/android/server/PPPOEService;J)J
    .locals 0
    .param p0, "x0"    # Lcom/android/server/PPPOEService;
    .param p1, "x1"    # J

    .prologue
    .line 64
    iput-wide p1, p0, Lcom/android/server/PPPOEService;->mConnectedtime:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/android/server/PPPOEService;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/PPPOEService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/android/server/PPPOEService;->notifyStatusChanged(Ljava/lang/String;)V

    return-void
.end method

.method private notifyStatusChanged(Ljava/lang/String;)V
    .locals 3
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 221
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.net.wifi.PPPOE_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 222
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "pppoe_state"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 224
    iget-object v1, p0, Lcom/android/server/PPPOEService;->mContext:Landroid/content/Context;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 225
    return-void
.end method

.method private setRouteAndDNS(Ljava/lang/String;)V
    .locals 8
    .param p1, "iface"    # Ljava/lang/String;

    .prologue
    .line 245
    :try_start_0
    iget-object v5, p0, Lcom/android/server/PPPOEService;->mNwService:Landroid/os/INetworkManagementService;

    new-instance v6, Landroid/net/RouteInfo;

    sget-object v7, Ljava/net/Inet4Address;->ANY:Ljava/net/InetAddress;

    invoke-direct {v6, v7}, Landroid/net/RouteInfo;-><init>(Ljava/net/InetAddress;)V

    invoke-interface {v5, p1, v6}, Landroid/os/INetworkManagementService;->addRoute(Ljava/lang/String;Landroid/net/RouteInfo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "net."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".dns1"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 252
    .local v1, "pppDNS1Property":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "net."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".dns2"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 253
    .local v2, "pppDNS2Property":Ljava/lang/String;
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 254
    .local v3, "pppDns1":Ljava/lang/String;
    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 256
    .local v4, "pppDns2":Ljava/lang/String;
    const-string v5, "PPPOEService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setRouteAndDNS get prop "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    const-string v5, "PPPOEService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setRouteAndDNS get prop "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    :try_start_1
    iget-object v5, p0, Lcom/android/server/PPPOEService;->mNwService:Landroid/os/INetworkManagementService;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    const/4 v7, 0x1

    aput-object v4, v6, v7

    const/4 v7, 0x0

    invoke-interface {v5, p1, v6, v7}, Landroid/os/INetworkManagementService;->setDnsServersForInterface(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    iget-object v5, p0, Lcom/android/server/PPPOEService;->mNwService:Landroid/os/INetworkManagementService;

    invoke-interface {v5, p1}, Landroid/os/INetworkManagementService;->setDefaultInterfaceForDns(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 265
    :goto_1
    return-void

    .line 246
    .end local v1    # "pppDNS1Property":Ljava/lang/String;
    .end local v2    # "pppDNS2Property":Ljava/lang/String;
    .end local v3    # "pppDns1":Ljava/lang/String;
    .end local v4    # "pppDns2":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 247
    .local v0, "e":Landroid/os/RemoteException;
    const-string v5, "PPPOEService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "error: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 262
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v1    # "pppDNS1Property":Ljava/lang/String;
    .restart local v2    # "pppDNS2Property":Ljava/lang/String;
    .restart local v3    # "pppDns1":Ljava/lang/String;
    .restart local v4    # "pppDns2":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 263
    .restart local v0    # "e":Landroid/os/RemoteException;
    const-string v5, "PPPOEService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "error: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method public getPPPOEInfo()Landroid/net/wifi/PPPOEInfo;
    .locals 4

    .prologue
    .line 217
    new-instance v0, Landroid/net/wifi/PPPOEInfo;

    iget-object v1, p0, Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;

    iget-wide v2, p0, Lcom/android/server/PPPOEService;->mConnectedtime:J

    invoke-direct {v0, v1, v2, v3}, Landroid/net/wifi/PPPOEInfo;-><init>(Landroid/net/wifi/PPPOEInfo$Status;J)V

    return-object v0
.end method

.method public startPPPOE(Landroid/net/wifi/PPPOEConfig;)V
    .locals 7
    .param p1, "config"    # Landroid/net/wifi/PPPOEConfig;

    .prologue
    .line 192
    sget-object v1, Landroid/net/wifi/PPPOEInfo$Status;->CONNECTING:Landroid/net/wifi/PPPOEInfo$Status;

    iput-object v1, p0, Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;

    .line 196
    :try_start_0
    iget-object v1, p0, Lcom/android/server/PPPOEService;->mNwService:Landroid/os/INetworkManagementService;

    invoke-interface {v1, p1}, Landroid/os/INetworkManagementService;->startPPPOE(Landroid/net/wifi/PPPOEConfig;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 197
    iget-object v1, p0, Lcom/android/server/PPPOEService;->mAlarmManager:Landroid/app/AlarmManager;

    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x7530

    add-long/2addr v3, v5

    iget-object v5, p0, Lcom/android/server/PPPOEService;->mWaitIntent:Landroid/app/PendingIntent;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 205
    :goto_0
    return-void

    .line 199
    :cond_0
    sget-object v1, Landroid/net/wifi/PPPOEInfo$Status;->OFFLINE:Landroid/net/wifi/PPPOEInfo$Status;

    iput-object v1, p0, Lcom/android/server/PPPOEService;->mPppoeStatus:Landroid/net/wifi/PPPOEInfo$Status;

    .line 200
    const-string v1, "PPPOE_STATE_FAILURE"

    invoke-direct {p0, v1}, Lcom/android/server/PPPOEService;->notifyStatusChanged(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "PPPOEService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public stopPPPOE()V
    .locals 4

    .prologue
    .line 209
    :try_start_0
    iget-object v1, p0, Lcom/android/server/PPPOEService;->mNwService:Landroid/os/INetworkManagementService;

    invoke-interface {v1}, Landroid/os/INetworkManagementService;->stopPPPOE()V

    .line 210
    iget-object v1, p0, Lcom/android/server/PPPOEService;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v2, p0, Lcom/android/server/PPPOEService;->mWaitIntent:Landroid/app/PendingIntent;

    invoke-virtual {v1, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    :goto_0
    return-void

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "PPPOEService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
