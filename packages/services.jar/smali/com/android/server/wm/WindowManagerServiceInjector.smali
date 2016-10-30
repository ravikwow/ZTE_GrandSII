.class Lcom/android/server/wm/WindowManagerServiceInjector;
.super Ljava/lang/Object;
.source "WindowManagerServiceInjector.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static reportHappendErrorDuringResized(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/WindowState;Lcom/android/server/wm/WindowStateAnimator;Landroid/os/RemoteException;)V
    .locals 3
    .param p0, "thiz"    # Lcom/android/server/wm/WindowManagerService;
    .param p1, "win"    # Lcom/android/server/wm/WindowState;
    .param p2, "winAnimator"    # Lcom/android/server/wm/WindowStateAnimator;
    .param p3, "e"    # Landroid/os/RemoteException;

    .prologue
    const/4 v2, 0x0

    .line 10
    instance-of v0, p3, Landroid/os/DeadObjectException;

    if-eqz v0, :cond_0

    .line 11
    const-string v0, "WindowState"

    const-string v1, "Error happens during resized "

    invoke-static {v0, v1, p3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 13
    iput-boolean v2, p1, Lcom/android/server/wm/WindowState;->mOverscanInsetsChanged:Z

    .line 14
    iput-boolean v2, p1, Lcom/android/server/wm/WindowState;->mContentInsetsChanged:Z

    .line 15
    iput-boolean v2, p1, Lcom/android/server/wm/WindowState;->mVisibleInsetsChanged:Z

    .line 16
    iput-boolean v2, p2, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceResized:Z

    .line 19
    iget-object v0, p1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 21
    :cond_0
    return-void
.end method
