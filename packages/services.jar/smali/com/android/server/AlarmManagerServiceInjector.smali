.class Lcom/android/server/AlarmManagerServiceInjector;
.super Ljava/lang/Object;
.source "AlarmManagerServiceInjector.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final PERCEPTIBLE_APP_ADJ:I = 0x2

.field static final PERSIST_PACKAGES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "AlarmManagerServiceInjector"

.field private static final THIRD_PARTY_WAKEUP_RESTRICT_PROP:Ljava/lang/String; = "persist.sys.wakeup_restrict"

.field private static final WAKEUP_WHITE_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/android/server/AlarmManagerServiceInjector$1;

    invoke-direct {v0}, Lcom/android/server/AlarmManagerServiceInjector$1;-><init>()V

    sput-object v0, Lcom/android/server/AlarmManagerServiceInjector;->WAKEUP_WHITE_LIST:Ljava/util/List;

    .line 34
    new-instance v0, Lcom/android/server/AlarmManagerServiceInjector$2;

    invoke-direct {v0}, Lcom/android/server/AlarmManagerServiceInjector$2;-><init>()V

    sput-object v0, Lcom/android/server/AlarmManagerServiceInjector;->PERSIST_PACKAGES:Ljava/util/List;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CheckIfAlarmGenralRistrictApply(II)Z
    .locals 5
    .param p0, "uid"    # I
    .param p1, "pid"    # I

    .prologue
    const/4 v3, 0x0

    .line 106
    const/16 v4, 0x2710

    if-gt p0, v4, :cond_1

    .line 118
    :cond_0
    :goto_0
    return v3

    .line 110
    :cond_1
    invoke-static {p1}, Lcom/android/server/am/ExtraActivityManagerService;->getCurAdjByPid(I)I

    move-result v0

    .line 111
    .local v0, "curAdj":I
    invoke-static {p1}, Lcom/android/server/am/ExtraActivityManagerService;->getProcStateByPid(I)I

    move-result v2

    .line 112
    .local v2, "procState":I
    invoke-static {p1}, Lcom/android/server/am/ExtraActivityManagerService;->hasForegroundActivities(I)Z

    move-result v1

    .line 114
    .local v1, "hasForegroundActivities":Z
    if-nez v1, :cond_0

    const/4 v4, 0x2

    if-gt v0, v4, :cond_2

    const/16 v4, 0x8

    if-ne v2, v4, :cond_0

    .line 118
    :cond_2
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public static adjustWakeUpAlarmType(Landroid/content/Context;I)I
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "originalType"    # I

    .prologue
    const/4 v7, 0x0

    .line 53
    if-eqz p1, :cond_1

    const/4 v6, 0x2

    if-eq p1, v6, :cond_1

    .line 81
    .end local p1    # "originalType":I
    :cond_0
    :goto_0
    return p1

    .line 56
    .restart local p1    # "originalType":I
    :cond_1
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v5

    .line 58
    .local v5, "uid":I
    const/16 v6, 0x2710

    if-lt v5, v6, :cond_0

    .line 62
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, "packages":[Ljava/lang/String;
    if-eqz v4, :cond_2

    array-length v6, v4

    if-lez v6, :cond_2

    .line 64
    aget-object v3, v4, v7

    .line 65
    .local v3, "packageName":Ljava/lang/String;
    invoke-static {v3}, Lcom/android/server/AlarmManagerServiceInjector;->inWakeUpAlarmWhiteList(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 68
    .end local v3    # "packageName":Ljava/lang/String;
    :cond_2
    const-string v6, "persist.sys.wakeup_restrict"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 70
    const-string v6, "AlarmManagerServiceInjector"

    const-string v7, "restrict all third party wakeup is set"

    invoke-static {v6, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    invoke-static {p1}, Lcom/android/server/AlarmManagerServiceInjector;->nonWakeUpType(I)I

    move-result p1

    goto :goto_0

    .line 75
    :cond_3
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    .line 76
    .local v1, "id":J
    invoke-static {p0, v5}, Landroid/miui/AppOpsUtils;->getWakeUpAlarm(Landroid/content/Context;I)I

    move-result v0

    .line 77
    .local v0, "alarmMode":I
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 78
    if-eqz v0, :cond_0

    .line 79
    invoke-static {p1}, Lcom/android/server/AlarmManagerServiceInjector;->nonWakeUpType(I)I

    move-result p1

    goto :goto_0
.end method

.method public static checkAlarmIsAllowedSend(Landroid/content/Context;Lcom/android/server/AlarmManagerService$Alarm;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "alarm"    # Lcom/android/server/AlarmManagerService$Alarm;

    .prologue
    .line 122
    iget v0, p1, Lcom/android/server/AlarmManagerService$Alarm;->pid:I

    iget-object v1, p1, Lcom/android/server/AlarmManagerService$Alarm;->operation:Landroid/app/PendingIntent;

    invoke-virtual {v1}, Landroid/app/PendingIntent;->getCreatorUid()I

    move-result v1

    iget v2, p1, Lcom/android/server/AlarmManagerService$Alarm;->type:I

    iget-object v3, p1, Lcom/android/server/AlarmManagerService$Alarm;->operation:Landroid/app/PendingIntent;

    invoke-virtual {v3}, Landroid/app/PendingIntent;->getCreatorUid()I

    move-result v3

    iget v4, p1, Lcom/android/server/AlarmManagerService$Alarm;->pid:I

    invoke-static {v3, v4}, Lcom/android/server/AlarmManagerServiceInjector;->CheckIfAlarmGenralRistrictApply(II)Z

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/whetstone/client/WhetstoneClientManager;->isAlarmAllowedLocked(IIIZ)Z

    move-result v0

    return v0
.end method

.method static filterPersistPackages([Ljava/lang/String;)[Ljava/lang/String;
    .locals 6
    .param p0, "pkgList"    # [Ljava/lang/String;

    .prologue
    .line 41
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v1, "filteredPkgList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p0, :cond_1

    array-length v5, p0

    if-lez v5, :cond_1

    .line 43
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 44
    .local v4, "pkg":Ljava/lang/String;
    sget-object v5, Lcom/android/server/AlarmManagerServiceInjector;->PERSIST_PACKAGES:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 45
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 49
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "pkg":Ljava/lang/String;
    :cond_1
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v1, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    return-object v5
.end method

.method private static inWakeUpAlarmWhiteList(Ljava/lang/String;)Z
    .locals 3
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    .line 85
    sget-object v2, Lcom/android/server/AlarmManagerServiceInjector;->WAKEUP_WHITE_LIST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 86
    .local v1, "pkg":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 87
    const/4 v2, 0x1

    .line 90
    .end local v1    # "pkg":Ljava/lang/String;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static nonWakeUpType(I)I
    .locals 0
    .param p0, "type"    # I

    .prologue
    .line 94
    packed-switch p0, :pswitch_data_0

    .line 100
    .end local p0    # "type":I
    :goto_0
    :pswitch_0
    return p0

    .line 96
    .restart local p0    # "type":I
    :pswitch_1
    const/4 p0, 0x3

    goto :goto_0

    .line 98
    :pswitch_2
    const/4 p0, 0x1

    goto :goto_0

    .line 94
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
