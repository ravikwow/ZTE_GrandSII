.class Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;
.super Landroid/content/pm/IPackageInstallObserver$Stub;
.source "PackageManagerProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/pm/PackageManagerProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PackageInstallObserver"
.end annotation


# instance fields
.field finished:Z

.field result:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/content/pm/IPackageInstallObserver$Stub;-><init>()V

    .line 38
    const/16 v0, -0x6e

    iput v0, p0, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;->result:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/pm/PackageManagerProxy$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/pm/PackageManagerProxy$1;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public packageInstalled(Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "status"    # I

    .prologue
    .line 41
    monitor-enter p0

    .line 42
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;->finished:Z

    .line 43
    iput p2, p0, Lcom/android/server/pm/PackageManagerProxy$PackageInstallObserver;->result:I

    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 45
    monitor-exit p0

    .line 46
    return-void

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
