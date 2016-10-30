.class Lcom/android/server/ServerThread;
.super Ljava/lang/Object;
.source "SystemServer.java"


# static fields
.field private static final ENCRYPTED_STATE:Ljava/lang/String; = "1"

.field private static final ENCRYPTING_STATE:Ljava/lang/String; = "trigger_restart_min_framework"

.field public static final SMARTSHOW_MANAGER_SERVICE:Ljava/lang/String; = "com.powermo.smartshow.frameworks.SmartShowManagerService"

.field private static final TAG:Ljava/lang/String; = "SystemServer"


# instance fields
.field SmartShowManagerInit:Ljava/lang/reflect/Method;

.field SmartShowManagerService:Ljava/lang/Class;

.field mContentResolver:Landroid/content/ContentResolver;

.field mSmartShowManager:Ljava/lang/Object;

.field private mSystemServiceManager:Lcom/android/server/SystemServiceManager;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    iput-object v0, p0, Lcom/android/server/ServerThread;->SmartShowManagerService:Ljava/lang/Class;

    .line 115
    iput-object v0, p0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;

    .line 116
    iput-object v0, p0, Lcom/android/server/ServerThread;->SmartShowManagerInit:Ljava/lang/reflect/Method;

    return-void
.end method

.method static synthetic access$mSystemServiceManager(Lcom/android/server/ServerThread;)Lcom/android/server/SystemServiceManager;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/ServerThread;

    .prologue
    iget-object v0, p0, Lcom/android/server/ServerThread;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    return-object v0
.end method

.method private cleanKidsModeAsDefaultLauncher(Landroid/content/Context;Landroid/content/pm/IPackageManager;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "pm"    # Landroid/content/pm/IPackageManager;

    .prologue
    .line 1226
    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v1, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1227
    .local v1, "intent":Landroid/content/Intent;
    const-string v5, "android.intent.category.HOME"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1228
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v1, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v3

    .line 1229
    .local v3, "launcherList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1230
    :cond_0
    const-string v5, "SystemServer"

    const-string v6, "fanwx: launcherList is null or empty!"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1254
    :cond_1
    :goto_0
    return-void

    .line 1233
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 1234
    .local v4, "resolveInfo":Landroid/content/pm/ResolveInfo;
    const-string v5, "SystemServer"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "fanwx: check app "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/PackageItemInfo;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1237
    const-string v5, "com.zte.android.kidsmode"

    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1239
    new-instance v2, Landroid/content/ComponentName;

    iget-object v5, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/PackageItemInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1242
    .local v2, "kisModeComponent":Landroid/content/ComponentName;
    const-string v5, "SystemServer"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "fanwx: disable app "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/PackageItemInfo;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1245
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->clearPackagePreferredActivities(Ljava/lang/String;)V

    .line 1247
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x2

    const/4 v7, 0x1

    invoke-virtual {v5, v2, v6, v7}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    goto/16 :goto_0
.end method

.method private static final deviceHasSufficientMemory()Z
    .locals 7

    .prologue
    .line 1257
    const-wide/32 v0, 0x20000000

    .line 1259
    .local v0, "MEMORY_SIZE_MIN":J
    new-instance v2, Lcom/android/internal/util/MemInfoReader;

    invoke-direct {v2}, Lcom/android/internal/util/MemInfoReader;-><init>()V

    .line 1260
    .local v2, "minfo":Lcom/android/internal/util/MemInfoReader;
    invoke-virtual {v2}, Lcom/android/internal/util/MemInfoReader;->readMemInfo()V

    .line 1261
    invoke-virtual {v2}, Lcom/android/internal/util/MemInfoReader;->getTotalSize()J

    move-result-wide v3

    const-wide/32 v5, 0x20000000

    cmp-long v3, v3, v5

    if-gtz v3, :cond_0

    .line 1262
    const/4 v3, 0x0

    .line 1264
    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x1

    goto :goto_0
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1215
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1216
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1219
    sget-object v1, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->startServiceAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/ComponentName;

    .line 1220
    return-void
.end method


# virtual methods
.method public initAndLoop()V
    .locals 169

    .prologue
    .line 126
    const/16 v7, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static {v7, v9, v10}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 129
    invoke-static {}, Landroid/os/Looper;->prepareMainLooper()V

    .line 131
    const/4 v7, -0x2

    invoke-static {v7}, Landroid/os/Process;->setThreadPriority(I)V

    .line 134
    const/4 v7, 0x1

    invoke-static {v7}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 135
    const/4 v7, 0x0

    invoke-static {v7}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 139
    const-string v7, "sys.shutdown.requested"

    const-string v9, ""

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v145

    .line 141
    .local v145, "shutdownAction":Ljava/lang/String;
    if-eqz v145, :cond_0

    invoke-virtual/range {v145 .. v145}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_0

    .line 142
    const/4 v7, 0x0

    move-object/from16 v0, v145

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v9, 0x31

    if-ne v7, v9, :cond_26

    const/16 v139, 0x1

    .line 145
    .local v139, "reboot":Z
    :goto_0
    invoke-virtual/range {v145 .. v145}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v9, 0x1

    if-le v7, v9, :cond_27

    .line 146
    const/4 v7, 0x1

    invoke-virtual/range {v145 .. v145}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v145

    invoke-virtual {v0, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v138

    .line 151
    .local v138, "reason":Ljava/lang/String;
    :goto_1
    move/from16 v0, v139

    move-object/from16 v1, v138

    invoke-static {v0, v1}, Lcom/android/server/power/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 155
    .end local v138    # "reason":Ljava/lang/String;
    .end local v139    # "reboot":Z
    :cond_0
    const-string v7, "ro.factorytest"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v105

    .line 156
    .local v105, "factoryTestStr":Ljava/lang/String;
    const-string v7, ""

    move-object/from16 v0, v105

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_28

    const/16 v104, 0x0

    .line 158
    .local v104, "factoryTest":I
    :goto_2
    const-string v7, "1"

    const-string v9, "ro.config.headless"

    const-string v10, "0"

    invoke-static {v9, v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    .line 160
    .local v33, "headless":Z
    const/16 v110, 0x0

    .line 161
    .local v110, "installer":Lcom/android/server/pm/Installer;
    const/16 v63, 0x0

    .line 162
    .local v63, "accountManager":Lcom/android/server/accounts/AccountManagerService;
    const/16 v81, 0x0

    .line 163
    .local v81, "contentService":Lcom/android/server/content/ContentService;
    const/16 v112, 0x0

    .line 164
    .local v112, "lights":Lcom/android/server/LightsService;
    const/4 v4, 0x0

    .line 165
    .local v4, "power":Lcom/android/server/power/PowerManagerService;
    const/16 v97, 0x0

    .line 166
    .local v97, "display":Lcom/android/server/display/DisplayManagerService;
    const/16 v70, 0x0

    .line 167
    .local v70, "battery":Lcom/android/server/BatteryService;
    const/16 v158, 0x0

    .line 168
    .local v158, "vibrator":Lcom/android/server/VibratorService;
    const/16 v65, 0x0

    .line 169
    .local v65, "alarm":Lcom/android/server/AlarmManagerService;
    const/16 v120, 0x0

    .line 170
    .local v120, "mountService":Lcom/android/server/MountService;
    const/16 v30, 0x0

    .line 171
    .local v30, "networkManagement":Lcom/android/server/NetworkManagementService;
    const/16 v29, 0x0

    .line 172
    .local v29, "networkStats":Lcom/android/server/net/NetworkStatsService;
    const/16 v124, 0x0

    .line 173
    .local v124, "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v77, 0x0

    .line 174
    .local v77, "connectivity":Lcom/android/server/ConnectivityService;
    const/16 v134, 0x0

    .line 175
    .local v134, "qcCon":Ljava/lang/Object;
    const/16 v165, 0x0

    .line 176
    .local v165, "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v163, 0x0

    .line 177
    .local v163, "wifi":Lcom/android/server/wifi/WifiService;
    const/16 v144, 0x0

    .line 178
    .local v144, "serviceDiscovery":Lcom/android/server/NsdService;
    const/16 v130, 0x0

    .line 179
    .local v130, "pm":Landroid/content/pm/IPackageManager;
    const/4 v5, 0x0

    .line 180
    .local v5, "context":Landroid/content/Context;
    const/16 v167, 0x0

    .line 181
    .local v167, "wm":Lcom/android/server/wm/WindowManagerService;
    const/16 v71, 0x0

    .line 182
    .local v71, "bluetooth":Lcom/android/server/BluetoothManagerService;
    const/16 v98, 0x0

    .line 183
    .local v98, "dock":Lcom/android/server/DockObserver;
    const/16 v156, 0x0

    .line 184
    .local v156, "usb":Lcom/android/server/usb/UsbService;
    const/16 v142, 0x0

    .line 185
    .local v142, "serial":Lcom/android/server/SerialService;
    const/16 v152, 0x0

    .line 186
    .local v152, "twilight":Lcom/android/server/TwilightService;
    const/16 v154, 0x0

    .line 187
    .local v154, "uiMode":Lcom/android/server/UiModeManagerService;
    const/16 v140, 0x0

    .line 188
    .local v140, "recognition":Lcom/android/server/RecognitionManagerService;
    const/16 v126, 0x0

    .line 189
    .local v126, "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    const/16 v74, 0x0

    .line 190
    .local v74, "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    const/16 v109, 0x0

    .line 191
    .local v109, "inputManager":Lcom/android/server/input/InputManagerService;
    const/16 v148, 0x0

    .line 192
    .local v148, "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    const/16 v122, 0x0

    .line 193
    .local v122, "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    const/16 v79, 0x0

    .line 196
    .local v79, "consumerIr":Lcom/android/server/ConsumerIrService;
    new-instance v168, Landroid/os/HandlerThread;

    const-string v7, "WindowManager"

    move-object/from16 v0, v168

    invoke-direct {v0, v7}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 197
    .local v168, "wmHandlerThread":Landroid/os/HandlerThread;
    invoke-virtual/range {v168 .. v168}, Ljava/lang/Thread;->start()V

    .line 198
    new-instance v21, Landroid/os/Handler;

    invoke-virtual/range {v168 .. v168}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v7

    move-object/from16 v0, v21

    invoke-direct {v0, v7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 199
    .local v21, "wmHandler":Landroid/os/Handler;
    new-instance v7, Lcom/android/server/ServerThread$1;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 216
    const/16 v24, 0x0

    .line 217
    .local v24, "onlyCore":Z
    const/16 v106, 0x0

    .line 222
    .local v106, "firstBoot":Z
    :try_start_0
    const-string v7, "SystemServer"

    const-string v9, "Waiting for installd to be ready."

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    new-instance v111, Lcom/android/server/pm/Installer;

    invoke-direct/range {v111 .. v111}, Lcom/android/server/pm/Installer;-><init>()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_61

    .line 224
    .end local v110    # "installer":Lcom/android/server/pm/Installer;
    .local v111, "installer":Lcom/android/server/pm/Installer;
    :try_start_1
    invoke-virtual/range {v111 .. v111}, Lcom/android/server/pm/Installer;->ping()Z

    .line 226
    const-string v7, "SystemServer"

    const-string v9, "Power Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    new-instance v131, Lcom/android/server/power/PowerManagerService;

    invoke-direct/range {v131 .. v131}, Lcom/android/server/power/PowerManagerService;-><init>()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_62

    .line 228
    .end local v4    # "power":Lcom/android/server/power/PowerManagerService;
    .local v131, "power":Lcom/android/server/power/PowerManagerService;
    :try_start_2
    const-string v7, "power"

    move-object/from16 v0, v131

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 231
    sget-boolean v7, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v7, :cond_1

    .line 232
    const-string v7, "SystemServer"

    const-string v9, "Load SmartShowManager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 234
    :try_start_3
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    const-string v9, "com.powermo.smartshow.frameworks.SmartShowManagerService"

    invoke-virtual {v7, v9}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerService:Ljava/lang/Class;

    .line 235
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerService:Ljava/lang/Class;

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-virtual {v7, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v85

    .line 236
    .local v85, "ctor":Ljava/lang/reflect/Constructor;
    const/4 v7, 0x1

    move-object/from16 v0, v85

    invoke-virtual {v0, v7}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 237
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    move-object/from16 v0, v85

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;

    .line 238
    const-string v9, "SmartShowManager"

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;

    check-cast v7, Landroid/os/IBinder;

    const/4 v10, 0x1

    invoke-static {v9, v7, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1

    .line 245
    .end local v85    # "ctor":Ljava/lang/reflect/Constructor;
    :cond_1
    :goto_3
    :try_start_4
    const-string v7, "SystemServer"

    const-string v9, "Activity Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    invoke-static/range {v104 .. v104}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1

    move-result-object v5

    move-object/from16 v4, v131

    .end local v131    # "power":Lcom/android/server/power/PowerManagerService;
    .restart local v4    # "power":Lcom/android/server/power/PowerManagerService;
    move-object/from16 v110, v111

    .line 252
    .end local v111    # "installer":Lcom/android/server/pm/Installer;
    .restart local v110    # "installer":Lcom/android/server/pm/Installer;
    :goto_4
    const-string v7, "config.disable_storage"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v94

    .line 253
    .local v94, "disableStorage":Z
    const-string v7, "config.disable_media"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v91

    .line 254
    .local v91, "disableMedia":Z
    const-string v7, "config.disable_bluetooth"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v89

    .line 255
    .local v89, "disableBluetooth":Z
    const-string v7, "config.disable_telephony"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v96

    .line 256
    .local v96, "disableTelephony":Z
    const-string v7, "config.disable_location"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v90

    .line 257
    .local v90, "disableLocation":Z
    const-string v7, "config.disable_systemui"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v95

    .line 258
    .local v95, "disableSystemUI":Z
    const-string v7, "config.disable_noncore"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v93

    .line 259
    .local v93, "disableNonCoreServices":Z
    const-string v7, "config.disable_network"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v92

    .line 260
    .local v92, "disableNetwork":Z
    const-string v7, "config.disable_atlas"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v88

    .line 263
    .line 237
    .local v88, "disableAtlas":Z
    :try_start_5
    new-instance v7, Lcom/android/server/SystemServiceManager;

    invoke-direct {v7, v5}, Lcom/android/server/SystemServiceManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v7, Lcom/android/server/SystemServiceManager;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/ServerThread;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-static {v7, v9}, Lcom/android/server/LocalServices;->addService(Ljava/lang/Class;Ljava/lang/Object;)V

    const-string v7, "SystemServer"

    const-string v9, "Display Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    new-instance v11, Lcom/android/server/display/DisplayManagerService;

    move-object/from16 v0, v21

    invoke-direct {v11, v5, v0}, Lcom/android/server/display/DisplayManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_56

    .line 265
    .end local v97    # "display":Lcom/android/server/display/DisplayManagerService;
    .local v11, "display":Lcom/android/server/display/DisplayManagerService;
    :try_start_6
    const-string v7, "display"

    const/4 v9, 0x1

    invoke-static {v7, v11, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;Z)V

    .line 267
    const-string v7, "SystemServer"

    const-string v9, "Telephony Registry"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    new-instance v149, Lcom/android/server/TelephonyRegistry;

    move-object/from16 v0, v149

    invoke-direct {v0, v5}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_57

    .line 269
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v149, "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :try_start_7
    const-string v7, "telephony.registry"

    move-object/from16 v0, v149

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 271
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 272
    const-string v7, "SystemServer"

    const-string v9, "MSimTelephony Registry"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    new-instance v123, Lcom/android/server/MSimTelephonyRegistry;

    move-object/from16 v0, v123

    invoke-direct {v0, v5}, Lcom/android/server/MSimTelephonyRegistry;-><init>(Landroid/content/Context;)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_3

    .line 274
    .end local v122    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    .local v123, "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    :try_start_8
    const-string v7, "telephony.msim.registry"

    move-object/from16 v0, v123

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_58

    move-object/from16 v122, v123

    .line 277
    .end local v123    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    .restart local v122    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    :cond_2
    :try_start_9
    const-string v7, "SystemServer"

    const-string v9, "Scheduling Policy"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    const-string v7, "scheduling_policy"

    new-instance v9, Lcom/android/server/os/SchedulingPolicyService;

    invoke-direct {v9}, Lcom/android/server/os/SchedulingPolicyService;-><init>()V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 280
    invoke-static {v5}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    .line 282
    invoke-virtual {v11}, Lcom/android/server/display/DisplayManagerService;->waitForDefaultDisplay()Z

    move-result v7

    if-nez v7, :cond_3

    .line 283
    const-string v7, "Timeout waiting for default display to be initialized."

    new-instance v9, Ljava/lang/Throwable;

    invoke-direct {v9}, Ljava/lang/Throwable;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v9}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 287
    :cond_3
    const-string v7, "SystemServer"

    const-string v9, "Package Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    const-string v7, "vold.decrypt"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v84

    .line 290
    .local v84, "cryptState":Ljava/lang/String;
    const-string v7, "trigger_restart_min_framework"

    move-object/from16 v0, v84

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_29

    .line 291
    const-string v7, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    const/16 v24, 0x1

    .line 298
    :cond_4
    :goto_5
    if-eqz v104, :cond_2a

    const/4 v7, 0x1

    :goto_6
    move-object/from16 v0, v110

    move/from16 v1, v24

    invoke-static {v5, v0, v7, v1}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;Lcom/android/server/pm/Installer;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_3

    move-result-object v130

    .line 302
    :try_start_a
    invoke-interface/range {v130 .. v130}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_a} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_3

    move-result v106

    .line 306
    :goto_7
    :try_start_b
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 308
    const-string v7, "SystemServer"

    const-string v9, "Entropy Mixer"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    const-string v7, "entropy"

    new-instance v9, Lcom/android/server/EntropyMixer;

    invoke-direct {v9, v5}, Lcom/android/server/EntropyMixer;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 311
    const-string v7, "SystemServer"

    const-string v9, "User Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    const-string v7, "user"

    invoke-static {}, Lcom/android/server/pm/UserManagerService;->getInstance()Lcom/android/server/pm/UserManagerService;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 315
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_3

    .line 320
    :try_start_c
    const-string v7, "SystemServer"

    const-string v9, "Account Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    new-instance v64, Lcom/android/server/accounts/AccountManagerService;

    move-object/from16 v0, v64

    invoke-direct {v0, v5}, Lcom/android/server/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_3

    .line 322
    .end local v63    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .local v64, "accountManager":Lcom/android/server/accounts/AccountManagerService;
    :try_start_d
    const-string v7, "account"

    move-object/from16 v0, v64

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_60
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_59

    move-object/from16 v63, v64

    .line 327
    .end local v64    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .restart local v63    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    :goto_8
    :try_start_e
    const-string v7, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    const/4 v7, 0x1

    move/from16 v0, v104

    if-ne v0, v7, :cond_2b

    const/4 v7, 0x1

    :goto_9
    invoke-static {v5, v7}, Lcom/android/server/content/ContentService;->main(Landroid/content/Context;Z)Lcom/android/server/content/ContentService;

    move-result-object v81

    .line 332
    invoke-static {v5}, Lcom/zte/security/ZTESecurityUtils;->initZTEPrivacyService(Landroid/content/Context;)V

    .line 335
    const-string v7, "SystemServer"

    const-string v9, "System Content Providers"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    .line 338
    const-string v7, "SystemServer"

    const-string v9, "Lights Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    new-instance v6, Lcom/android/server/MiuiLightsService;

    invoke-direct {v6, v5}, Lcom/android/server/MiuiLightsService;-><init>(Landroid/content/Context;)V
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_3

    .line 341
    .end local v112    # "lights":Lcom/android/server/LightsService;
    .local v6, "lights":Lcom/android/server/LightsService;
    :try_start_f
    const-string v7, "SystemServer"

    const-string v9, "Battery Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    new-instance v8, Lcom/android/server/BatteryService;

    invoke-direct {v8, v5, v6}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_5a

    .line 343
    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .local v8, "battery":Lcom/android/server/BatteryService;
    :try_start_10
    const-string v7, "battery"

    invoke-static {v7, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 345
    const-string v7, "SystemServer"

    const-string v9, "Vibrator Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    new-instance v159, Lcom/android/server/VibratorService;

    move-object/from16 v0, v159

    invoke-direct {v0, v5}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V
    :try_end_10
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_10} :catch_5b

    .line 347
    .end local v158    # "vibrator":Lcom/android/server/VibratorService;
    .local v159, "vibrator":Lcom/android/server/VibratorService;
    :try_start_11
    const-string v7, "vibrator"

    move-object/from16 v0, v159

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 349
    const-string v7, "SystemServer"

    const-string v9, "Consumer IR Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    new-instance v80, Lcom/android/server/ConsumerIrService;

    move-object/from16 v0, v80

    invoke-direct {v0, v5}, Lcom/android/server/ConsumerIrService;-><init>(Landroid/content/Context;)V
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_11} :catch_5c

    .line 351
    .end local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .local v80, "consumerIr":Lcom/android/server/ConsumerIrService;
    :try_start_12
    const-string v7, "consumer_ir"

    move-object/from16 v0, v80

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 355
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v9

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/server/am/ActivityManagerService;->getAppOpsService()Lcom/android/internal/app/IAppOpsService;

    move-result-object v10

    invoke-virtual/range {v4 .. v11}, Lcom/android/server/power/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Lcom/android/server/am/ActivityManagerService;Lcom/android/server/BatteryService;Lcom/android/internal/app/IBatteryStats;Lcom/android/internal/app/IAppOpsService;Lcom/android/server/display/DisplayManagerService;)V

    .line 359
    const-string v7, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    new-instance v16, Lcom/android/server/AlarmManagerService;

    move-object/from16 v0, v16

    invoke-direct {v0, v5}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_12} :catch_5d

    .line 361
    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .local v16, "alarm":Lcom/android/server/AlarmManagerService;
    :try_start_13
    const-string v7, "alarm"

    move-object/from16 v0, v16

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 363
    const-string v7, "SystemServer"

    const-string v9, "Init Watchdog"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v12

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v17

    move-object v13, v5

    move-object v14, v8

    move-object v15, v4

    invoke-virtual/range {v12 .. v17}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/power/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    .line 366
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v7

    const-string v9, "WindowManager thread"

    move-object/from16 v0, v21

    invoke-virtual {v7, v0, v9}, Lcom/android/server/Watchdog;->addThread(Landroid/os/Handler;Ljava/lang/String;)V

    .line 368
    const-string v7, "SystemServer"

    const-string v9, "Input Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    new-instance v20, Lcom/android/server/input/MiuiInputManagerService;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v5, v1}, Lcom/android/server/input/MiuiInputManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_13} :catch_5e

    .line 371
    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v20, "inputManager":Lcom/android/server/input/InputManagerService;
    :try_start_14
    const-string v7, "SystemServer"

    const-string v9, "Window Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    const/4 v7, 0x1

    move/from16 v0, v104

    if-eq v0, v7, :cond_2c

    const/16 v22, 0x1

    :goto_a
    if-nez v106, :cond_2d

    const/16 v23, 0x1

    :goto_b
    move-object/from16 v17, v5

    move-object/from16 v18, v4

    move-object/from16 v19, v11

    invoke-static/range {v17 .. v24}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/power/PowerManagerService;Lcom/android/server/display/DisplayManagerService;Lcom/android/server/input/InputManagerService;Landroid/os/Handler;ZZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v167

    .line 375
    const-string v7, "window"

    move-object/from16 v0, v167

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 376
    const-string v7, "input"

    move-object/from16 v0, v20

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 378
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    move-object/from16 v0, v167

    invoke-virtual {v7, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 380
    invoke-virtual/range {v167 .. v167}, Lcom/android/server/wm/WindowManagerService;->getInputMonitor()Lcom/android/server/wm/InputMonitor;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lcom/android/server/input/InputManagerService;->setWindowManagerCallbacks(Lcom/android/server/input/InputManagerService$WindowManagerCallbacks;)V

    .line 381
    invoke-virtual/range {v20 .. v20}, Lcom/android/server/input/InputManagerService;->start()V

    .line 383
    move-object/from16 v0, v167

    invoke-virtual {v11, v0}, Lcom/android/server/display/DisplayManagerService;->setWindowManager(Lcom/android/server/display/DisplayManagerService$WindowManagerFuncs;)V

    .line 384
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lcom/android/server/display/DisplayManagerService;->setInputManager(Lcom/android/server/display/DisplayManagerService$InputManagerFuncs;)V

    .line 387
    sget-boolean v7, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_14} :catch_5

    if-nez v7, :cond_5

    .line 389
    :try_start_15
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerService:Ljava/lang/Class;

    const-string v9, "init"

    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v12, 0x0

    const-class v13, Landroid/content/Context;

    aput-object v13, v10, v12

    const/4 v12, 0x1

    const-class v13, Lcom/android/server/am/ActivityManagerService;

    aput-object v13, v10, v12

    const/4 v12, 0x2

    const-class v13, Lcom/android/server/wm/WindowManagerService;

    aput-object v13, v10, v12

    const/4 v12, 0x3

    const-class v13, Lcom/android/server/display/DisplayManagerService;

    aput-object v13, v10, v12

    invoke-virtual {v7, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerInit:Ljava/lang/reflect/Method;

    .line 391
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerInit:Ljava/lang/reflect/Method;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;

    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v5, v10, v12

    const/4 v12, 0x1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v13

    aput-object v13, v10, v12

    const/4 v12, 0x2

    aput-object v167, v10, v12

    const/4 v12, 0x3

    aput-object v11, v10, v12

    invoke-virtual {v7, v9, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_15} :catch_5

    .line 401
    :cond_5
    :goto_c
    :try_start_16
    const-string v7, "ro.kernel.qemu"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v9, "1"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2e

    .line 402
    const-string v7, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_16} :catch_5

    :goto_d
    move-object/from16 v79, v80

    .end local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v158, v159

    .line 420
    .end local v84    # "cryptState":Ljava/lang/String;
    .end local v159    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v158    # "vibrator":Lcom/android/server/VibratorService;
    :goto_e
    const/16 v86, 0x0

    .line 421
    .local v86, "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    const/16 v146, 0x0

    .line 422
    .local v146, "statusBar":Lcom/android/server/StatusBarManagerService;
    const/16 v107, 0x0

    .line 423
    .local v107, "imm":Lcom/android/server/InputMethodManagerService;
    const/16 v66, 0x0

    .line 424
    .local v66, "appWidget":Lcom/android/server/AppWidgetService;
    const/16 v128, 0x0

    .line 425
    .local v128, "notification":Lcom/android/server/NotificationManagerService;
    const/16 v161, 0x0

    .line 426
    .local v161, "wallpaper":Lcom/android/server/WallpaperManagerService;
    const/16 v113, 0x0

    .line 427
    .local v113, "location":Lcom/android/server/LocationManagerService;
    const/16 v82, 0x0

    .line 428
    .local v82, "countryDetector":Lcom/android/server/CountryDetectorService;
    const/16 v150, 0x0

    .line 429
    .local v150, "tsms":Lcom/android/server/TextServicesManagerService;
    const/16 v115, 0x0

    .line 430
    .local v115, "lockSettings":Lcom/android/server/LockSettingsService;
    const/16 v100, 0x0

    .line 431
    .local v100, "dreamy":Lcom/android/server/dreams/DreamManagerService;
    const/16 v68, 0x0

    .line 432
    .local v68, "atlas":Lcom/android/server/AssetAtlasService;
    const/16 v132, 0x0

    .line 433
    .local v132, "printManager":Lcom/android/server/print/PrintManagerService;
    const/16 v117, 0x0

    .line 436
    .local v117, "mediaRouter":Lcom/android/server/media/MediaRouterService;
    const/4 v7, 0x1

    move/from16 v0, v104

    if-eq v0, v7, :cond_6

    .line 440
    :try_start_17
    const-string v7, "SystemServer"

    const-string v9, "VoiceSense Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    const-string v7, "voicesense"

    new-instance v9, Lcom/android/server/VoiceSenseService;

    invoke-direct {v9, v5}, Lcom/android/server/VoiceSenseService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_6

    .line 451
    :goto_f
    :try_start_18
    const-string v7, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    new-instance v108, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v108

    move-object/from16 v1, v167

    invoke-direct {v0, v5, v1}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_7

    .line 453
    .end local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    .local v108, "imm":Lcom/android/server/InputMethodManagerService;
    :try_start_19
    const-string v7, "input_method"

    move-object/from16 v0, v108

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_19} :catch_55

    move-object/from16 v107, v108

    .line 459
    .end local v108    # "imm":Lcom/android/server/InputMethodManagerService;
    .restart local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    :goto_10
    :try_start_1a
    const-string v7, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    const-string v7, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_1a} :catch_8

    .line 469
    :cond_6
    :goto_11
    :try_start_1b
    invoke-virtual/range {v167 .. v167}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_9

    .line 475
    :goto_12
    :try_start_1c
    invoke-interface/range {v130 .. v130}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_a

    .line 481
    :goto_13
    :try_start_1d
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v7

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x104044f

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v7, v9, v10}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_1d
    .catch Landroid/os/RemoteException; {:try_start_1d .. :try_end_1d} :catch_54

    .line 488
    :goto_14
    const/4 v7, 0x1

    move/from16 v0, v104

    if-eq v0, v7, :cond_36

    .line 489
    if-nez v94, :cond_7

    const-string v7, "0"

    const-string v9, "system_init.startmountservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    .line 496
    :try_start_1e
    const-string v7, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    new-instance v121, Lcom/android/server/MountService;

    move-object/from16 v0, v121

    invoke-direct {v0, v5}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_1e} :catch_b

    .line 498
    .end local v120    # "mountService":Lcom/android/server/MountService;
    .local v121, "mountService":Lcom/android/server/MountService;
    :try_start_1f
    const-string v7, "mount"

    move-object/from16 v0, v121

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_1f} :catch_53

    move-object/from16 v120, v121

    .line 504
    .end local v121    # "mountService":Lcom/android/server/MountService;
    .restart local v120    # "mountService":Lcom/android/server/MountService;
    :cond_7
    :goto_15
    if-nez v93, :cond_8

    .line 506
    :try_start_20
    const-string v7, "SystemServer"

    const-string v9, "LockSettingsService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    new-instance v116, Lcom/android/server/LockSettingsService;

    move-object/from16 v0, v116

    invoke-direct {v0, v5}, Lcom/android/server/LockSettingsService;-><init>(Landroid/content/Context;)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_c

    .line 508
    .end local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    .local v116, "lockSettings":Lcom/android/server/LockSettingsService;
    :try_start_21
    const-string v7, "lock_settings"

    move-object/from16 v0, v116

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_52

    move-object/from16 v115, v116

    .line 514
    .end local v116    # "lockSettings":Lcom/android/server/LockSettingsService;
    .restart local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    :goto_16
    :try_start_22
    const-string v7, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    new-instance v87, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v87

    invoke-direct {v0, v5}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_d

    .line 516
    .end local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .local v87, "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    :try_start_23
    const-string v7, "device_policy"

    move-object/from16 v0, v87

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_51

    move-object/from16 v86, v87

    .line 522
    .end local v87    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .restart local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    :cond_8
    :goto_17
    if-nez v95, :cond_9

    .line 524
    :try_start_24
    const-string v7, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 525
    new-instance v147, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v147

    move-object/from16 v1, v167

    invoke-direct {v0, v5, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_24} :catch_e

    .line 526
    .end local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .local v147, "statusBar":Lcom/android/server/StatusBarManagerService;
    :try_start_25
    const-string v7, "statusbar"

    move-object/from16 v0, v147

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_50

    move-object/from16 v146, v147

    .line 532
    .end local v147    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .restart local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    :cond_9
    :goto_18
    if-nez v93, :cond_a

    .line 534
    :try_start_26
    const-string v7, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    const-string v7, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v5}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_f

    .line 542
    :cond_a
    :goto_19
    if-nez v92, :cond_b

    .line 544
    :try_start_27
    const-string v7, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 545
    invoke-static {v5}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v30

    .line 546
    const-string v7, "network_management"

    move-object/from16 v0, v30

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_27} :catch_10

    .line 552
    :cond_b
    :goto_1a
    if-nez v93, :cond_c

    .line 554
    :try_start_28
    const-string v7, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 555
    new-instance v151, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v151

    invoke-direct {v0, v5}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_11

    .line 556
    .end local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    .local v151, "tsms":Lcom/android/server/TextServicesManagerService;
    :try_start_29
    const-string v7, "textservices"

    move-object/from16 v0, v151

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_29
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_29} :catch_4f

    move-object/from16 v150, v151

    .line 562
    .end local v151    # "tsms":Lcom/android/server/TextServicesManagerService;
    .restart local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    :cond_c
    :goto_1b
    if-nez v92, :cond_35

    .line 564
    :try_start_2a
    const-string v7, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 565
    new-instance v125, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v125

    move-object/from16 v1, v30

    move-object/from16 v2, v16

    invoke-direct {v0, v5, v1, v2}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_2a
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2a} :catch_12

    .line 566
    .end local v29    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    .local v125, "networkStats":Lcom/android/server/net/NetworkStatsService;
    :try_start_2b
    const-string v7, "netstats"

    move-object/from16 v0, v125

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2b} :catch_4e

    move-object/from16 v29, v125

    .line 572
    .end local v125    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    .restart local v29    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    :goto_1c
    :try_start_2c
    const-string v7, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    new-instance v25, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v27

    move-object/from16 v26, v5

    move-object/from16 v28, v4

    invoke-direct/range {v25 .. v30}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_2c
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_2c} :catch_13

    .line 576
    .end local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .local v25, "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_2d
    const-string v7, "netpolicy"

    move-object/from16 v0, v25

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_2d} :catch_4d

    .line 582
    :goto_1d
    :try_start_2e
    const-string v7, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    new-instance v166, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v166

    invoke-direct {v0, v5}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_2e
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_2e} :catch_14

    .line 584
    .end local v165    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    .local v166, "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_2f
    const-string v7, "wifip2p"

    move-object/from16 v0, v166

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_2f} :catch_4c

    move-object/from16 v165, v166

    .line 590
    .end local v166    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v165    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    :goto_1e
    :try_start_30
    const-string v7, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 591
    new-instance v164, Lcom/android/server/wifi/WifiService;

    move-object/from16 v0, v164

    invoke-direct {v0, v5}, Lcom/android/server/wifi/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_30
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_30} :catch_15

    .line 592
    .end local v163    # "wifi":Lcom/android/server/wifi/WifiService;
    .local v164, "wifi":Lcom/android/server/wifi/WifiService;
    :try_start_31
    const-string v7, "wifi"

    move-object/from16 v0, v164

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_31 .. :try_end_31} :catch_4b

    move-object/from16 v163, v164

    .line 598
    .end local v164    # "wifi":Lcom/android/server/wifi/WifiService;
    .restart local v163    # "wifi":Lcom/android/server/wifi/WifiService;
    :goto_1f
    const/16 v103, 0x1

    .line 599
    .local v103, "enableCne":I
    :try_start_32
    invoke-static {}, Lcom/android/server/ServerThread;->deviceHasSufficientMemory()Z

    move-result v7

    if-nez v7, :cond_d

    .line 600
    const-string v7, "persist.cne.override.memlimit"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v103

    .line 602
    :cond_d
    const/4 v7, 0x1

    move/from16 v0, v103

    if-ne v0, v7, :cond_32

    const-string v7, "persist.cne.feature"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v73

    .line 605
    .local v73, "cneFeature":I
    :goto_20
    if-lez v73, :cond_33

    const/16 v7, 0xa

    move/from16 v0, v73

    if-ge v0, v7, :cond_33

    .line 606
    const-string v7, "SystemServer"

    const-string v9, "QcConnectivity Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 607
    new-instance v136, Ldalvik/system/PathClassLoader;

    const-string v7, "/system/framework/services-ext.jar"

    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    move-object/from16 v0, v136

    invoke-direct {v0, v7, v9}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 610
    .local v136, "qcsClassLoader":Ldalvik/system/PathClassLoader;
    const-string v7, "com.android.server.QcConnectivityService"

    move-object/from16 v0, v136

    invoke-virtual {v0, v7}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v135

    .line 612
    .local v135, "qcsClass":Ljava/lang/Class;
    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Landroid/content/Context;

    aput-object v10, v7, v9

    const/4 v9, 0x1

    const-class v10, Landroid/os/INetworkManagementService;

    aput-object v10, v7, v9

    const/4 v9, 0x2

    const-class v10, Landroid/net/INetworkStatsService;

    aput-object v10, v7, v9

    const/4 v9, 0x3

    const-class v10, Landroid/net/INetworkPolicyManager;

    aput-object v10, v7, v9

    move-object/from16 v0, v135

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v137

    .line 615
    .local v137, "qcsConstructor":Ljava/lang/reflect/Constructor;
    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v7, v9

    const/4 v9, 0x1

    aput-object v30, v7, v9

    const/4 v9, 0x2

    aput-object v29, v7, v9

    const/4 v9, 0x3

    aput-object v25, v7, v9

    move-object/from16 v0, v137

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v134

    .line 617
    move-object/from16 v0, v134

    check-cast v0, Lcom/android/server/ConnectivityService;

    move-object/from16 v77, v0

    .line 623
    .end local v134    # "qcCon":Ljava/lang/Object;
    .end local v135    # "qcsClass":Ljava/lang/Class;
    .end local v136    # "qcsClassLoader":Ldalvik/system/PathClassLoader;
    .end local v137    # "qcsConstructor":Ljava/lang/reflect/Constructor;
    :goto_21
    if-eqz v77, :cond_e

    .line 624
    const-string v7, "connectivity"

    move-object/from16 v0, v77

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 625
    move-object/from16 v0, v29

    move-object/from16 v1, v77

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 626
    move-object/from16 v0, v25

    move-object/from16 v1, v77

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 627
    invoke-virtual/range {v163 .. v163}, Lcom/android/server/wifi/WifiService;->checkAndStartWifi()V

    .line 628
    invoke-virtual/range {v165 .. v165}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_32
    .catch Ljava/lang/Throwable; {:try_start_32 .. :try_end_32} :catch_16

    .line 635
    .end local v73    # "cneFeature":I
    :cond_e
    :goto_22
    :try_start_33
    const-string v7, "SystemServer"

    const-string v9, "Network Service Discovery Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    invoke-static {v5}, Lcom/android/server/NsdService;->create(Landroid/content/Context;)Lcom/android/server/NsdService;

    move-result-object v144

    .line 637
    const-string v7, "servicediscovery"

    move-object/from16 v0, v144

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_33
    .catch Ljava/lang/Throwable; {:try_start_33 .. :try_end_33} :catch_17

    .line 644
    .end local v103    # "enableCne":I
    :goto_23
    if-nez v93, :cond_f

    .line 646
    :try_start_34
    const-string v7, "SystemServer"

    const-string v9, "UpdateLock Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 647
    const-string v7, "updatelock"

    new-instance v9, Lcom/android/server/UpdateLockService;

    invoke-direct {v9, v5}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_34
    .catch Ljava/lang/Throwable; {:try_start_34 .. :try_end_34} :catch_18

    .line 659
    :cond_f
    :goto_24
    if-eqz v120, :cond_10

    if-nez v24, :cond_10

    .line 660
    invoke-virtual/range {v120 .. v120}, Lcom/android/server/MountService;->waitForAsecScan()V

    .line 664
    :cond_10
    if-eqz v63, :cond_11

    .line 665
    :try_start_35
    invoke-virtual/range {v63 .. v63}, Lcom/android/server/accounts/AccountManagerService;->systemReady()V
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_35 .. :try_end_35} :catch_19

    .line 671
    :cond_11
    :goto_25
    if-eqz v81, :cond_12

    .line 672
    :try_start_36
    invoke-virtual/range {v81 .. v81}, Lcom/android/server/content/ContentService;->systemReady()V
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_36 .. :try_end_36} :catch_1a

    .line 678
    :cond_12
    :goto_26
    :try_start_37
    const-string v7, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 679
    new-instance v129, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v129

    move-object/from16 v1, v146

    invoke-direct {v0, v5, v1, v6}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_37
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_37} :catch_1b

    .line 680
    .end local v128    # "notification":Lcom/android/server/NotificationManagerService;
    .local v129, "notification":Lcom/android/server/NotificationManagerService;
    :try_start_38
    const-string v7, "notification"

    move-object/from16 v0, v129

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 681
    move-object/from16 v0, v25

    move-object/from16 v1, v129

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_38 .. :try_end_38} :catch_4a

    move-object/from16 v128, v129

    .line 687
    .end local v129    # "notification":Lcom/android/server/NotificationManagerService;
    .restart local v128    # "notification":Lcom/android/server/NotificationManagerService;
    :goto_27
    :try_start_39
    const-string v7, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 688
    const-string v7, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v5}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_39
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_39} :catch_1c

    .line 694
    :goto_28
    if-nez v90, :cond_13

    .line 696
    :try_start_3a
    const-string v7, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 697
    new-instance v114, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v114

    invoke-direct {v0, v5}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3a
    .catch Ljava/lang/Throwable; {:try_start_3a .. :try_end_3a} :catch_1d

    .line 698
    .end local v113    # "location":Lcom/android/server/LocationManagerService;
    .local v114, "location":Lcom/android/server/LocationManagerService;
    :try_start_3b
    const-string v7, "location"

    move-object/from16 v0, v114

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_3b .. :try_end_3b} :catch_49

    move-object/from16 v113, v114

    .line 704
    .end local v114    # "location":Lcom/android/server/LocationManagerService;
    .restart local v113    # "location":Lcom/android/server/LocationManagerService;
    :goto_29
    :try_start_3c
    const-string v7, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    new-instance v83, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v83

    invoke-direct {v0, v5}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_3c
    .catch Ljava/lang/Throwable; {:try_start_3c .. :try_end_3c} :catch_1e

    .line 706
    .end local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .local v83, "countryDetector":Lcom/android/server/CountryDetectorService;
    :try_start_3d
    const-string v7, "country_detector"

    move-object/from16 v0, v83

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_3d .. :try_end_3d} :catch_48

    move-object/from16 v82, v83

    .line 712
    .end local v83    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .restart local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    :cond_13
    :goto_2a
    if-nez v93, :cond_14

    .line 714
    :try_start_3e
    const-string v7, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    const-string v7, "search"

    new-instance v9, Lcom/android/server/search/SearchManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3e
    .catch Ljava/lang/Throwable; {:try_start_3e .. :try_end_3e} :catch_1f

    .line 723
    :cond_14
    :goto_2b
    :try_start_3f
    const-string v7, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    const-string v7, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v12, "/data/system/dropbox"

    invoke-direct {v10, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v5, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_3f .. :try_end_3f} :catch_20

    .line 730
    :goto_2c
    if-nez v93, :cond_15

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v9, 0x1110032

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 733
    :try_start_40
    const-string v7, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    if-nez v33, :cond_15

    .line 735
    new-instance v162, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v162

    invoke-direct {v0, v5}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_40
    .catch Ljava/lang/Throwable; {:try_start_40 .. :try_end_40} :catch_21

    .line 736
    .end local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    .local v162, "wallpaper":Lcom/android/server/WallpaperManagerService;
    :try_start_41
    const-string v7, "wallpaper"

    move-object/from16 v0, v162

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_41
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_41} :catch_47

    move-object/from16 v161, v162

    .line 743
    .end local v162    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    .restart local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    :cond_15
    :goto_2d
    if-nez v91, :cond_16

    const-string v7, "0"

    const-string v9, "system_init.startaudioservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_16

    .line 745
    :try_start_42
    const-string v7, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 746
    const-string v7, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v5}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_42
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_42} :catch_22

    .line 752
    :cond_16
    :goto_2e
    if-nez v93, :cond_17

    .line 754
    :try_start_43
    const-string v7, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 756
    new-instance v99, Lcom/android/server/DockObserver;

    move-object/from16 v0, v99

    invoke-direct {v0, v5}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;)V
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_43 .. :try_end_43} :catch_23

    .end local v98    # "dock":Lcom/android/server/DockObserver;
    .local v99, "dock":Lcom/android/server/DockObserver;
    move-object/from16 v98, v99

    .line 762
    .end local v99    # "dock":Lcom/android/server/DockObserver;
    .restart local v98    # "dock":Lcom/android/server/DockObserver;
    :cond_17
    :goto_2f
    if-nez v91, :cond_18

    .line 764
    :try_start_44
    const-string v7, "SystemServer"

    const-string v9, "Wired Accessory Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 766
    new-instance v7, Lcom/android/server/WiredAccessoryManager;

    move-object/from16 v0, v20

    invoke-direct {v7, v5, v0}, Lcom/android/server/WiredAccessoryManager;-><init>(Landroid/content/Context;Lcom/android/server/input/InputManagerService;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lcom/android/server/input/InputManagerService;->setWiredAccessoryCallbacks(Lcom/android/server/input/InputManagerService$WiredAccessoryCallbacks;)V
    :try_end_44
    .catch Ljava/lang/Throwable; {:try_start_44 .. :try_end_44} :catch_24

    .line 773
    :cond_18
    :goto_30
    if-nez v93, :cond_19

    .line 775
    :try_start_45
    const-string v7, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 777
    new-instance v157, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v157

    invoke-direct {v0, v5}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_45 .. :try_end_45} :catch_25

    .line 778
    .end local v156    # "usb":Lcom/android/server/usb/UsbService;
    .local v157, "usb":Lcom/android/server/usb/UsbService;
    :try_start_46
    const-string v7, "usb"

    move-object/from16 v0, v157

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "miui.usb.service"

    new-instance v9, Lcom/miui/server/MiuiUsbService;

    invoke-direct {v9, v5}, Lcom/miui/server/MiuiUsbService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "miui.os.servicemanager"

    new-instance v9, Landroid/os/MiuiServiceManagerInternal;

    invoke-direct {v9}, Landroid/os/MiuiServiceManagerInternal;-><init>()V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_46 .. :try_end_46} :catch_46

    move-object/from16 v156, v157

    .line 784
    .end local v157    # "usb":Lcom/android/server/usb/UsbService;
    .restart local v156    # "usb":Lcom/android/server/usb/UsbService;
    :goto_31
    :try_start_47
    const-string v7, "SystemServer"

    const-string v9, "Serial Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 786
    new-instance v143, Lcom/android/server/SerialService;

    move-object/from16 v0, v143

    invoke-direct {v0, v5}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_47
    .catch Ljava/lang/Throwable; {:try_start_47 .. :try_end_47} :catch_26

    .line 787
    .end local v142    # "serial":Lcom/android/server/SerialService;
    .local v143, "serial":Lcom/android/server/SerialService;
    :try_start_48
    const-string v7, "serial"

    move-object/from16 v0, v143

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_48
    .catch Ljava/lang/Throwable; {:try_start_48 .. :try_end_48} :catch_45

    move-object/from16 v142, v143

    .line 794
    .end local v143    # "serial":Lcom/android/server/SerialService;
    .restart local v142    # "serial":Lcom/android/server/SerialService;
    :cond_19
    :goto_32
    move/from16 v0, v24

    invoke-static {v5, v0}, Lcom/android/server/SystemServerInjector;->addExtraServices(Landroid/content/Context;Z)V

    :try_start_49
    const-string v7, "SystemServer"

    const-string v9, "Twilight Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 795
    new-instance v153, Lcom/android/server/TwilightService;

    move-object/from16 v0, v153

    invoke-direct {v0, v5}, Lcom/android/server/TwilightService;-><init>(Landroid/content/Context;)V
    :try_end_49
    .catch Ljava/lang/Throwable; {:try_start_49 .. :try_end_49} :catch_27

    .end local v152    # "twilight":Lcom/android/server/TwilightService;
    .local v153, "twilight":Lcom/android/server/TwilightService;
    move-object/from16 v152, v153

    .line 801
    .end local v153    # "twilight":Lcom/android/server/TwilightService;
    .restart local v152    # "twilight":Lcom/android/server/TwilightService;
    :goto_33
    :try_start_4a
    const-string v7, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 803
    new-instance v155, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v155

    move-object/from16 v1, v152

    invoke-direct {v0, v5, v1}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;Lcom/android/server/TwilightService;)V
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_4a} :catch_28

    .end local v154    # "uiMode":Lcom/android/server/UiModeManagerService;
    .local v155, "uiMode":Lcom/android/server/UiModeManagerService;
    move-object/from16 v154, v155

    .line 808
    .end local v155    # "uiMode":Lcom/android/server/UiModeManagerService;
    .restart local v154    # "uiMode":Lcom/android/server/UiModeManagerService;
    :goto_34
    if-nez v93, :cond_1a

    .line 810
    :try_start_4b
    const-string v7, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 811
    const-string v7, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_4b .. :try_end_4b} :catch_29

    .line 818
    :goto_35
    :try_start_4c
    const-string v7, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 819
    new-instance v67, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v67

    invoke-direct {v0, v5}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_4c .. :try_end_4c} :catch_2a

    .line 820
    .end local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    .local v67, "appWidget":Lcom/android/server/AppWidgetService;
    :try_start_4d
    const-string v7, "appwidget"

    move-object/from16 v0, v67

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_4d .. :try_end_4d} :catch_44

    move-object/from16 v66, v67

    .line 826
    .end local v67    # "appWidget":Lcom/android/server/AppWidgetService;
    .restart local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    :goto_36
    :try_start_4e
    const-string v7, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    new-instance v141, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v141

    invoke-direct {v0, v5}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_4e
    .catch Ljava/lang/Throwable; {:try_start_4e .. :try_end_4e} :catch_2b

    .end local v140    # "recognition":Lcom/android/server/RecognitionManagerService;
    .local v141, "recognition":Lcom/android/server/RecognitionManagerService;
    move-object/from16 v140, v141

    .line 834
    .end local v141    # "recognition":Lcom/android/server/RecognitionManagerService;
    .restart local v140    # "recognition":Lcom/android/server/RecognitionManagerService;
    :cond_1a
    :goto_37
    :try_start_4f
    const-string v7, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 835
    const-string v7, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v5}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4f
    .catch Ljava/lang/Throwable; {:try_start_4f .. :try_end_4f} :catch_2c

    .line 845
    :goto_38
    :try_start_50
    const-string v7, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 846
    const-string v7, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v5}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_50
    .catch Ljava/lang/Throwable; {:try_start_50 .. :try_end_50} :catch_2d

    .line 852
    :goto_39
    if-nez v92, :cond_1b

    .line 854
    :try_start_51
    const-string v7, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 855
    new-instance v127, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v127

    invoke-direct {v0, v5}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_51
    .catch Ljava/lang/Throwable; {:try_start_51 .. :try_end_51} :catch_2e

    .end local v126    # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .local v127, "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v126, v127

    .line 861
    .end local v127    # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .restart local v126    # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    :cond_1b
    :goto_3a
    if-nez v91, :cond_1c

    .line 863
    :try_start_52
    const-string v7, "SystemServer"

    const-string v9, "CommonTimeManagementService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 864
    new-instance v75, Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, v75

    invoke-direct {v0, v5}, Lcom/android/server/CommonTimeManagementService;-><init>(Landroid/content/Context;)V
    :try_end_52
    .catch Ljava/lang/Throwable; {:try_start_52 .. :try_end_52} :catch_2f

    .line 865
    .end local v74    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    .local v75, "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    :try_start_53
    const-string v7, "commontime_management"

    move-object/from16 v0, v75

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_53
    .catch Ljava/lang/Throwable; {:try_start_53 .. :try_end_53} :catch_43

    move-object/from16 v74, v75

    .line 871
    .end local v75    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    .restart local v74    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    :cond_1c
    :goto_3b
    if-nez v92, :cond_1d

    .line 873
    :try_start_54
    const-string v7, "SystemServer"

    const-string v9, "CertBlacklister"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 874
    new-instance v7, Lcom/android/server/CertBlacklister;

    invoke-direct {v7, v5}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_54
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_54} :catch_30

    .line 880
    :cond_1d
    :goto_3c
    if-nez v93, :cond_1e

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v9, 0x111004b

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    if-eqz v7, :cond_1e

    .line 883
    :try_start_55
    const-string v7, "SystemServer"

    const-string v9, "Dreams Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 885
    new-instance v101, Lcom/android/server/dreams/DreamManagerService;

    move-object/from16 v0, v101

    move-object/from16 v1, v21

    invoke-direct {v0, v5, v1}, Lcom/android/server/dreams/DreamManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_55 .. :try_end_55} :catch_31

    .line 886
    .end local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .local v101, "dreamy":Lcom/android/server/dreams/DreamManagerService;
    :try_start_56
    const-string v7, "dreams"

    move-object/from16 v0, v101

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_56} :catch_42

    move-object/from16 v100, v101

    .line 892
    .end local v101    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .restart local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    :cond_1e
    :goto_3d
    if-nez v93, :cond_1f

    if-nez v88, :cond_1f

    .line 894
    :try_start_57
    const-string v7, "SystemServer"

    const-string v9, "Assets Atlas Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 895
    new-instance v69, Lcom/android/server/AssetAtlasService;

    move-object/from16 v0, v69

    invoke-direct {v0, v5}, Lcom/android/server/AssetAtlasService;-><init>(Landroid/content/Context;)V
    :try_end_57
    .catch Ljava/lang/Throwable; {:try_start_57 .. :try_end_57} :catch_32

    .line 896
    .end local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    .local v69, "atlas":Lcom/android/server/AssetAtlasService;
    :try_start_58
    const-string v7, "assetatlas"

    move-object/from16 v0, v69

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_58
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_58} :catch_41

    move-object/from16 v68, v69

    .line 903
    .end local v69    # "atlas":Lcom/android/server/AssetAtlasService;
    .restart local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    :cond_1f
    :goto_3e
    :try_start_59
    const-string v7, "SystemServer"

    const-string v9, "IdleMaintenanceService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 904
    new-instance v7, Lcom/android/server/IdleMaintenanceService;

    invoke-direct {v7, v5, v8}, Lcom/android/server/IdleMaintenanceService;-><init>(Landroid/content/Context;Lcom/android/server/BatteryService;)V
    :try_end_59
    .catch Ljava/lang/Throwable; {:try_start_59 .. :try_end_59} :catch_33

    .line 910
    :goto_3f
    :try_start_5a
    const-string v7, "SystemServer"

    const-string v9, "Print Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 911
    new-instance v133, Lcom/android/server/print/PrintManagerService;

    move-object/from16 v0, v133

    invoke-direct {v0, v5}, Lcom/android/server/print/PrintManagerService;-><init>(Landroid/content/Context;)V
    :try_end_5a
    .catch Ljava/lang/Throwable; {:try_start_5a .. :try_end_5a} :catch_34

    .line 912
    .end local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    .local v133, "printManager":Lcom/android/server/print/PrintManagerService;
    :try_start_5b
    const-string v7, "print"

    move-object/from16 v0, v133

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5b
    .catch Ljava/lang/Throwable; {:try_start_5b .. :try_end_5b} :catch_40

    move-object/from16 v132, v133

    .line 917
    .end local v133    # "printManager":Lcom/android/server/print/PrintManagerService;
    .restart local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    :goto_40
    if-nez v93, :cond_20

    .line 919
    :try_start_5c
    const-string v7, "SystemServer"

    const-string v9, "Media Router Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 920
    new-instance v118, Lcom/android/server/media/MediaRouterService;

    move-object/from16 v0, v118

    invoke-direct {v0, v5}, Lcom/android/server/media/MediaRouterService;-><init>(Landroid/content/Context;)V
    :try_end_5c
    .catch Ljava/lang/Throwable; {:try_start_5c .. :try_end_5c} :catch_35

    .line 921
    .end local v117    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .local v118, "mediaRouter":Lcom/android/server/media/MediaRouterService;
    :try_start_5d
    const-string v7, "media_router"

    move-object/from16 v0, v118

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5d
    .catch Ljava/lang/Throwable; {:try_start_5d .. :try_end_5d} :catch_3f

    move-object/from16 v117, v118

    .line 930
    .end local v118    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .restart local v117    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    :cond_20
    :goto_41
    invoke-virtual/range {v167 .. v167}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v47

    .line 931
    .local v47, "safeMode":Z
    if-eqz v47, :cond_34

    .line 932
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 934
    const/4 v7, 0x1

    sput-boolean v7, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 936
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v7

    invoke-virtual {v7}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    .line 945
    :goto_42
    :try_start_5e
    invoke-virtual/range {v158 .. v158}, Lcom/android/server/VibratorService;->systemReady()V
    :try_end_5e
    .catch Ljava/lang/Throwable; {:try_start_5e .. :try_end_5e} :catch_36

    .line 950
    :goto_43
    if-eqz v115, :cond_21

    .line 952
    :try_start_5f
    invoke-virtual/range {v115 .. v115}, Lcom/android/server/LockSettingsService;->systemReady()V
    :try_end_5f
    .catch Ljava/lang/Throwable; {:try_start_5f .. :try_end_5f} :catch_37

    .line 958
    :cond_21
    :goto_44
    if-eqz v86, :cond_22

    .line 960
    :try_start_60
    invoke-virtual/range {v86 .. v86}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_60
    .catch Ljava/lang/Throwable; {:try_start_60 .. :try_end_60} :catch_38

    .line 966
    :cond_22
    :goto_45
    if-eqz v128, :cond_23

    .line 968
    :try_start_61
    invoke-virtual/range {v128 .. v128}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_61
    .catch Ljava/lang/Throwable; {:try_start_61 .. :try_end_61} :catch_39

    .line 975
    :cond_23
    :goto_46
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/job/JobSchedulerService;

    invoke-virtual {v7, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const/16 v9, 0x1f4

    invoke-virtual {v7, v9}, Lcom/android/server/SystemServiceManager;->startBootPhase(I)V

    .line 907
    :try_start_62
    invoke-virtual/range {v167 .. v167}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_62
    .catch Ljava/lang/Throwable; {:try_start_62 .. :try_end_62} :catch_3a

    .line 980
    :goto_47
    if-eqz v47, :cond_24

    .line 981
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 987
    :cond_24
    invoke-virtual/range {v167 .. v167}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v76

    .line 988
    .local v76, "config":Landroid/content/res/Configuration;
    new-instance v119, Landroid/util/DisplayMetrics;

    invoke-direct/range {v119 .. v119}, Landroid/util/DisplayMetrics;-><init>()V

    .line 989
    .local v119, "metrics":Landroid/util/DisplayMetrics;
    const-string v7, "window"

    invoke-virtual {v5, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v160

    check-cast v160, Landroid/view/WindowManager;

    .line 990
    .local v160, "w":Landroid/view/WindowManager;
    invoke-interface/range {v160 .. v160}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    move-object/from16 v0, v119

    invoke-virtual {v7, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 991
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    move-object/from16 v0, v76

    move-object/from16 v1, v119

    invoke-virtual {v7, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 994
    :try_start_63
    move-object/from16 v0, v152

    move-object/from16 v1, v100

    invoke-virtual {v4, v0, v1}, Lcom/android/server/power/PowerManagerService;->systemReady(Lcom/android/server/TwilightService;Lcom/android/server/dreams/DreamManagerService;)V
    :try_end_63
    .catch Ljava/lang/Throwable; {:try_start_63 .. :try_end_63} :catch_3b

    .line 1000
    :goto_48
    :try_start_64
    invoke-interface/range {v130 .. v130}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_64
    .catch Ljava/lang/Throwable; {:try_start_64 .. :try_end_64} :catch_3c

    .line 1006
    :goto_49
    :try_start_65
    move/from16 v0, v47

    move/from16 v1, v24

    invoke-virtual {v11, v0, v1}, Lcom/android/server/display/DisplayManagerService;->systemReady(ZZ)V
    :try_end_65
    .catch Ljava/lang/Throwable; {:try_start_65 .. :try_end_65} :catch_3d

    .line 1012
    :goto_4a
    move-object/from16 v0, p0

    move-object/from16 v1, v130

    invoke-direct {v0, v5, v1}, Lcom/android/server/ServerThread;->cleanKidsModeAsDefaultLauncher(Landroid/content/Context;Landroid/content/pm/IPackageManager;)V

    .line 1015
    move-object/from16 v34, v5

    .line 1016
    .local v34, "contextF":Landroid/content/Context;
    move-object/from16 v35, v120

    .line 1017
    .local v35, "mountServiceF":Lcom/android/server/MountService;
    move-object/from16 v36, v8

    .line 1018
    .local v36, "batteryF":Lcom/android/server/BatteryService;
    move-object/from16 v37, v30

    .line 1019
    .local v37, "networkManagementF":Lcom/android/server/NetworkManagementService;
    move-object/from16 v38, v29

    .line 1020
    .local v38, "networkStatsF":Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v39, v25

    .line 1021
    .local v39, "networkPolicyF":Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v40, v77

    .line 1022
    .local v40, "connectivityF":Lcom/android/server/ConnectivityService;
    move-object/from16 v41, v98

    .line 1023
    .local v41, "dockF":Lcom/android/server/DockObserver;
    move-object/from16 v42, v156

    .line 1024
    .local v42, "usbF":Lcom/android/server/usb/UsbService;
    move-object/from16 v43, v152

    .line 1025
    .local v43, "twilightF":Lcom/android/server/TwilightService;
    move-object/from16 v44, v154

    .line 1026
    .local v44, "uiModeF":Lcom/android/server/UiModeManagerService;
    move-object/from16 v46, v66

    .line 1027
    .local v46, "appWidgetF":Lcom/android/server/AppWidgetService;
    move-object/from16 v48, v161

    .line 1028
    .local v48, "wallpaperF":Lcom/android/server/WallpaperManagerService;
    move-object/from16 v49, v107

    .line 1029
    .local v49, "immF":Lcom/android/server/InputMethodManagerService;
    move-object/from16 v45, v140

    .line 1030
    .local v45, "recognitionF":Lcom/android/server/RecognitionManagerService;
    move-object/from16 v51, v113

    .line 1031
    .local v51, "locationF":Lcom/android/server/LocationManagerService;
    move-object/from16 v52, v82

    .line 1032
    .local v52, "countryDetectorF":Lcom/android/server/CountryDetectorService;
    move-object/from16 v53, v126

    .line 1033
    .local v53, "networkTimeUpdaterF":Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v54, v74

    .line 1034
    .local v54, "commonTimeMgmtServiceF":Lcom/android/server/CommonTimeManagementService;
    move-object/from16 v55, v150

    .line 1035
    .local v55, "textServiceManagerServiceF":Lcom/android/server/TextServicesManagerService;
    move-object/from16 v50, v146

    .line 1036
    .local v50, "statusBarF":Lcom/android/server/StatusBarManagerService;
    move-object/from16 v56, v100

    .line 1037
    .local v56, "dreamyF":Lcom/android/server/dreams/DreamManagerService;
    move-object/from16 v57, v68

    .line 1038
    .local v57, "atlasF":Lcom/android/server/AssetAtlasService;
    move-object/from16 v58, v20

    .line 1039
    .local v58, "inputManagerF":Lcom/android/server/input/InputManagerService;
    move-object/from16 v59, v148

    .line 1040
    .local v59, "telephonyRegistryF":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v60, v122

    .line 1041
    .local v60, "msimTelephonyRegistryF":Lcom/android/server/MSimTelephonyRegistry;
    move-object/from16 v61, v132

    .line 1042
    .local v61, "printManagerF":Lcom/android/server/print/PrintManagerService;
    move-object/from16 v62, v117

    .line 1049
    .local v62, "mediaRouterF":Lcom/android/server/media/MediaRouterService;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    new-instance v31, Lcom/android/server/ServerThread$2;

    move-object/from16 v32, p0

    invoke-direct/range {v31 .. v62}, Lcom/android/server/ServerThread$2;-><init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/MountService;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/TwilightService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Lcom/android/server/dreams/DreamManagerService;Lcom/android/server/AssetAtlasService;Lcom/android/server/input/InputManagerService;Lcom/android/server/TelephonyRegistry;Lcom/android/server/MSimTelephonyRegistry;Lcom/android/server/print/PrintManagerService;Lcom/android/server/media/MediaRouterService;)V

    move-object/from16 v0, v31

    invoke-virtual {v7, v0}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 1206
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v7

    if-eqz v7, :cond_25

    .line 1207
    const-string v7, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1210
    :cond_25
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 1211
    const-string v7, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v7, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1212
    return-void

    .line 142
    .end local v4    # "power":Lcom/android/server/power/PowerManagerService;
    .end local v5    # "context":Landroid/content/Context;
    .end local v6    # "lights":Lcom/android/server/LightsService;
    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v11    # "display":Lcom/android/server/display/DisplayManagerService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v21    # "wmHandler":Landroid/os/Handler;
    .end local v24    # "onlyCore":Z
    .end local v25    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v29    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    .end local v30    # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v33    # "headless":Z
    .end local v34    # "contextF":Landroid/content/Context;
    .end local v35    # "mountServiceF":Lcom/android/server/MountService;
    .end local v36    # "batteryF":Lcom/android/server/BatteryService;
    .end local v37    # "networkManagementF":Lcom/android/server/NetworkManagementService;
    .end local v38    # "networkStatsF":Lcom/android/server/net/NetworkStatsService;
    .end local v39    # "networkPolicyF":Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v40    # "connectivityF":Lcom/android/server/ConnectivityService;
    .end local v41    # "dockF":Lcom/android/server/DockObserver;
    .end local v42    # "usbF":Lcom/android/server/usb/UsbService;
    .end local v43    # "twilightF":Lcom/android/server/TwilightService;
    .end local v44    # "uiModeF":Lcom/android/server/UiModeManagerService;
    .end local v45    # "recognitionF":Lcom/android/server/RecognitionManagerService;
    .end local v46    # "appWidgetF":Lcom/android/server/AppWidgetService;
    .end local v47    # "safeMode":Z
    .end local v48    # "wallpaperF":Lcom/android/server/WallpaperManagerService;
    .end local v49    # "immF":Lcom/android/server/InputMethodManagerService;
    .end local v50    # "statusBarF":Lcom/android/server/StatusBarManagerService;
    .end local v51    # "locationF":Lcom/android/server/LocationManagerService;
    .end local v52    # "countryDetectorF":Lcom/android/server/CountryDetectorService;
    .end local v53    # "networkTimeUpdaterF":Lcom/android/server/NetworkTimeUpdateService;
    .end local v54    # "commonTimeMgmtServiceF":Lcom/android/server/CommonTimeManagementService;
    .end local v55    # "textServiceManagerServiceF":Lcom/android/server/TextServicesManagerService;
    .end local v56    # "dreamyF":Lcom/android/server/dreams/DreamManagerService;
    .end local v57    # "atlasF":Lcom/android/server/AssetAtlasService;
    .end local v58    # "inputManagerF":Lcom/android/server/input/InputManagerService;
    .end local v59    # "telephonyRegistryF":Lcom/android/server/TelephonyRegistry;
    .end local v60    # "msimTelephonyRegistryF":Lcom/android/server/MSimTelephonyRegistry;
    .end local v61    # "printManagerF":Lcom/android/server/print/PrintManagerService;
    .end local v62    # "mediaRouterF":Lcom/android/server/media/MediaRouterService;
    .end local v63    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .end local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    .end local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    .end local v71    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    .end local v74    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    .end local v76    # "config":Landroid/content/res/Configuration;
    .end local v77    # "connectivity":Lcom/android/server/ConnectivityService;
    .end local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .end local v81    # "contentService":Lcom/android/server/content/ContentService;
    .end local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .end local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .end local v88    # "disableAtlas":Z
    .end local v89    # "disableBluetooth":Z
    .end local v90    # "disableLocation":Z
    .end local v91    # "disableMedia":Z
    .end local v92    # "disableNetwork":Z
    .end local v93    # "disableNonCoreServices":Z
    .end local v94    # "disableStorage":Z
    .end local v95    # "disableSystemUI":Z
    .end local v96    # "disableTelephony":Z
    .end local v98    # "dock":Lcom/android/server/DockObserver;
    .end local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .end local v104    # "factoryTest":I
    .end local v105    # "factoryTestStr":Ljava/lang/String;
    .end local v106    # "firstBoot":Z
    .end local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    .end local v110    # "installer":Lcom/android/server/pm/Installer;
    .end local v113    # "location":Lcom/android/server/LocationManagerService;
    .end local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    .end local v117    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .end local v119    # "metrics":Landroid/util/DisplayMetrics;
    .end local v120    # "mountService":Lcom/android/server/MountService;
    .end local v122    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    .end local v126    # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .end local v128    # "notification":Lcom/android/server/NotificationManagerService;
    .end local v130    # "pm":Landroid/content/pm/IPackageManager;
    .end local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    .end local v140    # "recognition":Lcom/android/server/RecognitionManagerService;
    .end local v142    # "serial":Lcom/android/server/SerialService;
    .end local v144    # "serviceDiscovery":Lcom/android/server/NsdService;
    .end local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    .end local v152    # "twilight":Lcom/android/server/TwilightService;
    .end local v154    # "uiMode":Lcom/android/server/UiModeManagerService;
    .end local v156    # "usb":Lcom/android/server/usb/UsbService;
    .end local v158    # "vibrator":Lcom/android/server/VibratorService;
    .end local v160    # "w":Landroid/view/WindowManager;
    .end local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    .end local v163    # "wifi":Lcom/android/server/wifi/WifiService;
    .end local v165    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    .end local v167    # "wm":Lcom/android/server/wm/WindowManagerService;
    .end local v168    # "wmHandlerThread":Landroid/os/HandlerThread;
    :cond_26
    const/16 v139, 0x0

    goto/16 :goto_0

    .line 148
    .restart local v139    # "reboot":Z
    :cond_27
    const/16 v138, 0x0

    .restart local v138    # "reason":Ljava/lang/String;
    goto/16 :goto_1

    .line 156
    .end local v138    # "reason":Ljava/lang/String;
    .end local v139    # "reboot":Z
    .restart local v105    # "factoryTestStr":Ljava/lang/String;
    :cond_28
    invoke-static/range {v105 .. v105}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v104

    goto/16 :goto_2

    .line 239
    .restart local v5    # "context":Landroid/content/Context;
    .restart local v21    # "wmHandler":Landroid/os/Handler;
    .restart local v24    # "onlyCore":Z
    .restart local v29    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    .restart local v30    # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v33    # "headless":Z
    .restart local v63    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v71    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    .restart local v74    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    .restart local v77    # "connectivity":Lcom/android/server/ConnectivityService;
    .restart local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v81    # "contentService":Lcom/android/server/content/ContentService;
    .restart local v97    # "display":Lcom/android/server/display/DisplayManagerService;
    .restart local v98    # "dock":Lcom/android/server/DockObserver;
    .restart local v104    # "factoryTest":I
    .restart local v106    # "firstBoot":Z
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v111    # "installer":Lcom/android/server/pm/Installer;
    .restart local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v120    # "mountService":Lcom/android/server/MountService;
    .restart local v122    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    .restart local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v126    # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .restart local v130    # "pm":Landroid/content/pm/IPackageManager;
    .restart local v131    # "power":Lcom/android/server/power/PowerManagerService;
    .restart local v134    # "qcCon":Ljava/lang/Object;
    .restart local v140    # "recognition":Lcom/android/server/RecognitionManagerService;
    .restart local v142    # "serial":Lcom/android/server/SerialService;
    .restart local v144    # "serviceDiscovery":Lcom/android/server/NsdService;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v152    # "twilight":Lcom/android/server/TwilightService;
    .restart local v154    # "uiMode":Lcom/android/server/UiModeManagerService;
    .restart local v156    # "usb":Lcom/android/server/usb/UsbService;
    .restart local v158    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v163    # "wifi":Lcom/android/server/wifi/WifiService;
    .restart local v165    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v167    # "wm":Lcom/android/server/wm/WindowManagerService;
    .restart local v168    # "wmHandlerThread":Landroid/os/HandlerThread;
    :catch_0
    move-exception v102

    .line 240
    .local v102, "e":Ljava/lang/Exception;
    :try_start_66
    const-string v7, "System"

    const-string v9, "Failed to load SmartShowManager"

    invoke-static {v7, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    const/4 v7, 0x0

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;
    :try_end_66
    .catch Ljava/lang/RuntimeException; {:try_start_66 .. :try_end_66} :catch_1

    goto/16 :goto_3

    .line 247
    .end local v102    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v102

    move-object/from16 v4, v131

    .end local v131    # "power":Lcom/android/server/power/PowerManagerService;
    .restart local v4    # "power":Lcom/android/server/power/PowerManagerService;
    move-object/from16 v110, v111

    .line 248
    .end local v111    # "installer":Lcom/android/server/pm/Installer;
    .local v102, "e":Ljava/lang/RuntimeException;
    .restart local v110    # "installer":Lcom/android/server/pm/Installer;
    :goto_4b
    const-string v7, "System"

    const-string v9, "******************************************"

    invoke-static {v7, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    const-string v7, "System"

    const-string v9, "************ Failure starting bootstrap service"

    move-object/from16 v0, v102

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4

    .line 293
    .end local v97    # "display":Lcom/android/server/display/DisplayManagerService;
    .end local v102    # "e":Ljava/lang/RuntimeException;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v11    # "display":Lcom/android/server/display/DisplayManagerService;
    .restart local v84    # "cryptState":Ljava/lang/String;
    .restart local v88    # "disableAtlas":Z
    .restart local v89    # "disableBluetooth":Z
    .restart local v90    # "disableLocation":Z
    .restart local v91    # "disableMedia":Z
    .restart local v92    # "disableNetwork":Z
    .restart local v93    # "disableNonCoreServices":Z
    .restart local v94    # "disableStorage":Z
    .restart local v95    # "disableSystemUI":Z
    .restart local v96    # "disableTelephony":Z
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :cond_29
    :try_start_67
    const-string v7, "1"

    move-object/from16 v0, v84

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 294
    const-string v7, "SystemServer"

    const-string v9, "Device encrypted - only parsing core apps"

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    const/16 v24, 0x1

    goto/16 :goto_5

    .line 298
    :cond_2a
    const/4 v7, 0x0

    goto/16 :goto_6

    .line 323
    :catch_2
    move-exception v102

    .line 324
    .local v102, "e":Ljava/lang/Throwable;
    :goto_4c
    const-string v7, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v102

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_67
    .catch Ljava/lang/RuntimeException; {:try_start_67 .. :try_end_67} :catch_3

    goto/16 :goto_8

    .line 415
    .end local v84    # "cryptState":Ljava/lang/String;
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_3
    move-exception v102

    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    move-object/from16 v6, v112

    .line 416
    .end local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v6    # "lights":Lcom/android/server/LightsService;
    .local v102, "e":Ljava/lang/RuntimeException;
    :goto_4d
    const-string v7, "System"

    const-string v9, "******************************************"

    invoke-static {v7, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    const-string v7, "System"

    const-string v9, "************ Failure starting core service"

    move-object/from16 v0, v102

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_e

    .line 328
    .end local v6    # "lights":Lcom/android/server/LightsService;
    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v102    # "e":Ljava/lang/RuntimeException;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v84    # "cryptState":Ljava/lang/String;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :cond_2b
    const/4 v7, 0x0

    goto/16 :goto_9

    .line 372
    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .end local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v112    # "lights":Lcom/android/server/LightsService;
    .end local v158    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v6    # "lights":Lcom/android/server/LightsService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v159    # "vibrator":Lcom/android/server/VibratorService;
    :cond_2c
    const/16 v22, 0x0

    goto/16 :goto_a

    :cond_2d
    const/16 v23, 0x0

    goto/16 :goto_b

    .line 392
    :catch_4
    move-exception v102

    .line 393
    .local v102, "e":Ljava/lang/Throwable;
    :try_start_68
    const-string v7, "failed to init smartshow"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 415
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_5
    move-exception v102

    move-object/from16 v79, v80

    .end local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v158, v159

    .end local v159    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v158    # "vibrator":Lcom/android/server/VibratorService;
    goto :goto_4d

    .line 403
    .end local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v158    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v159    # "vibrator":Lcom/android/server/VibratorService;
    :cond_2e
    const/4 v7, 0x1

    move/from16 v0, v104

    if-ne v0, v7, :cond_2f

    .line 404
    const-string v7, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d

    .line 405
    :cond_2f
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const-string v9, "android.hardware.bluetooth"

    invoke-virtual {v7, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_30

    .line 407
    const-string v7, "SystemServer"

    const-string v9, "No Bluetooth Service (Bluetooth Hardware Not Present)"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d

    .line 408
    :cond_30
    if-eqz v89, :cond_31

    .line 409
    const-string v7, "SystemServer"

    const-string v9, "Bluetooth Service disabled by config"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d

    .line 411
    :cond_31
    const-string v7, "SystemServer"

    const-string v9, "Bluetooth Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    new-instance v72, Lcom/android/server/BluetoothManagerService;

    move-object/from16 v0, v72

    invoke-direct {v0, v5}, Lcom/android/server/BluetoothManagerService;-><init>(Landroid/content/Context;)V
    :try_end_68
    .catch Ljava/lang/RuntimeException; {:try_start_68 .. :try_end_68} :catch_5

    .line 413
    .end local v71    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    .local v72, "bluetooth":Lcom/android/server/BluetoothManagerService;
    :try_start_69
    const-string v7, "bluetooth_manager"

    move-object/from16 v0, v72

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_69
    .catch Ljava/lang/RuntimeException; {:try_start_69 .. :try_end_69} :catch_5f

    move-object/from16 v71, v72

    .end local v72    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    .restart local v71    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    goto/16 :goto_d

    .line 442
    .end local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .end local v84    # "cryptState":Ljava/lang/String;
    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v159    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    .restart local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    .restart local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .restart local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .restart local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .restart local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    .restart local v113    # "location":Lcom/android/server/LocationManagerService;
    .restart local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    .restart local v117    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .restart local v128    # "notification":Lcom/android/server/NotificationManagerService;
    .restart local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    .restart local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    .restart local v158    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    :catch_6
    move-exception v102

    .line 443
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "SystemServer"

    const-string v9, "Failure starting VoiceSense Service"

    move-object/from16 v0, v102

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_f

    .line 454
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_7
    move-exception v102

    .line 455
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_4e
    const-string v7, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_10

    .line 462
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_8
    move-exception v102

    .line 463
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_11

    .line 470
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_9
    move-exception v102

    .line 471
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_12

    .line 476
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_a
    move-exception v102

    .line 477
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_13

    .line 499
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_b
    move-exception v102

    .line 500
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_4f
    const-string v7, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_15

    .line 509
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_c
    move-exception v102

    .line 510
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_50
    const-string v7, "starting LockSettingsService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_16

    .line 517
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_d
    move-exception v102

    .line 518
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_51
    const-string v7, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_17

    .line 527
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_e
    move-exception v102

    .line 528
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_52
    const-string v7, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_18

    .line 537
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_f
    move-exception v102

    .line 538
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_19

    .line 547
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_10
    move-exception v102

    .line 548
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1a

    .line 557
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_11
    move-exception v102

    .line 558
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_53
    const-string v7, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    .line 567
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_12
    move-exception v102

    .line 568
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_54
    const-string v7, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1c

    .line 577
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_13
    move-exception v102

    move-object/from16 v25, v124

    .line 578
    .end local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v25    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_55
    const-string v7, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1d

    .line 585
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_14
    move-exception v102

    .line 586
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_56
    const-string v7, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1e

    .line 593
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_15
    move-exception v102

    .line 594
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_57
    const-string v7, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1f

    .line 602
    .end local v102    # "e":Ljava/lang/Throwable;
    .restart local v103    # "enableCne":I
    :cond_32
    const/16 v73, 0x0

    goto/16 :goto_20

    .line 619
    .restart local v73    # "cneFeature":I
    :cond_33
    :try_start_6a
    const-string v7, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 620
    new-instance v78, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v78

    move-object/from16 v1, v30

    move-object/from16 v2, v29

    move-object/from16 v3, v25

    invoke-direct {v0, v5, v1, v2, v3}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_6a
    .catch Ljava/lang/Throwable; {:try_start_6a .. :try_end_6a} :catch_16

    .end local v77    # "connectivity":Lcom/android/server/ConnectivityService;
    .local v78, "connectivity":Lcom/android/server/ConnectivityService;
    move-object/from16 v77, v78

    .end local v78    # "connectivity":Lcom/android/server/ConnectivityService;
    .restart local v77    # "connectivity":Lcom/android/server/ConnectivityService;
    goto/16 :goto_21

    .line 630
    .end local v73    # "cneFeature":I
    .end local v134    # "qcCon":Ljava/lang/Object;
    :catch_16
    move-exception v102

    .line 631
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_22

    .line 639
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_17
    move-exception v102

    .line 640
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting Service Discovery Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_23

    .line 649
    .end local v102    # "e":Ljava/lang/Throwable;
    .end local v103    # "enableCne":I
    :catch_18
    move-exception v102

    .line 650
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting UpdateLockService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24

    .line 666
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_19
    move-exception v102

    .line 667
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Account Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_25

    .line 673
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_1a
    move-exception v102

    .line 674
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Content Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_26

    .line 682
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_1b
    move-exception v102

    .line 683
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_58
    const-string v7, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_27

    .line 690
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_1c
    move-exception v102

    .line 691
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_28

    .line 699
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_1d
    move-exception v102

    .line 700
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_59
    const-string v7, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_29

    .line 707
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_1e
    move-exception v102

    .line 708
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_5a
    const-string v7, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a

    .line 717
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_1f
    move-exception v102

    .line 718
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2b

    .line 726
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_20
    move-exception v102

    .line 727
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2c

    .line 738
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_21
    move-exception v102

    .line 739
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_5b
    const-string v7, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d

    .line 747
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_22
    move-exception v102

    .line 748
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2e

    .line 757
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_23
    move-exception v102

    .line 758
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2f

    .line 768
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_24
    move-exception v102

    .line 769
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting WiredAccessoryManager"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_30

    .line 779
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_25
    move-exception v102

    .line 780
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_5c
    const-string v7, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_31

    .line 788
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_26
    move-exception v102

    .line 789
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_5d
    const-string v7, "SystemServer"

    const-string v9, "Failure starting SerialService"

    move-object/from16 v0, v102

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_32

    .line 796
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_27
    move-exception v102

    .line 797
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting TwilightService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33

    .line 804
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_28
    move-exception v102

    .line 805
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_34

    .line 813
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_29
    move-exception v102

    .line 814
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v102

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_35

    .line 821
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_2a
    move-exception v102

    .line 822
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_5e
    const-string v7, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_36

    .line 828
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_2b
    move-exception v102

    .line 829
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_37

    .line 836
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_2c
    move-exception v102

    .line 837
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_38

    .line 848
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_2d
    move-exception v102

    .line 849
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_39

    .line 856
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_2e
    move-exception v102

    .line 857
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3a

    .line 866
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_2f
    move-exception v102

    .line 867
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_5f
    const-string v7, "starting CommonTimeManagementService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3b

    .line 875
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_30
    move-exception v102

    .line 876
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting CertBlacklister"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3c

    .line 887
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_31
    move-exception v102

    .line 888
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_60
    const-string v7, "starting DreamManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3d

    .line 897
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_32
    move-exception v102

    .line 898
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_61
    const-string v7, "starting AssetAtlasService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3e

    .line 905
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_33
    move-exception v102

    .line 906
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "starting IdleMaintenanceService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3f

    .line 913
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_34
    move-exception v102

    .line 914
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_62
    const-string v7, "starting Print Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_40

    .line 922
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_35
    move-exception v102

    .line 923
    .restart local v102    # "e":Ljava/lang/Throwable;
    :goto_63
    const-string v7, "starting MediaRouterService"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_41

    .line 939
    .end local v102    # "e":Ljava/lang/Throwable;
    .restart local v47    # "safeMode":Z
    :cond_34
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v7

    invoke-virtual {v7}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_42

    .line 946
    :catch_36
    move-exception v102

    .line 947
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Vibrator Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_43

    .line 953
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_37
    move-exception v102

    .line 954
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Lock Settings Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_44

    .line 961
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_38
    move-exception v102

    .line 962
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_45

    .line 969
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_39
    move-exception v102

    .line 970
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_46

    .line 976
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_3a
    move-exception v102

    .line 977
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_47

    .line 995
    .end local v102    # "e":Ljava/lang/Throwable;
    .restart local v76    # "config":Landroid/content/res/Configuration;
    .restart local v119    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v160    # "w":Landroid/view/WindowManager;
    :catch_3b
    move-exception v102

    .line 996
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Power Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_48

    .line 1001
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_3c
    move-exception v102

    .line 1002
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_49

    .line 1007
    .end local v102    # "e":Ljava/lang/Throwable;
    :catch_3d
    move-exception v102

    .line 1008
    .restart local v102    # "e":Ljava/lang/Throwable;
    const-string v7, "making Display Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v102

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4a

    .line 303
    .end local v6    # "lights":Lcom/android/server/LightsService;
    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v25    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v47    # "safeMode":Z
    .end local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    .end local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    .end local v76    # "config":Landroid/content/res/Configuration;
    .end local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .end local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .end local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .end local v102    # "e":Ljava/lang/Throwable;
    .end local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    .end local v113    # "location":Lcom/android/server/LocationManagerService;
    .end local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    .end local v117    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .end local v119    # "metrics":Landroid/util/DisplayMetrics;
    .end local v128    # "notification":Lcom/android/server/NotificationManagerService;
    .end local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    .end local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    .end local v160    # "w":Landroid/view/WindowManager;
    .end local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v84    # "cryptState":Ljava/lang/String;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v134    # "qcCon":Ljava/lang/Object;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catch_3e
    move-exception v7

    goto/16 :goto_7

    .line 922
    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .end local v84    # "cryptState":Ljava/lang/String;
    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v112    # "lights":Lcom/android/server/LightsService;
    .end local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v134    # "qcCon":Ljava/lang/Object;
    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v6    # "lights":Lcom/android/server/LightsService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v25    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    .restart local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    .restart local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .restart local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .restart local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .restart local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    .restart local v113    # "location":Lcom/android/server/LocationManagerService;
    .restart local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    .restart local v118    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .restart local v128    # "notification":Lcom/android/server/NotificationManagerService;
    .restart local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    .restart local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    .restart local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    :catch_3f
    move-exception v102

    move-object/from16 v117, v118

    .end local v118    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .restart local v117    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    goto :goto_63

    .line 913
    .end local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    .restart local v133    # "printManager":Lcom/android/server/print/PrintManagerService;
    :catch_40
    move-exception v102

    move-object/from16 v132, v133

    .end local v133    # "printManager":Lcom/android/server/print/PrintManagerService;
    .restart local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    goto/16 :goto_62

    .line 897
    .end local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    .restart local v69    # "atlas":Lcom/android/server/AssetAtlasService;
    :catch_41
    move-exception v102

    move-object/from16 v68, v69

    .end local v69    # "atlas":Lcom/android/server/AssetAtlasService;
    .restart local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    goto/16 :goto_61

    .line 887
    .end local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .restart local v101    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    :catch_42
    move-exception v102

    move-object/from16 v100, v101

    .end local v101    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .restart local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    goto/16 :goto_60

    .line 866
    .end local v74    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    .restart local v75    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    :catch_43
    move-exception v102

    move-object/from16 v74, v75

    .end local v75    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    .restart local v74    # "commonTimeMgmtService":Lcom/android/server/CommonTimeManagementService;
    goto/16 :goto_5f

    .line 821
    .end local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    .restart local v67    # "appWidget":Lcom/android/server/AppWidgetService;
    :catch_44
    move-exception v102

    move-object/from16 v66, v67

    .end local v67    # "appWidget":Lcom/android/server/AppWidgetService;
    .restart local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    goto/16 :goto_5e

    .line 788
    .end local v142    # "serial":Lcom/android/server/SerialService;
    .restart local v143    # "serial":Lcom/android/server/SerialService;
    :catch_45
    move-exception v102

    move-object/from16 v142, v143

    .end local v143    # "serial":Lcom/android/server/SerialService;
    .restart local v142    # "serial":Lcom/android/server/SerialService;
    goto/16 :goto_5d

    .line 779
    .end local v156    # "usb":Lcom/android/server/usb/UsbService;
    .restart local v157    # "usb":Lcom/android/server/usb/UsbService;
    :catch_46
    move-exception v102

    move-object/from16 v156, v157

    .end local v157    # "usb":Lcom/android/server/usb/UsbService;
    .restart local v156    # "usb":Lcom/android/server/usb/UsbService;
    goto/16 :goto_5c

    .line 738
    .end local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    .restart local v162    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    :catch_47
    move-exception v102

    move-object/from16 v161, v162

    .end local v162    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    .restart local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_5b

    .line 707
    .end local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .restart local v83    # "countryDetector":Lcom/android/server/CountryDetectorService;
    :catch_48
    move-exception v102

    move-object/from16 v82, v83

    .end local v83    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .restart local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    goto/16 :goto_5a

    .line 699
    .end local v113    # "location":Lcom/android/server/LocationManagerService;
    .restart local v114    # "location":Lcom/android/server/LocationManagerService;
    :catch_49
    move-exception v102

    move-object/from16 v113, v114

    .end local v114    # "location":Lcom/android/server/LocationManagerService;
    .restart local v113    # "location":Lcom/android/server/LocationManagerService;
    goto/16 :goto_59

    .line 682
    .end local v128    # "notification":Lcom/android/server/NotificationManagerService;
    .restart local v129    # "notification":Lcom/android/server/NotificationManagerService;
    :catch_4a
    move-exception v102

    move-object/from16 v128, v129

    .end local v129    # "notification":Lcom/android/server/NotificationManagerService;
    .restart local v128    # "notification":Lcom/android/server/NotificationManagerService;
    goto/16 :goto_58

    .line 593
    .end local v163    # "wifi":Lcom/android/server/wifi/WifiService;
    .restart local v134    # "qcCon":Ljava/lang/Object;
    .restart local v164    # "wifi":Lcom/android/server/wifi/WifiService;
    :catch_4b
    move-exception v102

    move-object/from16 v163, v164

    .end local v164    # "wifi":Lcom/android/server/wifi/WifiService;
    .restart local v163    # "wifi":Lcom/android/server/wifi/WifiService;
    goto/16 :goto_57

    .line 585
    .end local v165    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v166    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    :catch_4c
    move-exception v102

    move-object/from16 v165, v166

    .end local v166    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v165    # "wifiP2p":Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_56

    .line 577
    :catch_4d
    move-exception v102

    goto/16 :goto_55

    .line 567
    .end local v25    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v29    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    .restart local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v125    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    :catch_4e
    move-exception v102

    move-object/from16 v29, v125

    .end local v125    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    .restart local v29    # "networkStats":Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_54

    .line 557
    .end local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    .restart local v151    # "tsms":Lcom/android/server/TextServicesManagerService;
    :catch_4f
    move-exception v102

    move-object/from16 v150, v151

    .end local v151    # "tsms":Lcom/android/server/TextServicesManagerService;
    .restart local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_53

    .line 527
    .end local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .restart local v147    # "statusBar":Lcom/android/server/StatusBarManagerService;
    :catch_50
    move-exception v102

    move-object/from16 v146, v147

    .end local v147    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .restart local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_52

    .line 517
    .end local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .restart local v87    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    :catch_51
    move-exception v102

    move-object/from16 v86, v87

    .end local v87    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .restart local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_51

    .line 509
    .end local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    .restart local v116    # "lockSettings":Lcom/android/server/LockSettingsService;
    :catch_52
    move-exception v102

    move-object/from16 v115, v116

    .end local v116    # "lockSettings":Lcom/android/server/LockSettingsService;
    .restart local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    goto/16 :goto_50

    .line 499
    .end local v120    # "mountService":Lcom/android/server/MountService;
    .restart local v121    # "mountService":Lcom/android/server/MountService;
    :catch_53
    move-exception v102

    move-object/from16 v120, v121

    .end local v121    # "mountService":Lcom/android/server/MountService;
    .restart local v120    # "mountService":Lcom/android/server/MountService;
    goto/16 :goto_4f

    .line 485
    :catch_54
    move-exception v7

    goto/16 :goto_14

    .line 454
    .end local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    .restart local v108    # "imm":Lcom/android/server/InputMethodManagerService;
    :catch_55
    move-exception v102

    move-object/from16 v107, v108

    .end local v108    # "imm":Lcom/android/server/InputMethodManagerService;
    .restart local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_4e

    .line 415
    .end local v6    # "lights":Lcom/android/server/LightsService;
    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v11    # "display":Lcom/android/server/display/DisplayManagerService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    .end local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    .end local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .end local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .end local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .end local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    .end local v113    # "location":Lcom/android/server/LocationManagerService;
    .end local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    .end local v117    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .end local v128    # "notification":Lcom/android/server/NotificationManagerService;
    .end local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    .end local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .end local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    .end local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v97    # "display":Lcom/android/server/display/DisplayManagerService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v112    # "lights":Lcom/android/server/LightsService;
    :catch_56
    move-exception v102

    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    move-object/from16 v11, v97

    .end local v97    # "display":Lcom/android/server/display/DisplayManagerService;
    .restart local v11    # "display":Lcom/android/server/display/DisplayManagerService;
    move-object/from16 v6, v112

    .end local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v6    # "lights":Lcom/android/server/LightsService;
    goto/16 :goto_4d

    .end local v6    # "lights":Lcom/android/server/LightsService;
    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v112    # "lights":Lcom/android/server/LightsService;
    :catch_57
    move-exception v102

    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    move-object/from16 v6, v112

    .end local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v6    # "lights":Lcom/android/server/LightsService;
    goto/16 :goto_4d

    .end local v6    # "lights":Lcom/android/server/LightsService;
    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v122    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v123    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catch_58
    move-exception v102

    move-object/from16 v122, v123

    .end local v123    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    .restart local v122    # "msimTelephonyRegistry":Lcom/android/server/MSimTelephonyRegistry;
    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    move-object/from16 v6, v112

    .end local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v6    # "lights":Lcom/android/server/LightsService;
    goto/16 :goto_4d

    .end local v6    # "lights":Lcom/android/server/LightsService;
    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v63    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v64    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v84    # "cryptState":Ljava/lang/String;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catch_59
    move-exception v102

    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    move-object/from16 v6, v112

    .end local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v6    # "lights":Lcom/android/server/LightsService;
    move-object/from16 v63, v64

    .end local v64    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .restart local v63    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    goto/16 :goto_4d

    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catch_5a
    move-exception v102

    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    goto/16 :goto_4d

    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catch_5b
    move-exception v102

    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    goto/16 :goto_4d

    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v158    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v159    # "vibrator":Lcom/android/server/VibratorService;
    :catch_5c
    move-exception v102

    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    move-object/from16 v158, v159

    .end local v159    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v158    # "vibrator":Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v158    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v159    # "vibrator":Lcom/android/server/VibratorService;
    :catch_5d
    move-exception v102

    move-object/from16 v79, v80

    .end local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    move-object/from16 v158, v159

    .end local v159    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v158    # "vibrator":Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v158    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v159    # "vibrator":Lcom/android/server/VibratorService;
    :catch_5e
    move-exception v102

    move-object/from16 v79, v80

    .end local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v109

    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v158, v159

    .end local v159    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v158    # "vibrator":Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v71    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    .end local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v158    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v72    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    .restart local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v159    # "vibrator":Lcom/android/server/VibratorService;
    :catch_5f
    move-exception v102

    move-object/from16 v79, v80

    .end local v80    # "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v79    # "consumerIr":Lcom/android/server/ConsumerIrService;
    move-object/from16 v148, v149

    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v71, v72

    .end local v72    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    .restart local v71    # "bluetooth":Lcom/android/server/BluetoothManagerService;
    move-object/from16 v158, v159

    .end local v159    # "vibrator":Lcom/android/server/VibratorService;
    .restart local v158    # "vibrator":Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .line 323
    .end local v6    # "lights":Lcom/android/server/LightsService;
    .end local v8    # "battery":Lcom/android/server/BatteryService;
    .end local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v63    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .end local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v64    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .restart local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v70    # "battery":Lcom/android/server/BatteryService;
    .restart local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catch_60
    move-exception v102

    move-object/from16 v63, v64

    .end local v64    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    .restart local v63    # "accountManager":Lcom/android/server/accounts/AccountManagerService;
    goto/16 :goto_4c

    .line 247
    .end local v11    # "display":Lcom/android/server/display/DisplayManagerService;
    .end local v84    # "cryptState":Ljava/lang/String;
    .end local v88    # "disableAtlas":Z
    .end local v89    # "disableBluetooth":Z
    .end local v90    # "disableLocation":Z
    .end local v91    # "disableMedia":Z
    .end local v92    # "disableNetwork":Z
    .end local v93    # "disableNonCoreServices":Z
    .end local v94    # "disableStorage":Z
    .end local v95    # "disableSystemUI":Z
    .end local v96    # "disableTelephony":Z
    .end local v149    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v97    # "display":Lcom/android/server/display/DisplayManagerService;
    .restart local v148    # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catch_61
    move-exception v102

    goto/16 :goto_4b

    .end local v110    # "installer":Lcom/android/server/pm/Installer;
    .restart local v111    # "installer":Lcom/android/server/pm/Installer;
    :catch_62
    move-exception v102

    move-object/from16 v110, v111

    .end local v111    # "installer":Lcom/android/server/pm/Installer;
    .restart local v110    # "installer":Lcom/android/server/pm/Installer;
    goto/16 :goto_4b

    .end local v65    # "alarm":Lcom/android/server/AlarmManagerService;
    .end local v70    # "battery":Lcom/android/server/BatteryService;
    .end local v97    # "display":Lcom/android/server/display/DisplayManagerService;
    .end local v109    # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v112    # "lights":Lcom/android/server/LightsService;
    .restart local v6    # "lights":Lcom/android/server/LightsService;
    .restart local v8    # "battery":Lcom/android/server/BatteryService;
    .restart local v11    # "display":Lcom/android/server/display/DisplayManagerService;
    .restart local v16    # "alarm":Lcom/android/server/AlarmManagerService;
    .restart local v20    # "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v66    # "appWidget":Lcom/android/server/AppWidgetService;
    .restart local v68    # "atlas":Lcom/android/server/AssetAtlasService;
    .restart local v82    # "countryDetector":Lcom/android/server/CountryDetectorService;
    .restart local v86    # "devicePolicy":Lcom/android/server/DevicePolicyManagerService;
    .restart local v88    # "disableAtlas":Z
    .restart local v89    # "disableBluetooth":Z
    .restart local v90    # "disableLocation":Z
    .restart local v91    # "disableMedia":Z
    .restart local v92    # "disableNetwork":Z
    .restart local v93    # "disableNonCoreServices":Z
    .restart local v94    # "disableStorage":Z
    .restart local v95    # "disableSystemUI":Z
    .restart local v96    # "disableTelephony":Z
    .restart local v100    # "dreamy":Lcom/android/server/dreams/DreamManagerService;
    .restart local v107    # "imm":Lcom/android/server/InputMethodManagerService;
    .restart local v113    # "location":Lcom/android/server/LocationManagerService;
    .restart local v115    # "lockSettings":Lcom/android/server/LockSettingsService;
    .restart local v117    # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .restart local v128    # "notification":Lcom/android/server/NotificationManagerService;
    .restart local v132    # "printManager":Lcom/android/server/print/PrintManagerService;
    .restart local v146    # "statusBar":Lcom/android/server/StatusBarManagerService;
    .restart local v150    # "tsms":Lcom/android/server/TextServicesManagerService;
    .restart local v161    # "wallpaper":Lcom/android/server/WallpaperManagerService;
    :cond_35
    move-object/from16 v25, v124

    .end local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v25    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_23

    .end local v25    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    :cond_36
    move-object/from16 v25, v124

    .end local v124    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v25    # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_41
.end method

.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 121
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    const-string v0, "SystemServer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BOOT FAILURE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 123
    return-void
.end method
