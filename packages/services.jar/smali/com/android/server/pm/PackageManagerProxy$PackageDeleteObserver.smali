.class Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;
.super Landroid/content/pm/IPackageDeleteObserver$Stub;
.source "PackageManagerProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/pm/PackageManagerProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PackageDeleteObserver"
.end annotation


# instance fields
.field finished:Z

.field result:Z


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/content/pm/IPackageDeleteObserver$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/pm/PackageManagerProxy$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/pm/PackageManagerProxy$1;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public packageDeleted(Ljava/lang/String;I)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "returnCode"    # I

    .prologue
    const/4 v0, 0x1

    .line 28
    monitor-enter p0

    .line 29
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;->finished:Z

    .line 30
    if-ne p2, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/server/pm/PackageManagerProxy$PackageDeleteObserver;->result:Z

    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 30
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
