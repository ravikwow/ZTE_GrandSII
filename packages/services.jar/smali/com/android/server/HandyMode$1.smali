.class final Lcom/android/server/HandyMode$1;
.super Ljava/lang/Object;
.source "HandyMode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/HandyMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 105
    invoke-static {}, Lcom/android/server/HandyMode;->gotoHandyModeSetting()V

    .line 106
    return-void
.end method
