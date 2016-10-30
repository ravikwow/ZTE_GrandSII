.class public Lcom/android/server/LocationPolicyManagerService;
.super Landroid/location/ILocationPolicyManager$Stub;
.source "LocationPolicyManagerService.java"


# static fields
.field private static final ACTION_ALLOW_BACKGROUND:Ljava/lang/String; = "com.android.server.location.action.ALLOW_BACKGROUND"

.field private static final ATTR_APP_ID:Ljava/lang/String; = "appId"

.field private static final ATTR_HIGH_POWER:Ljava/lang/String; = "high-power"

.field private static final ATTR_LOCATION_PROVIDER:Ljava/lang/String; = "provider"

.field private static final ATTR_POLICY:Ljava/lang/String; = "policy"

.field private static final ATTR_RESTRICT_BACKGROUND:Ljava/lang/String; = "restrictBackground"

.field private static final ATTR_UID:Ljava/lang/String; = "uid"

.field private static final ATTR_VERSION:Ljava/lang/String; = "version"

.field private static final LOGD:Z = true

.field private static final LOGV:Z = true

.field private static final MSG_RESTRICT_BACKGROUND_CHANGED:I = 0x2

.field private static final MSG_RULES_CHANGED:I = 0x1

.field private static final TAG:Ljava/lang/String; = "LocationPolicy"

.field private static final TAG_ALLOW_BACKGROUND:Ljava/lang/String; = "LocationPolicy:allowBackground"

.field private static final TAG_APP_POLICY:Ljava/lang/String; = "app-policy"

.field private static final TAG_LOCATION_POLICY:Ljava/lang/String; = "location-policy"

.field private static final TAG_POLICY_LIST:Ljava/lang/String; = "policy-list"

.field private static final TAG_UID_POLICY:Ljava/lang/String; = "uid-policy"

.field private static final VERSION_INIT:I = 0x1

.field private static final VERSION_LATEST:I = 0x1

.field static sLocationPolicyService:Lcom/android/server/LocationPolicyManagerService;


# instance fields
.field private mActiveNotifs:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mActivityManager:Landroid/app/IActivityManager;

.field private mAllowReceiver:Landroid/content/BroadcastReceiver;

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mHandlerCallback:Landroid/os/Handler$Callback;

.field private final mListeners:Landroid/os/RemoteCallbackList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/RemoteCallbackList",
            "<",
            "Landroid/location/ILocationPolicyListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mLocationManager:Landroid/location/ILocationManager;

.field private volatile mLocationMode:I

.field private mLocationModeReceiver:Landroid/content/BroadcastReceiver;

.field private mLocationPolicies:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/location/LocationPolicy;",
            ">;"
        }
    .end annotation
.end field

.field private mLocationRules:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/location/LocationPolicy;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mNotifManager:Landroid/app/INotificationManager;

.field private mPackageReceiver:Landroid/content/BroadcastReceiver;

.field private final mPolicyFile:Landroid/util/AtomicFile;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mProcessObserver:Landroid/app/IProcessObserver;

.field private volatile mRestrictBackground:Z

.field private final mRulesLock:Ljava/lang/Object;

.field private volatile mScreenOn:Z

.field private mScreenReceiver:Landroid/content/BroadcastReceiver;

.field private mUidForeground:Landroid/util/SparseBooleanArray;

.field private mUidInNavigation:Landroid/util/SparseBooleanArray;

.field private mUidPidForeground:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/util/SparseBooleanArray;",
            ">;"
        }
    .end annotation
.end field

.field private mUidPolicies:Landroid/util/SparseIntArray;

.field private mUidRemovedReceiver:Landroid/content/BroadcastReceiver;

.field private mUidRules:Landroid/util/SparseIntArray;

.field private mUserReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/location/ILocationManager;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "locationManager"    # Landroid/location/ILocationManager;

    .prologue
    .line 168
    invoke-direct {p0}, Landroid/location/ILocationPolicyManager$Stub;-><init>()V

    .line 120
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    .line 127
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    .line 129
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationRules:Ljava/util/HashMap;

    .line 132
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    .line 134
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    .line 136
    new-instance v1, Landroid/util/SparseBooleanArray;

    invoke-direct {v1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUidInNavigation:Landroid/util/SparseBooleanArray;

    .line 139
    invoke-static {}, Lcom/google/android/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mActiveNotifs:Ljava/util/HashSet;

    .line 142
    new-instance v1, Landroid/util/SparseBooleanArray;

    invoke-direct {v1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUidForeground:Landroid/util/SparseBooleanArray;

    .line 143
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPidForeground:Landroid/util/SparseArray;

    .line 145
    new-instance v1, Landroid/os/RemoteCallbackList;

    invoke-direct {v1}, Landroid/os/RemoteCallbackList;-><init>()V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mListeners:Landroid/os/RemoteCallbackList;

    .line 246
    new-instance v1, Lcom/android/server/LocationPolicyManagerService$1;

    invoke-direct {v1, p0}, Lcom/android/server/LocationPolicyManagerService$1;-><init>(Lcom/android/server/LocationPolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mProcessObserver:Landroid/app/IProcessObserver;

    .line 305
    new-instance v1, Lcom/android/server/LocationPolicyManagerService$2;

    invoke-direct {v1, p0}, Lcom/android/server/LocationPolicyManagerService$2;-><init>(Lcom/android/server/LocationPolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mScreenReceiver:Landroid/content/BroadcastReceiver;

    .line 318
    new-instance v1, Lcom/android/server/LocationPolicyManagerService$3;

    invoke-direct {v1, p0}, Lcom/android/server/LocationPolicyManagerService$3;-><init>(Lcom/android/server/LocationPolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mPackageReceiver:Landroid/content/BroadcastReceiver;

    .line 338
    new-instance v1, Lcom/android/server/LocationPolicyManagerService$4;

    invoke-direct {v1, p0}, Lcom/android/server/LocationPolicyManagerService$4;-><init>(Lcom/android/server/LocationPolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRemovedReceiver:Landroid/content/BroadcastReceiver;

    .line 356
    new-instance v1, Lcom/android/server/LocationPolicyManagerService$5;

    invoke-direct {v1, p0}, Lcom/android/server/LocationPolicyManagerService$5;-><init>(Lcom/android/server/LocationPolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUserReceiver:Landroid/content/BroadcastReceiver;

    .line 377
    new-instance v1, Lcom/android/server/LocationPolicyManagerService$6;

    invoke-direct {v1, p0}, Lcom/android/server/LocationPolicyManagerService$6;-><init>(Lcom/android/server/LocationPolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationModeReceiver:Landroid/content/BroadcastReceiver;

    .line 395
    new-instance v1, Lcom/android/server/LocationPolicyManagerService$7;

    invoke-direct {v1, p0}, Lcom/android/server/LocationPolicyManagerService$7;-><init>(Lcom/android/server/LocationPolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mAllowReceiver:Landroid/content/BroadcastReceiver;

    .line 926
    new-instance v1, Lcom/android/server/LocationPolicyManagerService$8;

    invoke-direct {v1, p0}, Lcom/android/server/LocationPolicyManagerService$8;-><init>(Lcom/android/server/LocationPolicyManagerService;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mHandlerCallback:Landroid/os/Handler$Callback;

    .line 169
    iput-object p1, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    .line 170
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mActivityManager:Landroid/app/IActivityManager;

    .line 171
    invoke-static {}, Landroid/app/NotificationManager;->getService()Landroid/app/INotificationManager;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mNotifManager:Landroid/app/INotificationManager;

    .line 172
    iput-object p2, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationManager:Landroid/location/ILocationManager;

    .line 174
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "LocationPolicy"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 175
    .local v0, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 176
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mHandlerCallback:Landroid/os/Handler$Callback;

    invoke-direct {v1, v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mHandler:Landroid/os/Handler;

    .line 178
    new-instance v1, Landroid/util/AtomicFile;

    new-instance v2, Ljava/io/File;

    invoke-static {}, Lcom/android/server/LocationPolicyManagerService;->getSystemDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "locationpolicy.xml"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    iput-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mPolicyFile:Landroid/util/AtomicFile;

    .line 181
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z

    .line 182
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/LocationPolicyManagerService;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/LocationPolicyManagerService;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPidForeground:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/server/LocationPolicyManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForRestrictBackgroundLocked()V

    return-void
.end method

.method static synthetic access$1102(Lcom/android/server/LocationPolicyManagerService;I)I
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;
    .param p1, "x1"    # I

    .prologue
    .line 84
    iput p1, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationMode:I

    return p1
.end method

.method static synthetic access$1200(Lcom/android/server/LocationPolicyManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateLocationModeChangeLocked()V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/server/LocationPolicyManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateLocationRulesLocked()V

    return-void
.end method

.method static synthetic access$1400(Lcom/android/server/LocationPolicyManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateNotificationsLocked()V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/server/LocationPolicyManagerService;)Landroid/os/RemoteCallbackList;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mListeners:Landroid/os/RemoteCallbackList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/server/LocationPolicyManagerService;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;
    .param p1, "x1"    # I

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->computeUidForegroundLocked(I)V

    return-void
.end method

.method static synthetic access$302(Lcom/android/server/LocationPolicyManagerService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;
    .param p1, "x1"    # Z

    .prologue
    .line 84
    iput-boolean p1, p0, Lcom/android/server/LocationPolicyManagerService;->mScreenOn:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/server/LocationPolicyManagerService;)Landroid/os/PowerManager;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mPowerManager:Landroid/os/PowerManager;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/server/LocationPolicyManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForScreenLocked()V

    return-void
.end method

.method static synthetic access$600(Lcom/android/server/LocationPolicyManagerService;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;
    .param p1, "x1"    # I

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForUidLocked(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/server/LocationPolicyManagerService;)Landroid/util/SparseIntArray;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/server/LocationPolicyManagerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->writePolicyLocked()V

    return-void
.end method

.method static synthetic access$900(Lcom/android/server/LocationPolicyManagerService;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/LocationPolicyManagerService;
    .param p1, "x1"    # I

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->removePoliciesForUserLocked(I)V

    return-void
.end method

.method private cancelNotification(Ljava/lang/String;)V
    .locals 4
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 466
    :try_start_0
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 467
    .local v0, "packageName":Ljava/lang/String;
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mNotifManager:Landroid/app/INotificationManager;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface {v1, v0, p1, v2, v3}, Landroid/app/INotificationManager;->cancelNotificationWithTag(Ljava/lang/String;Ljava/lang/String;II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 472
    .end local v0    # "packageName":Ljava/lang/String;
    :goto_0
    return-void

    .line 469
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private computeUidForegroundLocked(I)V
    .locals 7
    .param p1, "uid"    # I

    .prologue
    .line 285
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPidForeground:Landroid/util/SparseArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/SparseBooleanArray;

    .line 288
    .local v2, "pidForeground":Landroid/util/SparseBooleanArray;
    const/4 v4, 0x0

    .line 289
    .local v4, "uidForeground":Z
    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    .line 290
    .local v3, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 291
    invoke-virtual {v2, v0}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 292
    const/4 v4, 0x1

    .line 297
    :cond_0
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mUidForeground:Landroid/util/SparseBooleanArray;

    const/4 v6, 0x0

    invoke-virtual {v5, p1, v6}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result v1

    .line 298
    .local v1, "oldUidForeground":Z
    if-eq v1, v4, :cond_1

    .line 300
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mUidForeground:Landroid/util/SparseBooleanArray;

    invoke-virtual {v5, p1, v4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 301
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForUidLocked(I)V

    .line 303
    :cond_1
    return-void

    .line 290
    .end local v1    # "oldUidForeground":Z
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private enqueueRestrictedNotification(Ljava/lang/String;)V
    .locals 13
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 434
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    .line 435
    .local v11, "res":Landroid/content/res/Resources;
    new-instance v9, Landroid/app/Notification$Builder;

    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    invoke-direct {v9, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 437
    .local v9, "builder":Landroid/app/Notification$Builder;
    const v0, 0x1107009f

    invoke-virtual {v11, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v12

    .line 438
    .local v12, "title":Ljava/lang/CharSequence;
    const v0, 0x110700a0

    invoke-virtual {v11, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 440
    .local v8, "body":Ljava/lang/CharSequence;
    invoke-virtual {v9, v2}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    .line 441
    invoke-virtual {v9, v2}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 442
    sget v0, Lcom/android/internal/R$drawable;->stat_notify_error:I

    invoke-virtual {v9, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 443
    invoke-virtual {v9, v12}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 444
    invoke-virtual {v9, v12}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 445
    invoke-virtual {v9, v8}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 447
    new-instance v10, Landroid/content/Intent;

    const-string v0, "com.android.server.location.action.ALLOW_BACKGROUND"

    invoke-direct {v10, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 448
    .local v10, "intent":Landroid/content/Intent;
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const/high16 v2, 0x8000000

    invoke-static {v0, v3, v10, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 454
    :try_start_0
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 455
    .local v1, "packageName":Ljava/lang/String;
    const/4 v0, 0x1

    new-array v6, v0, [I

    .line 456
    .local v6, "idReceived":[I
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mNotifManager:Landroid/app/INotificationManager;

    const/4 v4, 0x0

    invoke-virtual {v9}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v5

    const/4 v7, 0x0

    move-object v2, v1

    move-object v3, p1

    invoke-interface/range {v0 .. v7}, Landroid/app/INotificationManager;->enqueueNotificationWithTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/app/Notification;[II)V

    .line 458
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mActiveNotifs:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 462
    .end local v1    # "packageName":Ljava/lang/String;
    .end local v6    # "idReceived":[I
    :goto_0
    return-void

    .line 459
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static getDefaultService()Lcom/android/server/LocationPolicyManagerService;
    .locals 2

    .prologue
    .line 160
    sget-object v0, Lcom/android/server/LocationPolicyManagerService;->sLocationPolicyService:Lcom/android/server/LocationPolicyManagerService;

    if-eqz v0, :cond_0

    .line 161
    sget-object v0, Lcom/android/server/LocationPolicyManagerService;->sLocationPolicyService:Lcom/android/server/LocationPolicyManagerService;

    return-object v0

    .line 164
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "LocationPolicyManagerService has not been initialized "

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getSystemDir()Ljava/io/File;
    .locals 3

    .prologue
    .line 185
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "system"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private isUidForegroundLocked(I)Z
    .locals 2
    .param p1, "uid"    # I

    .prologue
    const/4 v0, 0x0

    .line 826
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUidForeground:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/server/LocationPolicyManagerService;->mScreenOn:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private static isUidValidForRules(I)Z
    .locals 1
    .param p0, "uid"    # I

    .prologue
    .line 886
    const/16 v0, 0x3e9

    if-eq p0, v0, :cond_0

    invoke-static {p0}, Landroid/os/UserHandle;->isApp(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 887
    :cond_0
    const/4 v0, 0x1

    .line 890
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static newDefaultService(Landroid/content/Context;Landroid/location/ILocationManager;)Lcom/android/server/LocationPolicyManagerService;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "locationManager"    # Landroid/location/ILocationManager;

    .prologue
    .line 155
    new-instance v0, Lcom/android/server/LocationPolicyManagerService;

    invoke-direct {v0, p0, p1}, Lcom/android/server/LocationPolicyManagerService;-><init>(Landroid/content/Context;Landroid/location/ILocationManager;)V

    sput-object v0, Lcom/android/server/LocationPolicyManagerService;->sLocationPolicyService:Lcom/android/server/LocationPolicyManagerService;

    .line 156
    invoke-static {}, Lcom/android/server/LocationPolicyManagerService;->getDefaultService()Lcom/android/server/LocationPolicyManagerService;

    move-result-object v0

    return-object v0
.end method

.method private readPolicyLocked()V
    .locals 14

    .prologue
    .line 525
    const-string v11, "LocationPolicy"

    const-string v12, "readPolicyLocked()"

    invoke-static {v11, v12}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    iget-object v11, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    invoke-virtual {v11}, Ljava/util/HashMap;->clear()V

    .line 529
    iget-object v11, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v11}, Landroid/util/SparseIntArray;->clear()V

    .line 531
    const/4 v2, 0x0

    .line 533
    .local v2, "fis":Ljava/io/FileInputStream;
    :try_start_0
    iget-object v11, p0, Lcom/android/server/LocationPolicyManagerService;->mPolicyFile:Landroid/util/AtomicFile;

    invoke-virtual {v11}, Landroid/util/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v2

    .line 534
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v4

    .line 535
    .local v4, "in":Lorg/xmlpull/v1/XmlPullParser;
    const/4 v11, 0x0

    invoke-interface {v4, v2, v11}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 538
    const/4 v10, 0x1

    .line 539
    .local v10, "version":I
    :cond_0
    :goto_0
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v8

    .local v8, "type":I
    const/4 v11, 0x1

    if-eq v8, v11, :cond_1

    .line 540
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 541
    .local v7, "tag":Ljava/lang/String;
    const/4 v11, 0x2

    if-ne v8, v11, :cond_0

    .line 542
    const-string v11, "policy-list"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 543
    const-string v11, "version"

    invoke-static {v4, v11}, Lcom/android/internal/util/XmlUtils;->readIntAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v10

    .line 544
    const-string v11, "restrictBackground"

    invoke-static {v4, v11}, Lcom/android/internal/util/XmlUtils;->readBooleanAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 571
    .end local v4    # "in":Lorg/xmlpull/v1/XmlPullParser;
    .end local v7    # "tag":Ljava/lang/String;
    .end local v8    # "type":I
    .end local v10    # "version":I
    :catch_0
    move-exception v11

    .line 580
    :cond_1
    :goto_1
    invoke-static {v2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 582
    return-void

    .line 545
    .restart local v4    # "in":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v7    # "tag":Ljava/lang/String;
    .restart local v8    # "type":I
    .restart local v10    # "version":I
    :cond_2
    :try_start_1
    const-string v11, "location-policy"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 546
    const/4 v11, 0x0

    const-string v12, "provider"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 547
    .local v6, "provider":Ljava/lang/String;
    const-string v11, "high-power"

    invoke-static {v4, v11}, Lcom/android/internal/util/XmlUtils;->readBooleanAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    .line 548
    .local v3, "highPower":Z
    iget-object v11, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    invoke-static {v6}, Landroid/location/LocationPolicy;->getDefaultPolicyByProvider(Ljava/lang/String;)Landroid/location/LocationPolicy;

    move-result-object v12

    invoke-virtual {v11, v6, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 573
    .end local v3    # "highPower":Z
    .end local v4    # "in":Lorg/xmlpull/v1/XmlPullParser;
    .end local v6    # "provider":Ljava/lang/String;
    .end local v7    # "tag":Ljava/lang/String;
    .end local v8    # "type":I
    .end local v10    # "version":I
    :catch_1
    move-exception v1

    .line 574
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    const-string v11, "LocationPolicy"

    const-string v12, "problem reading location policy"

    invoke-static {v11, v12, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 580
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v11

    invoke-static {v2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    throw v11

    .line 549
    .restart local v4    # "in":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v7    # "tag":Ljava/lang/String;
    .restart local v8    # "type":I
    .restart local v10    # "version":I
    :cond_3
    :try_start_3
    const-string v11, "uid-policy"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 550
    const-string v11, "uid"

    invoke-static {v4, v11}, Lcom/android/internal/util/XmlUtils;->readIntAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v9

    .line 551
    .local v9, "uid":I
    const-string v11, "policy"

    invoke-static {v4, v11}, Lcom/android/internal/util/XmlUtils;->readIntAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v5

    .line 553
    .local v5, "policy":I
    invoke-static {v9}, Landroid/os/UserHandle;->isApp(I)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 554
    const/4 v11, 0x0

    invoke-direct {p0, v9, v5, v11}, Lcom/android/server/LocationPolicyManagerService;->setUidPolicyUnchecked(IIZ)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 575
    .end local v4    # "in":Lorg/xmlpull/v1/XmlPullParser;
    .end local v5    # "policy":I
    .end local v7    # "tag":Ljava/lang/String;
    .end local v8    # "type":I
    .end local v9    # "uid":I
    .end local v10    # "version":I
    :catch_2
    move-exception v1

    .line 576
    .local v1, "e":Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_4
    const-string v11, "LocationPolicy"

    const-string v12, "problem reading location policy"

    invoke-static {v11, v12, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 556
    .end local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v4    # "in":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v5    # "policy":I
    .restart local v7    # "tag":Ljava/lang/String;
    .restart local v8    # "type":I
    .restart local v9    # "uid":I
    .restart local v10    # "version":I
    :cond_4
    :try_start_5
    const-string v11, "LocationPolicy"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "unable to apply policy to UID "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; ignoring"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 577
    .end local v4    # "in":Lorg/xmlpull/v1/XmlPullParser;
    .end local v5    # "policy":I
    .end local v7    # "tag":Ljava/lang/String;
    .end local v8    # "type":I
    .end local v9    # "uid":I
    .end local v10    # "version":I
    :catch_3
    move-exception v1

    .line 578
    .local v1, "e":Ljava/lang/Exception;
    :try_start_6
    const-string v11, "LocationPolicy"

    const-string v12, "problem reading location policy"

    invoke-static {v11, v12, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_1

    .line 558
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v4    # "in":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v7    # "tag":Ljava/lang/String;
    .restart local v8    # "type":I
    .restart local v10    # "version":I
    :cond_5
    :try_start_7
    const-string v11, "app-policy"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 559
    const-string v11, "appId"

    invoke-static {v4, v11}, Lcom/android/internal/util/XmlUtils;->readIntAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v0

    .line 560
    .local v0, "appId":I
    const-string v11, "policy"

    invoke-static {v4, v11}, Lcom/android/internal/util/XmlUtils;->readIntAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v5

    .line 562
    .restart local v5    # "policy":I
    const/4 v11, 0x0

    invoke-static {v11, v0}, Landroid/os/UserHandle;->getUid(II)I

    move-result v9

    .line 563
    .restart local v9    # "uid":I
    invoke-static {v9}, Landroid/os/UserHandle;->isApp(I)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 564
    const/4 v11, 0x0

    invoke-direct {p0, v9, v5, v11}, Lcom/android/server/LocationPolicyManagerService;->setUidPolicyUnchecked(IIZ)V

    goto/16 :goto_0

    .line 566
    :cond_6
    const-string v11, "LocationPolicy"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "unable to apply policy to UID "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; ignoring"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0
.end method

.method private removePoliciesForUserLocked(I)V
    .locals 8
    .param p1, "userId"    # I

    .prologue
    .line 589
    const-string v6, "LocationPolicy"

    const-string v7, "removePoliciesForUserLocked()"

    invoke-static {v6, v7}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 591
    const/4 v6, 0x0

    new-array v5, v6, [I

    .line 592
    .local v5, "uids":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v6}, Landroid/util/SparseIntArray;->size()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 593
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v4

    .line 594
    .local v4, "uid":I
    invoke-static {v4}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v6

    if-ne v6, p1, :cond_0

    .line 595
    invoke-static {v5, v4}, Lcom/android/internal/util/ArrayUtils;->appendInt([II)[I

    move-result-object v5

    .line 592
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 599
    .end local v4    # "uid":I
    :cond_1
    array-length v6, v5

    if-lez v6, :cond_3

    .line 600
    move-object v0, v5

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_2

    aget v4, v0, v2

    .line 601
    .restart local v4    # "uid":I
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v4}, Landroid/util/SparseIntArray;->delete(I)V

    .line 602
    invoke-direct {p0, v4}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForUidLocked(I)V

    .line 600
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 604
    .end local v4    # "uid":I
    :cond_2
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->writePolicyLocked()V

    .line 606
    .end local v0    # "arr$":[I
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_3
    return-void
.end method

.method private setUidPolicyUnchecked(IIZ)V
    .locals 3
    .param p1, "uid"    # I
    .param p2, "policy"    # I
    .param p3, "persist"    # Z

    .prologue
    .line 669
    iget-object v2, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v2

    .line 670
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->getUidPolicy(I)I

    move-result v0

    .line 671
    .local v0, "oldPolicy":I
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p1, p2}, Landroid/util/SparseIntArray;->put(II)V

    .line 674
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForUidLocked(I)V

    .line 675
    if-eqz p3, :cond_0

    .line 676
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->writePolicyLocked()V

    .line 678
    :cond_0
    monitor-exit v2

    .line 679
    return-void

    .line 678
    .end local v0    # "oldPolicy":I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private updateLocationModeChangeLocked()V
    .locals 2

    .prologue
    .line 475
    const-string v0, "LocationPolicy"

    const-string v1, "updateLocationModeChangeLocked()"

    invoke-static {v0, v1}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    return-void
.end method

.method private updateLocationRulesLocked()V
    .locals 10

    .prologue
    .line 494
    const-string v8, "LocationPolicy"

    const-string v9, "updateLocationRulesLocked()"

    invoke-static {v8, v9}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    :try_start_0
    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationManager:Landroid/location/ILocationManager;

    invoke-interface {v8}, Landroid/location/ILocationManager;->getAllProviders()Ljava/util/List;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 505
    .local v0, "allProviders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationRules:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->clear()V

    .line 506
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v7

    .line 507
    .local v7, "providerList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/location/LocationPolicy;

    .line 510
    .local v5, "policy":Landroid/location/LocationPolicy;
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 511
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 512
    .local v6, "provider":Ljava/lang/String;
    invoke-virtual {v5, v6}, Landroid/location/LocationPolicy;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 513
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 499
    .end local v0    # "allProviders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "policy":Landroid/location/LocationPolicy;
    .end local v6    # "provider":Ljava/lang/String;
    .end local v7    # "providerList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 522
    :cond_2
    return-void

    .line 517
    .restart local v0    # "allProviders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "policy":Landroid/location/LocationPolicy;
    .restart local v7    # "providerList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_3
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_0

    .line 518
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    .line 519
    .local v4, "ifaces":[Ljava/lang/String;
    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationRules:Ljava/util/HashMap;

    invoke-virtual {v8, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private updateNotificationsLocked()V
    .locals 5

    .prologue
    .line 409
    const-string v3, "LocationPolicy"

    const-string v4, "updateNotificationsLocked()"

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    invoke-static {}, Lcom/google/android/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v0

    .line 413
    .local v0, "beforeNotifs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mActiveNotifs:Ljava/util/HashSet;

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 414
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mActiveNotifs:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V

    .line 417
    iget-boolean v3, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z

    if-eqz v3, :cond_0

    .line 418
    const-string v3, "LocationPolicy:allowBackground"

    invoke-direct {p0, v3}, Lcom/android/server/LocationPolicyManagerService;->enqueueRestrictedNotification(Ljava/lang/String;)V

    .line 422
    :cond_0
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 423
    .local v2, "tag":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mActiveNotifs:Ljava/util/HashSet;

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 424
    invoke-direct {p0, v2}, Lcom/android/server/LocationPolicyManagerService;->cancelNotification(Ljava/lang/String;)V

    goto :goto_0

    .line 427
    .end local v2    # "tag":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private updateRulesForRestrictBackgroundLocked()V
    .locals 11

    .prologue
    .line 868
    iget-object v9, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 869
    .local v4, "pm":Landroid/content/pm/PackageManager;
    iget-object v9, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v10, "user"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/UserManager;

    .line 872
    .local v6, "um":Landroid/os/UserManager;
    invoke-virtual {v6}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v8

    .line 873
    .local v8, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    const/16 v9, 0x2200

    invoke-virtual {v4, v9}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v1

    .line 876
    .local v1, "apps":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/UserInfo;

    .line 877
    .local v7, "user":Landroid/content/pm/UserInfo;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 878
    .local v0, "app":Landroid/content/pm/ApplicationInfo;
    iget v9, v7, Landroid/content/pm/UserInfo;->id:I

    iget v10, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v9, v10}, Landroid/os/UserHandle;->getUid(II)I

    move-result v5

    .line 879
    .local v5, "uid":I
    invoke-direct {p0, v5}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForUidLocked(I)V

    goto :goto_0

    .line 882
    .end local v0    # "app":Landroid/content/pm/ApplicationInfo;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "uid":I
    .end local v7    # "user":Landroid/content/pm/UserInfo;
    :cond_1
    return-void
.end method

.method private updateRulesForScreenLocked()V
    .locals 4

    .prologue
    .line 484
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mUidForeground:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    .line 485
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 486
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mUidForeground:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 487
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mUidForeground:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v2

    .line 488
    .local v2, "uid":I
    invoke-direct {p0, v2}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForUidLocked(I)V

    .line 485
    .end local v2    # "uid":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 491
    :cond_1
    return-void
.end method

.method private updateRulesForUidLocked(I)V
    .locals 5
    .param p1, "uid"    # I

    .prologue
    const/4 v4, 0x0

    .line 894
    invoke-static {p1}, Lcom/android/server/LocationPolicyManagerService;->isUidValidForRules(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 924
    :goto_0
    return-void

    .line 896
    :cond_0
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v3, p1, v4}, Landroid/util/SparseIntArray;->get(II)I

    move-result v1

    .line 897
    .local v1, "uidPolicy":I
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->isUidForegroundLocked(I)Z

    move-result v0

    .line 900
    .local v0, "uidForeground":Z
    const/4 v2, 0x0

    .line 901
    .local v2, "uidRules":I
    if-nez v0, :cond_1

    and-int/lit8 v3, v1, 0x1

    if-eqz v3, :cond_1

    .line 903
    const/4 v2, 0x1

    .line 905
    :cond_1
    if-nez v0, :cond_2

    iget-boolean v3, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z

    if-eqz v3, :cond_2

    .line 907
    const/4 v2, 0x1

    .line 909
    :cond_2
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mUidInNavigation:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3, p1, v4}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 911
    const/4 v2, 0x0

    .line 916
    :cond_3
    if-nez v2, :cond_4

    .line 917
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseIntArray;->delete(I)V

    .line 923
    :goto_1
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x1

    invoke-virtual {v3, v4, p1, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 919
    :cond_4
    iget-object v3, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    invoke-virtual {v3, p1, v2}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_1
.end method

.method private writePolicyLocked()V
    .locals 10

    .prologue
    .line 609
    const-string v7, "LocationPolicy"

    const-string v8, "writePolicyLocked()"

    invoke-static {v7, v8}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 611
    const/4 v1, 0x0

    .line 613
    .local v1, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mPolicyFile:Landroid/util/AtomicFile;

    invoke-virtual {v7}, Landroid/util/AtomicFile;->startWrite()Ljava/io/FileOutputStream;

    move-result-object v1

    .line 615
    new-instance v4, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v4}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 616
    .local v4, "out":Lorg/xmlpull/v1/XmlSerializer;
    const-string v7, "utf-8"

    invoke-interface {v4, v1, v7}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 617
    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-interface {v4, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 619
    const/4 v7, 0x0

    const-string v8, "policy-list"

    invoke-interface {v4, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 620
    const-string v7, "version"

    const/4 v8, 0x1

    invoke-static {v4, v7, v8}, Lcom/android/internal/util/XmlUtils;->writeIntAttribute(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/String;I)V

    .line 621
    const-string v7, "restrictBackground"

    iget-boolean v8, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z

    invoke-static {v4, v7, v8}, Lcom/android/internal/util/XmlUtils;->writeBooleanAttribute(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/String;Z)V

    .line 624
    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/location/LocationPolicy;

    .line 625
    .local v5, "policy":Landroid/location/LocationPolicy;
    const/4 v7, 0x0

    const-string v8, "location-policy"

    invoke-interface {v4, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 626
    const/4 v7, 0x0

    const-string v8, "provider"

    iget-object v9, v5, Landroid/location/LocationPolicy;->mProvider:Ljava/lang/String;

    invoke-interface {v4, v7, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 627
    const-string v7, "high-power"

    iget-boolean v8, v5, Landroid/location/LocationPolicy;->mHighCost:Z

    invoke-static {v4, v7, v8}, Lcom/android/internal/util/XmlUtils;->writeBooleanAttribute(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/String;Z)V

    .line 628
    const/4 v7, 0x0

    const-string v8, "location-policy"

    invoke-interface {v4, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 649
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "out":Lorg/xmlpull/v1/XmlSerializer;
    .end local v5    # "policy":Landroid/location/LocationPolicy;
    :catch_0
    move-exception v0

    .line 650
    .local v0, "e":Ljava/io/IOException;
    if-eqz v1, :cond_0

    .line 651
    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mPolicyFile:Landroid/util/AtomicFile;

    invoke-virtual {v7, v1}, Landroid/util/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V

    .line 654
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    :goto_1
    return-void

    .line 632
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "out":Lorg/xmlpull/v1/XmlSerializer;
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    :try_start_1
    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v7}, Landroid/util/SparseIntArray;->size()I

    move-result v7

    if-ge v2, v7, :cond_3

    .line 633
    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v7, v2}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v6

    .line 634
    .local v6, "uid":I
    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v7, v2}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v5

    .line 637
    .local v5, "policy":I
    if-nez v5, :cond_2

    .line 632
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 639
    :cond_2
    const/4 v7, 0x0

    const-string v8, "uid-policy"

    invoke-interface {v4, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 640
    const-string v7, "uid"

    invoke-static {v4, v7, v6}, Lcom/android/internal/util/XmlUtils;->writeIntAttribute(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/String;I)V

    .line 641
    const-string v7, "policy"

    invoke-static {v4, v7, v5}, Lcom/android/internal/util/XmlUtils;->writeIntAttribute(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/String;I)V

    .line 642
    const/4 v7, 0x0

    const-string v8, "uid-policy"

    invoke-interface {v4, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_3

    .line 645
    .end local v5    # "policy":I
    .end local v6    # "uid":I
    :cond_3
    const/4 v7, 0x0

    const-string v8, "policy-list"

    invoke-interface {v4, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 646
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 648
    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mPolicyFile:Landroid/util/AtomicFile;

    invoke-virtual {v7, v1}, Landroid/util/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method


# virtual methods
.method public checkUidNavigationScreenLock(I)Z
    .locals 1
    .param p1, "uid"    # I

    .prologue
    .line 731
    invoke-static {p1}, Lcom/android/server/power/PowerManagerServiceInjector;->getScreenWakeLockHoldByUid(I)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 9
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .prologue
    .line 831
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v7, "android.permission.DUMP"

    const-string v8, "LocationPolicy"

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 833
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 834
    .local v1, "argSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object v2, p3

    .local v2, "arr$":[Ljava/lang/String;
    array-length v5, v2

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v0, v2, v4

    .line 835
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 834
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 838
    .end local v0    # "arg":Ljava/lang/String;
    :cond_0
    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v7

    .line 839
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mLocationMode="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v8, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationMode:I

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 840
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mScreenOn="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v8, p0, Lcom/android/server/LocationPolicyManagerService;->mScreenOn:Z

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 841
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mPolicyFile="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mPolicyFile:Landroid/util/AtomicFile;

    invoke-virtual {v8}, Landroid/util/AtomicFile;->getBaseFile()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 842
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mRestrictBackground="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v8, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 843
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mLocationPolicies size="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->size()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 844
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mLocationRules size="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationRules:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->size()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 845
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mUidPolicies size="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v8}, Landroid/util/SparseIntArray;->size()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 846
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v6}, Landroid/util/SparseIntArray;->size()I

    move-result v6

    if-ge v3, v6, :cond_1

    .line 847
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "uid="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v8, v3}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ", "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 848
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v3}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v6

    invoke-static {p2, v6}, Landroid/location/LocationPolicyManager;->dumpPolicy(Ljava/io/PrintWriter;I)V

    .line 849
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 846
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 851
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mUidRules size="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    invoke-virtual {v8}, Landroid/util/SparseIntArray;->size()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 852
    const/4 v3, 0x0

    :goto_2
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    invoke-virtual {v6}, Landroid/util/SparseIntArray;->size()I

    move-result v6

    if-ge v3, v6, :cond_2

    .line 853
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "uid="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    invoke-virtual {v8, v3}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ", "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 854
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v3}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v6

    invoke-static {p2, v6}, Landroid/location/LocationPolicyManager;->dumpRules(Ljava/io/PrintWriter;I)V

    .line 855
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 852
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 857
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mUidInNavigation size ="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mUidInNavigation:Landroid/util/SparseBooleanArray;

    invoke-virtual {v8}, Landroid/util/SparseBooleanArray;->size()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 858
    const/4 v3, 0x0

    :goto_3
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidInNavigation:Landroid/util/SparseBooleanArray;

    invoke-virtual {v6}, Landroid/util/SparseBooleanArray;->size()I

    move-result v6

    if-ge v3, v6, :cond_3

    .line 859
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "uid="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mUidInNavigation:Landroid/util/SparseBooleanArray;

    invoke-virtual {v8, v3}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ", inNavigation="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mUidInNavigation:Landroid/util/SparseBooleanArray;

    invoke-virtual {v8, v3}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 858
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 861
    :cond_3
    monitor-exit v7

    .line 862
    return-void

    .line 861
    .end local v3    # "i":I
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6
.end method

.method public getLocationPolicies()[Landroid/location/LocationPolicy;
    .locals 3

    .prologue
    .line 784
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_LOCATION_POLICY"

    const-string v2, "LocationPolicy"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 786
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v1

    .line 787
    :try_start_0
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    iget-object v2, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    new-array v2, v2, [Landroid/location/LocationPolicy;

    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/location/LocationPolicy;

    monitor-exit v1

    return-object v0

    .line 788
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getRestrictBackground()Z
    .locals 3

    .prologue
    .line 808
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_LOCATION_POLICY"

    const-string v2, "LocationPolicy"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 810
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v1

    .line 811
    :try_start_0
    iget-boolean v0, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z

    monitor-exit v1

    return v0

    .line 812
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getUidPolicy(I)I
    .locals 3
    .param p1, "uid"    # I

    .prologue
    .line 683
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_LOCATION_POLICY"

    const-string v2, "LocationPolicy"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 685
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v1

    .line 686
    :try_start_0
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    monitor-exit v1

    return v0

    .line 687
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getUidsWithPolicy(I)[I
    .locals 7
    .param p1, "policy"    # I

    .prologue
    .line 692
    iget-object v4, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.MANAGE_LOCATION_POLICY"

    const-string v6, "LocationPolicy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    const/4 v4, 0x0

    new-array v3, v4, [I

    .line 695
    .local v3, "uids":[I
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v5

    .line 696
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v4, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v4}, Landroid/util/SparseIntArray;->size()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 697
    iget-object v4, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v1

    .line 698
    .local v1, "uid":I
    iget-object v4, p0, Lcom/android/server/LocationPolicyManagerService;->mUidPolicies:Landroid/util/SparseIntArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v2

    .line 699
    .local v2, "uidPolicy":I
    if-ne v2, p1, :cond_0

    .line 700
    invoke-static {v3, v1}, Lcom/android/internal/util/ArrayUtils;->appendInt([II)[I

    move-result-object v3

    .line 696
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 703
    .end local v1    # "uid":I
    .end local v2    # "uidPolicy":I
    :cond_1
    monitor-exit v5

    .line 704
    return-object v3

    .line 703
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public isUidForeground(I)Z
    .locals 3
    .param p1, "uid"    # I

    .prologue
    .line 817
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_LOCATION_POLICY"

    const-string v2, "LocationPolicy"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 819
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v1

    .line 820
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->isUidForegroundLocked(I)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 821
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public registerListener(Landroid/location/ILocationPolicyListener;)V
    .locals 3
    .param p1, "listener"    # Landroid/location/ILocationPolicyListener;

    .prologue
    .line 737
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.LOCATION_POLICY_INTERNAL"

    const-string v2, "LocationPolicy"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->register(Landroid/os/IInterface;)Z

    .line 742
    return-void
.end method

.method public setLocationPolicies([Landroid/location/LocationPolicy;)V
    .locals 7
    .param p1, "policies"    # [Landroid/location/LocationPolicy;

    .prologue
    .line 754
    iget-object v4, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.MANAGE_LOCATION_POLICY"

    const-string v6, "LocationPolicy"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 758
    move-object v0, p1

    .local v0, "arr$":[Landroid/location/LocationPolicy;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 759
    .local v3, "policy":Landroid/location/LocationPolicy;
    invoke-virtual {v3}, Landroid/location/LocationPolicy;->getMatchRule()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 766
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unexpected provider "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/location/LocationPolicy;->getMatchRule()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 758
    :pswitch_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 770
    .end local v3    # "policy":Landroid/location/LocationPolicy;
    :cond_0
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v5

    .line 771
    :try_start_0
    iget-object v4, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 772
    move-object v0, p1

    array-length v2, v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 773
    .restart local v3    # "policy":Landroid/location/LocationPolicy;
    iget-object v4, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationPolicies:Ljava/util/HashMap;

    iget-object v6, v3, Landroid/location/LocationPolicy;->mProvider:Ljava/lang/String;

    invoke-virtual {v4, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 772
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 776
    .end local v3    # "policy":Landroid/location/LocationPolicy;
    :cond_1
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateLocationRulesLocked()V

    .line 777
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateNotificationsLocked()V

    .line 778
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->writePolicyLocked()V

    .line 779
    monitor-exit v5

    .line 780
    return-void

    .line 779
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 759
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setRestrictBackground(Z)V
    .locals 4
    .param p1, "restrictBackground"    # Z

    .prologue
    const/4 v1, 0x0

    .line 793
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.MANAGE_LOCATION_POLICY"

    const-string v3, "LocationPolicy"

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 795
    iget-object v2, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v2

    .line 796
    :try_start_0
    iput-boolean p1, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z

    .line 797
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForRestrictBackgroundLocked()V

    .line 798
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateNotificationsLocked()V

    .line 799
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->writePolicyLocked()V

    .line 800
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 802
    iget-object v2, p0, Lcom/android/server/LocationPolicyManagerService;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x2

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 804
    return-void

    .line 800
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_0
    move v0, v1

    .line 802
    goto :goto_0
.end method

.method public setUidNavigationStart(I)V
    .locals 3
    .param p1, "uid"    # I

    .prologue
    .line 709
    const-string v0, "LocationPolicy"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "uid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " navigation start"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 710
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v1

    .line 711
    :try_start_0
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mUidInNavigation:Landroid/util/SparseBooleanArray;

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 712
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    if-eqz v0, :cond_0

    .line 713
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForUidLocked(I)V

    .line 715
    :cond_0
    monitor-exit v1

    .line 716
    return-void

    .line 715
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setUidNavigationStop(I)V
    .locals 3
    .param p1, "uid"    # I

    .prologue
    .line 720
    const-string v0, "LocationPolicy"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "uid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " navigation stopped"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 721
    iget-object v1, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v1

    .line 722
    :try_start_0
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mUidInNavigation:Landroid/util/SparseBooleanArray;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 723
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRules:Landroid/util/SparseIntArray;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    if-nez v0, :cond_0

    .line 724
    invoke-direct {p0, p1}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForUidLocked(I)V

    .line 726
    :cond_0
    monitor-exit v1

    .line 727
    return-void

    .line 726
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setUidPolicy(II)V
    .locals 3
    .param p1, "uid"    # I
    .param p2, "policy"    # I

    .prologue
    .line 658
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_LOCATION_POLICY"

    const-string v2, "LocationPolicy"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 660
    invoke-static {p1}, Landroid/os/UserHandle;->isApp(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 661
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot apply policy to UID "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 664
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/android/server/LocationPolicyManagerService;->setUidPolicyUnchecked(IIZ)V

    .line 665
    return-void
.end method

.method public systemRunning()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 189
    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mRulesLock:Ljava/lang/Object;

    monitor-enter v6

    .line 190
    :try_start_0
    const-string v5, "LocationPolicy"

    const-string v7, "systemRunning()"

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v7, "power"

    invoke-virtual {v5, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;

    iput-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mPowerManager:Landroid/os/PowerManager;

    .line 196
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->readPolicyLocked()V

    .line 198
    iget-boolean v5, p0, Lcom/android/server/LocationPolicyManagerService;->mRestrictBackground:Z

    if-eqz v5, :cond_0

    .line 199
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForRestrictBackgroundLocked()V

    .line 200
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateNotificationsLocked()V

    .line 204
    :cond_0
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v5}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v5

    iput-boolean v5, p0, Lcom/android/server/LocationPolicyManagerService;->mScreenOn:Z

    .line 206
    invoke-direct {p0}, Lcom/android/server/LocationPolicyManagerService;->updateRulesForScreenLocked()V

    .line 207
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    :try_start_1
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mActivityManager:Landroid/app/IActivityManager;

    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mProcessObserver:Landroid/app/IProcessObserver;

    invoke-interface {v5, v6}, Landroid/app/IActivityManager;->registerProcessObserver(Landroid/app/IProcessObserver;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 215
    :goto_0
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .line 216
    .local v3, "screenFilter":Landroid/content/IntentFilter;
    const-string v5, "android.intent.action.SCREEN_ON"

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 217
    const-string v5, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 218
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mScreenReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v5, v6, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 221
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 222
    .local v2, "packageFilter":Landroid/content/IntentFilter;
    const-string v5, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 223
    const-string v5, "package"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 224
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mPackageReceiver:Landroid/content/BroadcastReceiver;

    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v5, v6, v2, v9, v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 227
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUidRemovedReceiver:Landroid/content/BroadcastReceiver;

    new-instance v7, Landroid/content/IntentFilter;

    const-string v8, "android.intent.action.UID_REMOVED"

    invoke-direct {v7, v8}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v5, v6, v7, v9, v8}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 231
    new-instance v4, Landroid/content/IntentFilter;

    invoke-direct {v4}, Landroid/content/IntentFilter;-><init>()V

    .line 232
    .local v4, "userFilter":Landroid/content/IntentFilter;
    const-string v5, "android.intent.action.USER_ADDED"

    invoke-virtual {v4, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 233
    const-string v5, "android.intent.action.USER_REMOVED"

    invoke-virtual {v4, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 234
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mUserReceiver:Landroid/content/BroadcastReceiver;

    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v5, v6, v4, v9, v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 237
    new-instance v0, Landroid/content/IntentFilter;

    const-string v5, "com.android.server.location.action.ALLOW_BACKGROUND"

    invoke-direct {v0, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 238
    .local v0, "allowFilter":Landroid/content/IntentFilter;
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mAllowReceiver:Landroid/content/BroadcastReceiver;

    const-string v7, "android.permission.MANAGE_LOCATION_POLICY"

    iget-object v8, p0, Lcom/android/server/LocationPolicyManagerService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v5, v6, v0, v7, v8}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 241
    new-instance v1, Landroid/content/IntentFilter;

    const-string v5, "android.location.MODE_CHANGED"

    invoke-direct {v1, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 242
    .local v1, "locationStateFilter":Landroid/content/IntentFilter;
    iget-object v5, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/LocationPolicyManagerService;->mLocationModeReceiver:Landroid/content/BroadcastReceiver;

    iget-object v7, p0, Lcom/android/server/LocationPolicyManagerService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v5, v6, v1, v9, v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 244
    return-void

    .line 207
    .end local v0    # "allowFilter":Landroid/content/IntentFilter;
    .end local v1    # "locationStateFilter":Landroid/content/IntentFilter;
    .end local v2    # "packageFilter":Landroid/content/IntentFilter;
    .end local v3    # "screenFilter":Landroid/content/IntentFilter;
    .end local v4    # "userFilter":Landroid/content/IntentFilter;
    :catchall_0
    move-exception v5

    :try_start_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5

    .line 211
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public unregisterListener(Landroid/location/ILocationPolicyListener;)V
    .locals 3
    .param p1, "listener"    # Landroid/location/ILocationPolicyListener;

    .prologue
    .line 747
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.LOCATION_POLICY_INTERNAL"

    const-string v2, "LocationPolicy"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 749
    iget-object v0, p0, Lcom/android/server/LocationPolicyManagerService;->mListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->unregister(Landroid/os/IInterface;)Z

    .line 750
    return-void
.end method
