.class public final Lcom/android/server/input/InputApplicationHandle;
.super Ljava/lang/Object;
.source "InputApplicationHandle.java"


# instance fields
.field public final appWindowToken:Ljava/lang/Object;

.field public dispatchingTimeoutNanos:J

.field public displayId:I

.field public name:Ljava/lang/String;

.field private ptr:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .param p1, "appWindowToken"    # Ljava/lang/Object;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/android/server/input/InputApplicationHandle;->appWindowToken:Ljava/lang/Object;

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/server/input/InputApplicationHandle;->displayId:I

    .line 52
    return-void
.end method

.method private native nativeDispose()V
.end method


# virtual methods
.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 63
    :try_start_0
    invoke-direct {p0}, Lcom/android/server/input/InputApplicationHandle;->nativeDispose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 67
    return-void

    .line 65
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public setDisplayId(I)V
    .locals 0
    .param p1, "givenDisplayId"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/android/server/input/InputApplicationHandle;->displayId:I

    .line 57
    return-void
.end method
