.class Lcom/android/server/wm/WindowStateAnimator;
.super Ljava/lang/Object;
.source "WindowStateAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/wm/WindowStateAnimator$SurfaceTrace;
    }
.end annotation


# static fields
.field static final COMMIT_DRAW_PENDING:I = 0x2

.field static final DRAW_PENDING:I = 0x1

.field static final HAS_DRAWN:I = 0x4

.field static final NO_SURFACE:I = 0x0

.field static final READY_TO_SHOW:I = 0x3

.field static final TAG:Ljava/lang/String; = "WindowStateAnimator"


# instance fields
.field final CLIP_UPDATE_FLAG:I

.field mAlpha:F

.field mAnimDh:I

.field mAnimDw:I

.field mAnimLayer:I

.field mAnimating:Z

.field mAnimation:Landroid/view/animation/Animation;

.field mAnimationIsEntrance:Z

.field final mAnimator:Lcom/android/server/wm/WindowAnimator;

.field mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

.field final mAttachedWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

.field mAttrFlags:I

.field mAttrType:I

.field final mContext:Landroid/content/Context;

.field mDrawState:I

.field mDsDx:F

.field mDsDy:F

.field mDtDx:F

.field mDtDy:F

.field mEnterAnimationPending:Z

.field mHasLocalTransformation:Z

.field mHasTransformation:Z

.field mHaveMatrix:Z

.field final mIsWallpaper:Z

.field mLastAlpha:F

.field final mLastBounds:Landroid/graphics/Rect;

.field mLastDsDx:F

.field mLastDsDy:F

.field mLastDtDx:F

.field mLastDtDy:F

.field mLastHidden:Z

.field mLastLayer:I

.field final mLayerStack:I

.field mLocalAnimating:Z

.field mPendingDestroySurface:Landroid/view/SurfaceControl;

.field final mPolicy:Landroid/view/WindowManagerPolicy;

.field final mService:Lcom/android/server/wm/WindowManagerService;

.field final mSession:Lcom/android/server/wm/Session;

.field mShownAlpha:F

.field mSurfaceAlpha:F

.field mSurfaceControl:Landroid/view/SurfaceControl;

.field mSurfaceDestroyDeferred:Z

.field mSurfaceH:F

.field mSurfaceLayer:I

.field mSurfaceNeedClip:Z

.field mSurfaceResized:Z

.field mSurfaceShown:Z

.field mSurfaceW:F

.field mSurfaceX:F

.field mSurfaceY:F

.field final mTransformation:Landroid/view/animation/Transformation;

.field final mUniverseTransform:Landroid/view/animation/Transformation;

.field mWasAnimating:Z

.field final mWin:Lcom/android/server/wm/WindowState;


# direct methods
.method public constructor <init>(Lcom/android/server/wm/WindowState;)V
    .locals 6
    .param p1, "win"    # Lcom/android/server/wm/WindowState;

    .prologue
    const/4 v3, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v2, Landroid/view/animation/Transformation;

    invoke-direct {v2}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mUniverseTransform:Landroid/view/animation/Transformation;

    .line 82
    new-instance v2, Landroid/view/animation/Transformation;

    invoke-direct {v2}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    .line 102
    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 103
    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAlpha:F

    .line 104
    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastAlpha:F

    .line 110
    iput v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    iput v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    .line 111
    iput v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDsDx:F

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDtDx:F

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDsDy:F

    iput v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDtDy:F

    .line 119
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceNeedClip:Z

    .line 120
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastBounds:Landroid/graphics/Rect;

    .line 121
    const/high16 v2, 0x40000000    # 2.0f

    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->CLIP_UPDATE_FLAG:I

    .line 165
    iget-object v1, p1, Lcom/android/server/wm/WindowState;->mService:Lcom/android/server/wm/WindowManagerService;

    .line 167
    .local v1, "service":Lcom/android/server/wm/WindowManagerService;
    iput-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    .line 168
    iget-object v2, v1, Lcom/android/server/wm/WindowManagerService;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iput-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    .line 169
    iget-object v2, v1, Lcom/android/server/wm/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    iput-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mPolicy:Landroid/view/WindowManagerPolicy;

    .line 170
    iget-object v2, v1, Lcom/android/server/wm/WindowManagerService;->mContext:Landroid/content/Context;

    iput-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mContext:Landroid/content/Context;

    .line 171
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {v2}, Lcom/android/server/wm/DisplayContent;->getDisplayInfo()Landroid/view/DisplayInfo;

    move-result-object v0

    .line 172
    .local v0, "displayInfo":Landroid/view/DisplayInfo;
    iget v2, v0, Landroid/view/DisplayInfo;->appWidth:I

    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimDw:I

    .line 173
    iget v2, v0, Landroid/view/DisplayInfo;->appHeight:I

    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimDh:I

    .line 175
    iput-object p1, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    .line 176
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    if-nez v2, :cond_0

    move-object v2, v3

    :goto_0
    iput-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAttachedWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    .line 178
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-nez v2, :cond_1

    :goto_1
    iput-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    .line 179
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iput-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mSession:Lcom/android/server/wm/Session;

    .line 180
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAttrFlags:I

    .line 181
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAttrType:I

    .line 182
    iget-boolean v2, p1, Lcom/android/server/wm/WindowState;->mIsWallpaper:Z

    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mIsWallpaper:Z

    .line 183
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {v2}, Lcom/android/server/wm/DisplayContent;->getDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Display;->getLayerStack()I

    move-result v2

    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mLayerStack:I

    .line 184
    return-void

    .line 176
    :cond_0
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    goto :goto_0

    .line 178
    :cond_1
    iget-object v2, p1, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v3, v2, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    goto :goto_1
.end method

.method static drawStateToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "state"    # I

    .prologue
    .line 145
    packed-switch p0, :pswitch_data_0

    .line 151
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 146
    :pswitch_0
    const-string v0, "NO_SURFACE"

    goto :goto_0

    .line 147
    :pswitch_1
    const-string v0, "DRAW_PENDING"

    goto :goto_0

    .line 148
    :pswitch_2
    const-string v0, "COMMIT_DRAW_PENDING"

    goto :goto_0

    .line 149
    :pswitch_3
    const-string v0, "READY_TO_SHOW"

    goto :goto_0

    .line 150
    :pswitch_4
    const-string v0, "HAS_DRAWN"

    goto :goto_0

    .line 145
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private stepAnimation(J)Z
    .locals 3
    .param p1, "currentTime"    # J

    .prologue
    .line 238
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    if-nez v1, :cond_1

    .line 239
    :cond_0
    const/4 v0, 0x0

    .line 246
    :goto_0
    return v0

    .line 241
    :cond_1
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v1}, Landroid/view/animation/Transformation;->clear()V

    .line 242
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v1, p1, p2, v2}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    move-result v0

    .line 246
    .local v0, "more":Z
    goto :goto_0
.end method


# virtual methods
.method applyAnimationLocked(IZ)Z
    .locals 6
    .param p1, "transit"    # I
    .param p2, "isEntrance"    # Z

    .prologue
    const/4 v3, 0x1

    .line 1664
    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    if-eqz v4, :cond_1

    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimationIsEntrance:Z

    if-ne v4, p2, :cond_1

    .line 1721
    :cond_0
    :goto_0
    return v3

    .line 1674
    :cond_1
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->okToDisplay()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1675
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mPolicy:Landroid/view/WindowManagerPolicy;

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-interface {v4, v5, p1}, Landroid/view/WindowManagerPolicy;->selectAnimationLw(Landroid/view/WindowManagerPolicy$WindowState;I)I

    move-result v1

    .line 1676
    .local v1, "anim":I
    const/4 v2, -0x1

    .line 1677
    .local v2, "attr":I
    const/4 v0, 0x0

    .line 1678
    .local v0, "a":Landroid/view/animation/Animation;
    if-eqz v1, :cond_5

    .line 1679
    const/4 v4, -0x1

    if-eq v1, v4, :cond_4

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mContext:Landroid/content/Context;

    invoke-static {v4, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 1705
    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    .line 1714
    invoke-virtual {p0, v0}, Lcom/android/server/wm/WindowStateAnimator;->setAnimation(Landroid/view/animation/Animation;)V

    .line 1715
    iput-boolean p2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimationIsEntrance:Z

    .line 1721
    .end local v0    # "a":Landroid/view/animation/Animation;
    .end local v1    # "anim":I
    .end local v2    # "attr":I
    :cond_3
    :goto_2
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-nez v4, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    .line 1679
    .restart local v0    # "a":Landroid/view/animation/Animation;
    .restart local v1    # "anim":I
    .restart local v2    # "attr":I
    :cond_4
    const/4 v0, 0x0

    goto :goto_1

    .line 1681
    :cond_5
    packed-switch p1, :pswitch_data_0

    .line 1695
    :goto_3
    if-ltz v2, :cond_2

    .line 1696
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mAppTransition:Lcom/android/server/wm/AppTransition;

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v5, v5, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v4, v5, v2}, Lcom/android/server/wm/AppTransition;->loadAnimation(Landroid/view/WindowManager$LayoutParams;I)Landroid/view/animation/Animation;

    move-result-object v0

    goto :goto_1

    .line 1683
    :pswitch_0
    const/4 v2, 0x0

    .line 1684
    goto :goto_3

    .line 1686
    :pswitch_1
    const/4 v2, 0x1

    .line 1687
    goto :goto_3

    .line 1689
    :pswitch_2
    const/4 v2, 0x2

    .line 1690
    goto :goto_3

    .line 1692
    :pswitch_3
    const/4 v2, 0x3

    goto :goto_3

    .line 1718
    .end local v0    # "a":Landroid/view/animation/Animation;
    .end local v1    # "anim":I
    .end local v2    # "attr":I
    :cond_6
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->clearAnimation()V

    goto :goto_2

    .line 1681
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method applyDecorRect(Landroid/graphics/Rect;)V
    .locals 10
    .param p1, "decorRect"    # Landroid/graphics/Rect;

    .prologue
    const/4 v7, 0x0

    const/high16 v9, 0x3f000000    # 0.5f

    .line 1122
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    .line 1124
    .local v3, "w":Lcom/android/server/wm/WindowState;
    iget v4, v3, Lcom/android/server/wm/WindowState;->mXOffset:I

    iget-object v5, v3, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    add-int v0, v4, v5

    .line 1125
    .local v0, "offX":I
    iget v4, v3, Lcom/android/server/wm/WindowState;->mYOffset:I

    iget-object v5, v3, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    add-int v1, v4, v5

    .line 1127
    .local v1, "offY":I
    iget-object v4, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v5, v3, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    iget-object v6, v3, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    invoke-virtual {v4, v7, v7, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 1129
    iget-object v4, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget v5, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v0

    iget v6, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v1

    iget v7, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v7, v0

    iget v8, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v8, v1

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;->intersect(IIII)Z

    .line 1137
    iget-boolean v4, v3, Lcom/android/server/wm/WindowState;->mEnforceSizeCompat:Z

    if-eqz v4, :cond_0

    iget v4, v3, Lcom/android/server/wm/WindowState;->mInvGlobalScale:F

    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v4, v4, v5

    if-eqz v4, :cond_0

    .line 1138
    iget v2, v3, Lcom/android/server/wm/WindowState;->mInvGlobalScale:F

    .line 1139
    .local v2, "scale":F
    iget-object v4, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v5, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    mul-float/2addr v5, v2

    sub-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->left:I

    .line 1140
    iget-object v4, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v5, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    mul-float/2addr v5, v2

    sub-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->top:I

    .line 1141
    iget-object v4, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v5, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    add-int/lit8 v5, v5, 0x1

    int-to-float v5, v5

    mul-float/2addr v5, v2

    sub-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->right:I

    .line 1142
    iget-object v4, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v5, v3, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v5, v5, 0x1

    int-to-float v5, v5

    mul-float/2addr v5, v2

    sub-float/2addr v5, v9

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->bottom:I

    .line 1144
    .end local v2    # "scale":F
    :cond_0
    return-void
.end method

.method applyEnterAnimationLocked()V
    .locals 3

    .prologue
    .line 1640
    iget-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mEnterAnimationPending:Z

    if-eqz v1, :cond_1

    .line 1641
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mEnterAnimationPending:Z

    .line 1642
    const/4 v0, 0x1

    .line 1646
    .local v0, "transit":I
    :goto_0
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/android/server/wm/WindowStateAnimator;->applyAnimationLocked(IZ)Z

    .line 1648
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mDisplayMagnifier:Lcom/android/server/wm/DisplayMagnifier;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v1}, Lcom/android/server/wm/WindowState;->getDisplayId()I

    move-result v1

    if-nez v1, :cond_0

    .line 1650
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mDisplayMagnifier:Lcom/android/server/wm/DisplayMagnifier;

    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v1, v2, v0}, Lcom/android/server/wm/DisplayMagnifier;->onWindowTransitionLocked(Lcom/android/server/wm/WindowState;I)V

    .line 1652
    :cond_0
    return-void

    .line 1644
    .end local v0    # "transit":I
    :cond_1
    const/4 v0, 0x3

    .restart local v0    # "transit":I
    goto :goto_0
.end method

.method cancelExitAnimationForNextAnimationLocked()V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 231
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    .line 232
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    .line 233
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->destroySurfaceLocked()V

    .line 235
    :cond_0
    return-void
.end method

.method public clearAnimation()V
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_0

    .line 201
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    .line 202
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    .line 203
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 204
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    .line 206
    :cond_0
    return-void
.end method

.method commitFinishDrawingLocked(J)Z
    .locals 6
    .param p1, "currentTime"    # J

    .prologue
    const/4 v5, 0x3

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 473
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    .line 485
    :goto_0
    return v1

    .line 479
    :cond_0
    iput v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    .line 480
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->type:I

    if-ne v3, v5, :cond_1

    move v1, v2

    .line 481
    .local v1, "starting":Z
    :cond_1
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v3, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    .line 482
    .local v0, "atoken":Lcom/android/server/wm/AppWindowToken;
    if-eqz v0, :cond_2

    iget-boolean v3, v0, Lcom/android/server/wm/AppWindowToken;->allDrawn:Z

    if-nez v3, :cond_2

    if-eqz v1, :cond_3

    .line 483
    :cond_2
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->performShowLocked()Z

    :cond_3
    move v1, v2

    .line 485
    goto :goto_0
.end method

.method computeShownFrameLocked()V
    .locals 31

    .prologue
    .line 857
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    .line 858
    .local v15, "selfTransformation":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAttachedWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v26, v0

    if-eqz v26, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAttachedWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    move/from16 v26, v0

    if-eqz v26, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAttachedWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v8, v0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    .line 861
    .local v8, "attachedTransformation":Landroid/view/animation/Transformation;
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    move-object/from16 v26, v0

    if-eqz v26, :cond_15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/android/server/wm/AppWindowAnimator;->hasTransformation:Z

    move/from16 v26, v0

    if-eqz v26, :cond_15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v6, v0, Lcom/android/server/wm/AppWindowAnimator;->transformation:Landroid/view/animation/Transformation;

    .line 866
    .local v6, "appTransformation":Landroid/view/animation/Transformation;
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWallpaperTarget:Lcom/android/server/wm/WindowState;

    move-object/from16 v22, v0

    .line 867
    .local v22, "wallpaperTarget":Lcom/android/server/wm/WindowState;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mIsWallpaper:Z

    move/from16 v26, v0

    if-eqz v26, :cond_1

    if-eqz v22, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/android/server/wm/WindowManagerService;->mAnimateWallpaperWithTarget:Z

    move/from16 v26, v0

    if-eqz v26, :cond_1

    .line 868
    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v21, v0

    .line 869
    .local v21, "wallpaperAnimator":Lcom/android/server/wm/WindowStateAnimator;
    move-object/from16 v0, v21

    iget-boolean v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    move/from16 v26, v0

    if-eqz v26, :cond_0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    move-object/from16 v26, v0

    if-eqz v26, :cond_0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/animation/Animation;->getDetachWallpaper()Z

    move-result v26

    if-nez v26, :cond_0

    .line 872
    move-object/from16 v0, v21

    iget-object v8, v0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    .line 877
    :cond_0
    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    move-object/from16 v26, v0

    if-nez v26, :cond_16

    const/16 v23, 0x0

    .line 879
    .local v23, "wpAppAnimator":Lcom/android/server/wm/AppWindowAnimator;
    :goto_2
    if-eqz v23, :cond_1

    move-object/from16 v0, v23

    iget-boolean v0, v0, Lcom/android/server/wm/AppWindowAnimator;->hasTransformation:Z

    move/from16 v26, v0

    if-eqz v26, :cond_1

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    move-object/from16 v26, v0

    if-eqz v26, :cond_1

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/animation/Animation;->getDetachWallpaper()Z

    move-result v26

    if-nez v26, :cond_1

    .line 882
    move-object/from16 v0, v23

    iget-object v6, v0, Lcom/android/server/wm/AppWindowAnimator;->transformation:Landroid/view/animation/Transformation;

    .line 889
    .end local v21    # "wallpaperAnimator":Lcom/android/server/wm/WindowStateAnimator;
    .end local v23    # "wpAppAnimator":Lcom/android/server/wm/AppWindowAnimator;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/android/server/wm/WindowState;->getDisplayId()I

    move-result v9

    .line 890
    .local v9, "displayId":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Lcom/android/server/wm/WindowAnimator;->getScreenRotationAnimationLocked(I)Lcom/android/server/wm/ScreenRotationAnimation;

    move-result-object v14

    .line 892
    .local v14, "screenRotationAnimation":Lcom/android/server/wm/ScreenRotationAnimation;
    if-eqz v14, :cond_17

    invoke-virtual {v14}, Lcom/android/server/wm/ScreenRotationAnimation;->isAnimating()Z

    move-result v26

    if-eqz v26, :cond_17

    const/4 v13, 0x1

    .line 895
    .local v13, "screenAnimation":Z
    :goto_3
    const/4 v12, 0x0

    .line 896
    .local v12, "needAdjust":Z
    const/16 v17, 0x0

    .line 897
    .local v17, "ssTransformation":Landroid/view/animation/Transformation;
    sget-boolean v26, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v26, :cond_2

    .line 898
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    invoke-interface/range {v26 .. v27}, Lcom/android/server/wm/IWmSmartShowFuncs;->needAdjustShownFrameLw(Ljava/lang/Object;)Z

    move-result v12

    .line 899
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/android/server/wm/WindowState;->getDisplayId()I

    move-result v27

    invoke-interface/range {v26 .. v27}, Lcom/android/server/wm/IWmSmartShowFuncs;->getSmartShowAnimationLw(I)Lcom/android/server/wm/ISmartShowInnerAnimation;

    move-result-object v5

    .line 900
    .local v5, "animation":Lcom/android/server/wm/ISmartShowInnerAnimation;
    if-nez v5, :cond_18

    const/16 v17, 0x0

    .line 901
    :goto_4
    if-eqz v17, :cond_2

    .line 902
    const/4 v12, 0x1

    .line 905
    .end local v5    # "animation":Lcom/android/server/wm/ISmartShowInnerAnimation;
    :cond_2
    if-nez v15, :cond_3

    if-nez v8, :cond_3

    if-nez v6, :cond_3

    if-nez v13, :cond_3

    if-eqz v12, :cond_1b

    .line 909
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v10, v0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    .line 910
    .local v10, "frame":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mTmpFloats:[F

    move-object/from16 v18, v0

    .line 911
    .local v18, "tmpFloats":[F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mTmpMatrix:Landroid/graphics/Matrix;

    move-object/from16 v19, v0

    .line 914
    .local v19, "tmpMatrix":Landroid/graphics/Matrix;
    if-eqz v13, :cond_1a

    invoke-virtual {v14}, Lcom/android/server/wm/ScreenRotationAnimation;->isRotating()Z

    move-result v26

    if-eqz v26, :cond_1a

    .line 922
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v26

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v20, v0

    .line 923
    .local v20, "w":F
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v26

    move/from16 v0, v26

    int-to-float v11, v0

    .line 924
    .local v11, "h":F
    const/high16 v26, 0x3f800000    # 1.0f

    cmpl-float v26, v20, v26

    if-ltz v26, :cond_19

    const/high16 v26, 0x3f800000    # 1.0f

    cmpl-float v26, v11, v26

    if-ltz v26, :cond_19

    .line 925
    const/high16 v26, 0x3f800000    # 1.0f

    const/high16 v27, 0x40000000    # 2.0f

    div-float v27, v27, v20

    add-float v26, v26, v27

    const/high16 v27, 0x3f800000    # 1.0f

    const/high16 v28, 0x40000000    # 2.0f

    div-float v28, v28, v11

    add-float v27, v27, v28

    const/high16 v28, 0x40000000    # 2.0f

    div-float v28, v20, v28

    const/high16 v29, 0x40000000    # 2.0f

    div-float v29, v11, v29

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 932
    .end local v11    # "h":F
    .end local v20    # "w":F
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    move/from16 v27, v0

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 933
    if-eqz v15, :cond_4

    .line 934
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 936
    :cond_4
    iget v0, v10, Landroid/graphics/Rect;->left:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/android/server/wm/WindowState;->mXOffset:I

    move/from16 v27, v0

    add-int v26, v26, v27

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    iget v0, v10, Landroid/graphics/Rect;->top:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/android/server/wm/WindowState;->mYOffset:I

    move/from16 v28, v0

    add-int v27, v27, v28

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 943
    sget-boolean v26, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v26, :cond_5

    .line 944
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lcom/android/server/wm/IWmSmartShowFuncs;->adjustShownFrameLw(Ljava/lang/Object;Landroid/graphics/Matrix;)V

    .line 948
    :cond_5
    if-eqz v8, :cond_6

    .line 949
    invoke-virtual {v8}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 951
    :cond_6
    if-eqz v6, :cond_7

    .line 952
    invoke-virtual {v6}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 954
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowAnimator;->mUniverseBackground:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v26, v0

    if-eqz v26, :cond_8

    .line 955
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowAnimator;->mUniverseBackground:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mUniverseTransform:Landroid/view/animation/Transformation;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 957
    :cond_8
    if-eqz v13, :cond_9

    .line 958
    invoke-virtual {v14}, Lcom/android/server/wm/ScreenRotationAnimation;->getEnterTransformation()Landroid/view/animation/Transformation;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 961
    :cond_9
    sget-boolean v26, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v26, :cond_a

    if-eqz v17, :cond_a

    .line 962
    invoke-virtual/range {v17 .. v17}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 966
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mDisplayMagnifier:Lcom/android/server/wm/DisplayMagnifier;

    move-object/from16 v26, v0

    if-eqz v26, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/android/server/wm/WindowState;->getDisplayId()I

    move-result v26

    if-nez v26, :cond_b

    .line 968
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mDisplayMagnifier:Lcom/android/server/wm/DisplayMagnifier;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Lcom/android/server/wm/DisplayMagnifier;->getMagnificationSpecForWindowLocked(Lcom/android/server/wm/WindowState;)Landroid/view/MagnificationSpec;

    move-result-object v16

    .line 970
    .local v16, "spec":Landroid/view/MagnificationSpec;
    if-eqz v16, :cond_b

    invoke-virtual/range {v16 .. v16}, Landroid/view/MagnificationSpec;->isNop()Z

    move-result v26

    if-nez v26, :cond_b

    .line 971
    move-object/from16 v0, v16

    iget v0, v0, Landroid/view/MagnificationSpec;->scale:F

    move/from16 v26, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/view/MagnificationSpec;->scale:F

    move/from16 v27, v0

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 972
    move-object/from16 v0, v16

    iget v0, v0, Landroid/view/MagnificationSpec;->offsetX:F

    move/from16 v26, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/view/MagnificationSpec;->offsetY:F

    move/from16 v27, v0

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 982
    .end local v16    # "spec":Landroid/view/MagnificationSpec;
    :cond_b
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mHaveMatrix:Z

    .line 983
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 984
    const/16 v26, 0x0

    aget v26, v18, v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    .line 985
    const/16 v26, 0x3

    aget v26, v18, v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    .line 986
    const/16 v26, 0x1

    aget v26, v18, v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    .line 987
    const/16 v26, 0x4

    aget v26, v18, v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    .line 988
    const/16 v26, 0x2

    aget v24, v18, v26

    .line 989
    .local v24, "x":F
    const/16 v26, 0x5

    aget v25, v18, v26

    .line 990
    .local v25, "y":F
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v20

    .line 991
    .local v20, "w":I
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v11

    .line 992
    .local v11, "h":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    move-object/from16 v26, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v27, v0

    add-float v27, v27, v24

    int-to-float v0, v11

    move/from16 v28, v0

    add-float v28, v28, v25

    move-object/from16 v0, v26

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v27

    move/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 999
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAlpha:F

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1001
    sget-boolean v26, Landroid/util/PowerMoConfig;->WITHOUT_FLOATING:Z

    if-nez v26, :cond_c

    .line 1002
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v28, v0

    invoke-interface/range {v26 .. v28}, Lcom/android/server/wm/IWmSmartShowFuncs;->adjustAlphaLw(Lcom/android/server/wm/WindowState;F)F

    move-result v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1005
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/android/server/wm/WindowManagerService;->mLimitedAlphaCompositing:Z

    move/from16 v26, v0

    if-eqz v26, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Landroid/graphics/PixelFormat;->formatHasAlpha(I)Z

    move-result v26

    if-eqz v26, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    move/from16 v30, v0

    invoke-virtual/range {v26 .. v30}, Lcom/android/server/wm/WindowState;->isIdentityMatrix(FFFF)Z

    move-result v26

    if-eqz v26, :cond_13

    iget v0, v10, Landroid/graphics/Rect;->left:I

    move/from16 v26, v0

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    cmpl-float v26, v24, v26

    if-nez v26, :cond_13

    iget v0, v10, Landroid/graphics/Rect;->top:I

    move/from16 v26, v0

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    cmpl-float v26, v25, v26

    if-nez v26, :cond_13

    .line 1010
    :cond_d
    if-eqz v15, :cond_e

    .line 1011
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v27

    mul-float v26, v26, v27

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1013
    :cond_e
    if-eqz v8, :cond_f

    .line 1014
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v26, v0

    invoke-virtual {v8}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v27

    mul-float v26, v26, v27

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1016
    :cond_f
    if-eqz v6, :cond_10

    .line 1017
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v26, v0

    invoke-virtual {v6}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v27

    mul-float v26, v26, v27

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1019
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowAnimator;->mUniverseBackground:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v26, v0

    if-eqz v26, :cond_11

    .line 1020
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/wm/WindowAnimator;->mUniverseBackground:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mUniverseTransform:Landroid/view/animation/Transformation;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v27

    mul-float v26, v26, v27

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1022
    :cond_11
    if-eqz v13, :cond_12

    .line 1023
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v26, v0

    invoke-virtual {v14}, Lcom/android/server/wm/ScreenRotationAnimation;->getEnterTransformation()Landroid/view/animation/Transformation;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v27

    mul-float v26, v26, v27

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1026
    :cond_12
    sget-boolean v26, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v26, :cond_13

    if-eqz v17, :cond_13

    .line 1027
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v26, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v27

    mul-float v26, v26, v27

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1119
    .end local v10    # "frame":Landroid/graphics/Rect;
    .end local v11    # "h":I
    .end local v18    # "tmpFloats":[F
    .end local v19    # "tmpMatrix":Landroid/graphics/Matrix;
    .end local v20    # "w":I
    .end local v24    # "x":F
    .end local v25    # "y":F
    :cond_13
    :goto_6
    return-void

    .line 858
    .end local v6    # "appTransformation":Landroid/view/animation/Transformation;
    .end local v8    # "attachedTransformation":Landroid/view/animation/Transformation;
    .end local v9    # "displayId":I
    .end local v12    # "needAdjust":Z
    .end local v13    # "screenAnimation":Z
    .end local v14    # "screenRotationAnimation":Lcom/android/server/wm/ScreenRotationAnimation;
    .end local v17    # "ssTransformation":Landroid/view/animation/Transformation;
    .end local v22    # "wallpaperTarget":Lcom/android/server/wm/WindowState;
    :cond_14
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 861
    .restart local v8    # "attachedTransformation":Landroid/view/animation/Transformation;
    :cond_15
    const/4 v6, 0x0

    goto/16 :goto_1

    .line 877
    .restart local v6    # "appTransformation":Landroid/view/animation/Transformation;
    .restart local v21    # "wallpaperAnimator":Lcom/android/server/wm/WindowStateAnimator;
    .restart local v22    # "wallpaperTarget":Lcom/android/server/wm/WindowState;
    :cond_16
    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    move-object/from16 v23, v0

    goto/16 :goto_2

    .line 892
    .end local v21    # "wallpaperAnimator":Lcom/android/server/wm/WindowStateAnimator;
    .restart local v9    # "displayId":I
    .restart local v14    # "screenRotationAnimation":Lcom/android/server/wm/ScreenRotationAnimation;
    :cond_17
    const/4 v13, 0x0

    goto/16 :goto_3

    .line 900
    .restart local v5    # "animation":Lcom/android/server/wm/ISmartShowInnerAnimation;
    .restart local v12    # "needAdjust":Z
    .restart local v13    # "screenAnimation":Z
    .restart local v17    # "ssTransformation":Landroid/view/animation/Transformation;
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-interface {v5, v0}, Lcom/android/server/wm/ISmartShowInnerAnimation;->getTransformationLw(Lcom/android/server/wm/WindowState;)Landroid/view/animation/Transformation;

    move-result-object v17

    goto/16 :goto_4

    .line 927
    .end local v5    # "animation":Lcom/android/server/wm/ISmartShowInnerAnimation;
    .restart local v10    # "frame":Landroid/graphics/Rect;
    .local v11, "h":F
    .restart local v18    # "tmpFloats":[F
    .restart local v19    # "tmpMatrix":Landroid/graphics/Matrix;
    .local v20, "w":F
    :cond_19
    invoke-virtual/range {v19 .. v19}, Landroid/graphics/Matrix;->reset()V

    goto/16 :goto_5

    .line 930
    .end local v11    # "h":F
    .end local v20    # "w":F
    :cond_1a
    invoke-virtual/range {v19 .. v19}, Landroid/graphics/Matrix;->reset()V

    goto/16 :goto_5

    .line 1044
    .end local v10    # "frame":Landroid/graphics/Rect;
    .end local v18    # "tmpFloats":[F
    .end local v19    # "tmpMatrix":Landroid/graphics/Matrix;
    :cond_1b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mIsWallpaper:Z

    move/from16 v26, v0

    if-eqz v26, :cond_1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mInnerFields:Lcom/android/server/wm/WindowManagerService$LayoutFields;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/android/server/wm/WindowManagerService$LayoutFields;->mWallpaperActionPending:Z

    move/from16 v26, v0

    if-nez v26, :cond_13

    .line 1052
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowAnimator;->mUniverseBackground:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v26, v0

    if-eqz v26, :cond_23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    move/from16 v26, v0

    const/16 v27, 0x7e9

    move/from16 v0, v26

    move/from16 v1, v27

    if-eq v0, v1, :cond_23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/server/wm/WindowState;->mBaseLayer:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/android/server/wm/WindowAnimator;->mAboveUniverseLayer:I

    move/from16 v27, v0

    move/from16 v0, v26

    move/from16 v1, v27

    if-ge v0, v1, :cond_23

    const/4 v7, 0x1

    .line 1055
    .local v7, "applyUniverseTransformation":Z
    :goto_7
    const/16 v16, 0x0

    .line 1057
    .restart local v16    # "spec":Landroid/view/MagnificationSpec;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mDisplayMagnifier:Lcom/android/server/wm/DisplayMagnifier;

    move-object/from16 v26, v0

    if-eqz v26, :cond_1d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/android/server/wm/WindowState;->getDisplayId()I

    move-result v26

    if-nez v26, :cond_1d

    .line 1058
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mDisplayMagnifier:Lcom/android/server/wm/DisplayMagnifier;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Lcom/android/server/wm/DisplayMagnifier;->getMagnificationSpecForWindowLocked(Lcom/android/server/wm/WindowState;)Landroid/view/MagnificationSpec;

    move-result-object v16

    .line 1061
    :cond_1d
    if-nez v7, :cond_1e

    if-nez v16, :cond_1e

    sget-boolean v26, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v26, :cond_24

    if-eqz v12, :cond_24

    .line 1063
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v10, v0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    .line 1064
    .restart local v10    # "frame":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mTmpFloats:[F

    move-object/from16 v18, v0

    .line 1065
    .restart local v18    # "tmpFloats":[F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mTmpMatrix:Landroid/graphics/Matrix;

    move-object/from16 v19, v0

    .line 1067
    .restart local v19    # "tmpMatrix":Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    move/from16 v27, v0

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 1068
    iget v0, v10, Landroid/graphics/Rect;->left:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/android/server/wm/WindowState;->mXOffset:I

    move/from16 v27, v0

    add-int v26, v26, v27

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    iget v0, v10, Landroid/graphics/Rect;->top:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/android/server/wm/WindowState;->mYOffset:I

    move/from16 v28, v0

    add-int v27, v27, v28

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1070
    if-eqz v7, :cond_1f

    .line 1071
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowAnimator;->mUniverseBackground:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mUniverseTransform:Landroid/view/animation/Transformation;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 1074
    :cond_1f
    if-eqz v16, :cond_20

    invoke-virtual/range {v16 .. v16}, Landroid/view/MagnificationSpec;->isNop()Z

    move-result v26

    if-nez v26, :cond_20

    .line 1075
    move-object/from16 v0, v16

    iget v0, v0, Landroid/view/MagnificationSpec;->scale:F

    move/from16 v26, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/view/MagnificationSpec;->scale:F

    move/from16 v27, v0

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 1076
    move-object/from16 v0, v16

    iget v0, v0, Landroid/view/MagnificationSpec;->offsetX:F

    move/from16 v26, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/view/MagnificationSpec;->offsetY:F

    move/from16 v27, v0

    move-object/from16 v0, v19

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1080
    :cond_20
    sget-boolean v26, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v26, :cond_21

    .line 1081
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lcom/android/server/wm/IWmSmartShowFuncs;->adjustShownFrameLw(Ljava/lang/Object;Landroid/graphics/Matrix;)V

    .line 1085
    :cond_21
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 1087
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mHaveMatrix:Z

    .line 1088
    const/16 v26, 0x0

    aget v26, v18, v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    .line 1089
    const/16 v26, 0x3

    aget v26, v18, v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    .line 1090
    const/16 v26, 0x1

    aget v26, v18, v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    .line 1091
    const/16 v26, 0x4

    aget v26, v18, v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    .line 1092
    const/16 v26, 0x2

    aget v24, v18, v26

    .line 1093
    .restart local v24    # "x":F
    const/16 v26, 0x5

    aget v25, v18, v26

    .line 1094
    .restart local v25    # "y":F
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v20

    .line 1095
    .local v20, "w":I
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v11

    .line 1096
    .local v11, "h":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    move-object/from16 v26, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v27, v0

    add-float v27, v27, v24

    int-to-float v0, v11

    move/from16 v28, v0

    add-float v28, v28, v25

    move-object/from16 v0, v26

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v27

    move/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1098
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAlpha:F

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1099
    if-eqz v7, :cond_22

    .line 1100
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/wm/WindowAnimator;->mUniverseBackground:Lcom/android/server/wm/WindowStateAnimator;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mUniverseTransform:Landroid/view/animation/Transformation;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v27

    mul-float v26, v26, v27

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1115
    .end local v10    # "frame":Landroid/graphics/Rect;
    .end local v11    # "h":I
    .end local v18    # "tmpFloats":[F
    .end local v19    # "tmpMatrix":Landroid/graphics/Matrix;
    .end local v20    # "w":I
    .end local v24    # "x":F
    .end local v25    # "y":F
    :cond_22
    :goto_8
    sget-boolean v26, Landroid/util/PowerMoConfig;->WITHOUT_FLOATING:Z

    if-nez v26, :cond_13

    .line 1116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    move/from16 v28, v0

    invoke-interface/range {v26 .. v28}, Lcom/android/server/wm/IWmSmartShowFuncs;->adjustAlphaLw(Lcom/android/server/wm/WindowState;F)F

    move-result v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    goto/16 :goto_6

    .line 1052
    .end local v7    # "applyUniverseTransformation":Z
    .end local v16    # "spec":Landroid/view/MagnificationSpec;
    :cond_23
    const/4 v7, 0x0

    goto/16 :goto_7

    .line 1103
    .restart local v7    # "applyUniverseTransformation":Z
    .restart local v16    # "spec":Landroid/view/MagnificationSpec;
    :cond_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 1104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/server/wm/WindowState;->mXOffset:I

    move/from16 v26, v0

    if-nez v26, :cond_25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/server/wm/WindowState;->mYOffset:I

    move/from16 v26, v0

    if-eqz v26, :cond_26

    .line 1105
    :cond_25
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/android/server/wm/WindowState;->mXOffset:I

    move/from16 v27, v0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/android/server/wm/WindowState;->mYOffset:I

    move/from16 v28, v0

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/RectF;->offset(FF)V

    .line 1107
    :cond_26
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAlpha:F

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    .line 1108
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mHaveMatrix:Z

    .line 1109
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    .line 1110
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    .line 1111
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    .line 1112
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    goto/16 :goto_8
.end method

.method createSurfaceLocked()Landroid/view/SurfaceControl;
    .locals 13

    .prologue
    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 634
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-nez v0, :cond_8

    .line 637
    iput v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    .line 638
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v0, :cond_0

    .line 639
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v0, v0, Lcom/android/server/wm/AppWindowToken;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-object v0, v0, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    if-nez v0, :cond_9

    .line 640
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iput-boolean v12, v0, Lcom/android/server/wm/AppWindowToken;->allDrawn:Z

    .line 641
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iput-boolean v12, v0, Lcom/android/server/wm/AppWindowToken;->deferClearAllDrawn:Z

    .line 649
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v0, v1}, Lcom/android/server/wm/WindowManagerService;->makeWindowFreezingScreenIfNeededLocked(Lcom/android/server/wm/WindowState;)V

    .line 651
    const/4 v6, 0x4

    .line 652
    .local v6, "flags":I
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v7, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    .line 655
    .local v7, "attrs":Landroid/view/WindowManager$LayoutParams;
    sget-boolean v0, Landroid/util/PowerMoConfig;->WITHOUT_SHOPM:Z

    if-nez v0, :cond_1

    .line 656
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-interface {v0, v1}, Lcom/android/server/wm/IWmSmartShowFuncs;->getSurfaceFlags(Ljava/lang/Object;)I

    move-result v0

    or-int/2addr v6, v0

    .line 659
    :cond_1
    iget v0, v7, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x2000

    if-eqz v0, :cond_2

    .line 660
    or-int/lit16 v6, v6, 0x80

    .line 669
    :cond_2
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    .line 670
    .local v3, "w":I
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    .line 671
    .local v4, "h":I
    iget v0, v7, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x4000

    if-eqz v0, :cond_3

    .line 674
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget v3, v0, Lcom/android/server/wm/WindowState;->mRequestedWidth:I

    .line 675
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget v4, v0, Lcom/android/server/wm/WindowState;->mRequestedHeight:I

    .line 680
    :cond_3
    if-gtz v3, :cond_4

    const/4 v3, 0x1

    .line 681
    :cond_4
    if-gtz v4, :cond_5

    const/4 v4, 0x1

    .line 683
    :cond_5
    iput-boolean v12, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceShown:Z

    .line 684
    iput v12, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceLayer:I

    .line 685
    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceAlpha:F

    .line 686
    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceX:F

    .line 687
    iput v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceY:F

    .line 688
    int-to-float v0, v3

    iput v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceW:F

    .line 689
    int-to-float v0, v4

    iput v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceH:F

    .line 690
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mLastSystemDecorRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v12, v12, v12, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 692
    :try_start_0
    iget v0, v7, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v1, 0x1000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_a

    move v9, v11

    .line 694
    .local v9, "isHwAccelerated":Z
    :goto_1
    if-eqz v9, :cond_b

    const/4 v5, -0x3

    .line 695
    .local v5, "format":I
    :goto_2
    iget v0, v7, Landroid/view/WindowManager$LayoutParams;->format:I

    invoke-static {v0}, Landroid/graphics/PixelFormat;->formatHasAlpha(I)Z

    move-result v0

    if-nez v0, :cond_6

    .line 696
    or-int/lit16 v6, v6, 0x400

    .line 704
    :cond_6
    new-instance v0, Landroid/view/SurfaceControl;

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mSession:Lcom/android/server/wm/Session;

    iget-object v1, v1, Lcom/android/server/wm/Session;->mSurfaceSession:Landroid/view/SurfaceSession;

    invoke-virtual {v7}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct/range {v0 .. v6}, Landroid/view/SurfaceControl;-><init>(Landroid/view/SurfaceSession;Ljava/lang/String;IIII)V

    iput-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    .line 709
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/server/wm/WindowState;->mHasSurface:Z
    :try_end_0
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 742
    invoke-static {}, Landroid/view/SurfaceControl;->openTransaction()V

    .line 745
    :try_start_1
    iget v0, v7, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    const/16 v1, 0x80

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/view/SurfaceControl;->setFlags(II)V

    :cond_7
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget v1, v1, Lcom/android/server/wm/WindowState;->mXOffset:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceX:F

    .line 746
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget v1, v1, Lcom/android/server/wm/WindowState;->mYOffset:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceY:F

    .line 747
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceX:F

    iget v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceY:F

    invoke-virtual {v0, v1, v2}, Landroid/view/SurfaceControl;->setPosition(FF)V

    .line 748
    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    iput v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceLayer:I

    .line 749
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mLayerStack:I

    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl;->setLayerStack(I)V

    .line 750
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl;->setLayer(I)V

    .line 751
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl;->setAlpha(F)V

    .line 752
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceShown:Z
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 757
    :goto_3
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 759
    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    .line 766
    .end local v3    # "w":I
    .end local v4    # "h":I
    .end local v5    # "format":I
    .end local v6    # "flags":I
    .end local v7    # "attrs":Landroid/view/WindowManager$LayoutParams;
    .end local v9    # "isHwAccelerated":Z
    :cond_8
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    :goto_4
    return-object v0

    .line 645
    :cond_9
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iput-boolean v11, v0, Lcom/android/server/wm/AppWindowToken;->deferClearAllDrawn:Z

    goto/16 :goto_0

    .restart local v3    # "w":I
    .restart local v4    # "h":I
    .restart local v6    # "flags":I
    .restart local v7    # "attrs":Landroid/view/WindowManager$LayoutParams;
    :cond_a
    move v9, v12

    .line 692
    goto/16 :goto_1

    .line 694
    .restart local v9    # "isHwAccelerated":Z
    :cond_b
    :try_start_3
    iget v5, v7, Landroid/view/WindowManager$LayoutParams;->format:I
    :try_end_3
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_2

    .line 718
    .end local v9    # "isHwAccelerated":Z
    :catch_0
    move-exception v8

    .line 719
    .local v8, "e":Landroid/view/Surface$OutOfResourcesException;
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iput-boolean v12, v0, Lcom/android/server/wm/WindowState;->mHasSurface:Z

    .line 720
    const-string v0, "WindowStateAnimator"

    const-string v1, "OutOfResourcesException creating surface"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 721
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v1, "create"

    invoke-virtual {v0, p0, v1, v11}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowStateAnimator;Ljava/lang/String;Z)Z

    .line 722
    iput v12, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    move-object v0, v10

    .line 723
    goto :goto_4

    .line 724
    .end local v8    # "e":Landroid/view/Surface$OutOfResourcesException;
    :catch_1
    move-exception v8

    .line 725
    .local v8, "e":Ljava/lang/Exception;
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iput-boolean v12, v0, Lcom/android/server/wm/WindowState;->mHasSurface:Z

    .line 726
    const-string v0, "WindowStateAnimator"

    const-string v1, "Exception creating surface"

    invoke-static {v0, v1, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 727
    iput v12, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    move-object v0, v10

    .line 728
    goto :goto_4

    .line 753
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v5    # "format":I
    .restart local v9    # "isHwAccelerated":Z
    :catch_2
    move-exception v8

    .line 754
    .local v8, "e":Ljava/lang/RuntimeException;
    :try_start_4
    const-string v0, "WindowStateAnimator"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error creating surface in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 755
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v1, "create-init"

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowStateAnimator;Ljava/lang/String;Z)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    .line 759
    .end local v8    # "e":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v0

    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    throw v0
.end method

.method destroyDeferredSurfaceLocked()V
    .locals 4

    .prologue
    .line 835
    :try_start_0
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    if-eqz v1, :cond_0

    .line 844
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    invoke-virtual {v1}, Landroid/view/SurfaceControl;->destroy()V

    .line 845
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v1, v2}, Lcom/android/server/wm/WindowAnimator;->hideWallpapersLocked(Lcom/android/server/wm/WindowState;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 852
    :cond_0
    :goto_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceDestroyDeferred:Z

    .line 853
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    .line 854
    return-void

    .line 847
    :catch_0
    move-exception v0

    .line 848
    .local v0, "e":Ljava/lang/RuntimeException;
    const-string v1, "WindowStateAnimator"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception thrown when destroying Window "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " surface "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " session "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSession:Lcom/android/server/wm/Session;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method destroySurfaceLocked()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 770
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v4, v4, Lcom/android/server/wm/AppWindowToken;->startingWindow:Lcom/android/server/wm/WindowState;

    if-ne v3, v4, :cond_0

    .line 771
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iput-boolean v6, v3, Lcom/android/server/wm/AppWindowToken;->startingDisplayed:Z

    .line 774
    :cond_0
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v3, :cond_4

    .line 776
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mChildWindows:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 777
    .local v2, "i":I
    :goto_0
    if-lez v2, :cond_1

    .line 778
    add-int/lit8 v2, v2, -0x1

    .line 779
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mChildWindows:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/WindowState;

    .line 780
    .local v0, "c":Lcom/android/server/wm/WindowState;
    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    goto :goto_0

    .line 793
    .end local v0    # "c":Lcom/android/server/wm/WindowState;
    :cond_1
    :try_start_0
    iget-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceDestroyDeferred:Z

    if-eqz v3, :cond_5

    .line 794
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eq v3, v4, :cond_3

    .line 795
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    if-eqz v3, :cond_2

    .line 804
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    invoke-virtual {v3}, Landroid/view/SurfaceControl;->destroy()V

    .line 806
    :cond_2
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iput-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    .line 819
    :cond_3
    :goto_1
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v3, v4}, Lcom/android/server/wm/WindowAnimator;->hideWallpapersLocked(Lcom/android/server/wm/WindowState;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 826
    :goto_2
    iput-boolean v6, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceShown:Z

    .line 827
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    .line 828
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iput-boolean v6, v3, Lcom/android/server/wm/WindowState;->mHasSurface:Z

    .line 829
    iput v6, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    .line 831
    .end local v2    # "i":I
    :cond_4
    return-void

    .line 817
    .restart local v2    # "i":I
    :cond_5
    :try_start_1
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v3}, Landroid/view/SurfaceControl;->destroy()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 820
    :catch_0
    move-exception v1

    .line 821
    .local v1, "e":Ljava/lang/RuntimeException;
    const-string v3, "WindowStateAnimator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception thrown when destroying Window "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " surface "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " session "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mSession:Lcom/android/server/wm/Session;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public dump(Ljava/io/PrintWriter;Ljava/lang/String;Z)V
    .locals 3
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "dumpAll"    # Z

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 1725
    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimationIsEntrance:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_1

    .line 1727
    :cond_0
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAnimating="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1728
    const-string v0, " mLocalAnimating="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1729
    const-string v0, " mAnimationIsEntrance="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimationIsEntrance:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1730
    const-string v0, " mAnimation="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1732
    :cond_1
    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasTransformation:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    if-eqz v0, :cond_3

    .line 1733
    :cond_2
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "XForm: has="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1734
    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasTransformation:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1735
    const-string v0, " hasLocal="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1736
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v0, p1}, Landroid/view/animation/Transformation;->printShortString(Ljava/io/PrintWriter;)V

    .line 1737
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1739
    :cond_3
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v0, :cond_5

    .line 1740
    if-eqz p3, :cond_4

    .line 1741
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSurface="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1742
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mDrawState="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1743
    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    invoke-static {v0}, Lcom/android/server/wm/WindowStateAnimator;->drawStateToString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1744
    const-string v0, " mLastHidden="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1746
    :cond_4
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Surface: shown="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceShown:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1747
    const-string v0, " layer="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceLayer:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1748
    const-string v0, " alpha="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1749
    const-string v0, " rect=("

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceX:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1750
    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceY:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1751
    const-string v0, ") "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceW:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1752
    const-string v0, " x "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceH:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1754
    :cond_5
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    if-eqz v0, :cond_6

    .line 1755
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mPendingDestroySurface="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1756
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mPendingDestroySurface:Landroid/view/SurfaceControl;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1758
    :cond_6
    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceResized:Z

    if-nez v0, :cond_7

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceDestroyDeferred:Z

    if-eqz v0, :cond_8

    .line 1759
    :cond_7
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSurfaceResized="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceResized:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 1760
    const-string v0, " mSurfaceDestroyDeferred="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceDestroyDeferred:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1762
    :cond_8
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v1, 0x7e9

    if-ne v0, v1, :cond_9

    .line 1763
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mUniverseTransform="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1764
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mUniverseTransform:Landroid/view/animation/Transformation;

    invoke-virtual {v0, p1}, Landroid/view/animation/Transformation;->printShortString(Ljava/io/PrintWriter;)V

    .line 1765
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1767
    :cond_9
    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_a

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAlpha:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_a

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastAlpha:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_b

    .line 1768
    :cond_a
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mShownAlpha="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1769
    const-string v0, " mAlpha="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1770
    const-string v0, " mLastAlpha="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastAlpha:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1772
    :cond_b
    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mHaveMatrix:Z

    if-nez v0, :cond_c

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget v0, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_d

    .line 1773
    :cond_c
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mGlobalScale="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget v0, v0, Lcom/android/server/wm/WindowState;->mGlobalScale:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1774
    const-string v0, " mDsDx="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1775
    const-string v0, " mDtDx="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1776
    const-string v0, " mDsDy="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(F)V

    .line 1777
    const-string v0, " mDtDy="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1779
    :cond_d
    return-void
.end method

.method finishDrawingLocked()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 452
    iget v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    if-ne v1, v0, :cond_0

    .line 460
    const/4 v1, 0x2

    iput v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    .line 463
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method finishExit()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 398
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mChildWindows:Lcom/android/server/wm/WindowList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 399
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 400
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mChildWindows:Lcom/android/server/wm/WindowList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowStateAnimator;->finishExit()V

    .line 399
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 403
    :cond_0
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v2, v2, Lcom/android/server/wm/WindowState;->mExiting:Z

    if-nez v2, :cond_2

    .line 427
    :cond_1
    :goto_1
    return-void

    .line 407
    :cond_2
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->isWindowAnimating()Z

    move-result v2

    if-nez v2, :cond_1

    .line 414
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v2, :cond_3

    .line 415
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mDestroySurface:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 416
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/android/server/wm/WindowState;->mDestroying:Z

    .line 419
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->hide()V

    .line 421
    :cond_3
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iput-boolean v4, v2, Lcom/android/server/wm/WindowState;->mExiting:Z

    .line 422
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v2, v2, Lcom/android/server/wm/WindowState;->mRemoveOnExit:Z

    if-eqz v2, :cond_4

    .line 423
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mPendingRemove:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iput-boolean v4, v2, Lcom/android/server/wm/WindowState;->mRemoveOnExit:Z

    .line 426
    :cond_4
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v2, v3}, Lcom/android/server/wm/WindowAnimator;->hideWallpapersLocked(Lcom/android/server/wm/WindowState;)V

    goto :goto_1
.end method

.method hide()V
    .locals 4

    .prologue
    .line 430
    iget-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z

    if-nez v1, :cond_0

    .line 432
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z

    .line 435
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v1, :cond_0

    .line 436
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceShown:Z

    .line 438
    :try_start_0
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v1}, Landroid/view/SurfaceControl;->hide()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    :cond_0
    :goto_0
    return-void

    .line 439
    :catch_0
    move-exception v0

    .line 440
    .local v0, "e":Ljava/lang/RuntimeException;
    const-string v1, "WindowStateAnimator"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception hiding surface in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method isAnimating()Z
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAttachedWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAttachedWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget-object v0, v0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-object v0, v0, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-object v0, v0, Lcom/android/server/wm/AppWindowAnimator;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-boolean v0, v0, Lcom/android/server/wm/AppWindowToken;->inPendingTransaction:Z

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isDummyAnimation()Z
    .locals 2

    .prologue
    .line 219
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-object v0, v0, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    sget-object v1, Lcom/android/server/wm/AppWindowAnimator;->sDummyAnimation:Landroid/view/animation/Animation;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isWindowAnimating()Z
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method performShowLocked()Z
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1510
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowState;->isHiddenFromUserLocked()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1511
    const-string v3, "WindowStateAnimator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "current user violation "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v5, v5, Lcom/android/server/wm/WindowManagerService;->mCurrentUserId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " trying to display "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v5, v5, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", belonging to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget v5, v5, Lcom/android/server/wm/WindowState;->mOwnerUid:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1605
    :cond_0
    :goto_0
    return v2

    .line 1536
    :cond_1
    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    if-ne v4, v5, :cond_0

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowState;->isReadyForDisplayIgnoringKeyguard()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1553
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->enableScreenIfNeededLocked()V

    .line 1555
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->applyEnterAnimationLocked()V

    .line 1558
    const/high16 v4, -0x40800000    # -1.0f

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastAlpha:F

    .line 1561
    const/4 v4, 0x4

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    .line 1562
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->scheduleAnimationLocked()V

    .line 1564
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mChildWindows:Lcom/android/server/wm/WindowList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1565
    .local v1, "i":I
    :cond_2
    :goto_1
    if-lez v1, :cond_3

    .line 1566
    add-int/lit8 v1, v1, -0x1

    .line 1567
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mChildWindows:Lcom/android/server/wm/WindowList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/WindowState;

    .line 1568
    .local v0, "c":Lcom/android/server/wm/WindowState;
    iget-boolean v4, v0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-eqz v4, :cond_2

    .line 1569
    iput-boolean v2, v0, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    .line 1570
    iget-object v4, v0, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget-object v4, v4, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v4, :cond_2

    .line 1571
    iget-object v4, v0, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowStateAnimator;->performShowLocked()Z

    .line 1577
    iget-object v4, v0, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    iput-boolean v3, v4, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    goto :goto_1

    .line 1582
    .end local v0    # "c":Lcom/android/server/wm/WindowState;
    :cond_3
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    if-eq v2, v5, :cond_5

    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v2, :cond_5

    .line 1584
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iput-boolean v3, v2, Lcom/android/server/wm/AppWindowToken;->firstWindowDrawn:Z

    .line 1586
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v2, v2, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    if-eqz v2, :cond_4

    .line 1595
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->clearAnimation()V

    .line 1596
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mFinishedStarting:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1597
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const/4 v4, 0x7

    invoke-virtual {v2, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1599
    :cond_4
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v2}, Lcom/android/server/wm/AppWindowToken;->updateReportedVisibilityLocked()V

    :cond_5
    move v2, v3

    .line 1602
    goto/16 :goto_0
.end method

.method public prepareSurfaceLocked(Z)V
    .locals 11
    .param p1, "recoveringMemory"    # Z

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1327
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    .line 1328
    .local v2, "w":Lcom/android/server/wm/WindowState;
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-nez v3, :cond_1

    .line 1329
    iget-boolean v3, v2, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    if-eqz v3, :cond_0

    .line 1333
    iput-boolean v9, v2, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    .line 1450
    :cond_0
    :goto_0
    return-void

    .line 1338
    :cond_1
    const/4 v0, 0x0

    .line 1340
    .local v0, "displayed":Z
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->computeShownFrameLocked()V

    .line 1342
    invoke-virtual {p0, p1}, Lcom/android/server/wm/WindowStateAnimator;->setSurfaceBoundariesLocked(Z)V

    .line 1344
    iget-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mIsWallpaper:Z

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v3, v3, Lcom/android/server/wm/WindowState;->mWallpaperVisible:Z

    if-nez v3, :cond_4

    .line 1346
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->hide()V

    .line 1436
    :cond_2
    :goto_1
    if-eqz v0, :cond_0

    .line 1437
    iget-boolean v3, v2, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    if-eqz v3, :cond_3

    .line 1438
    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isDrawnLw()Z

    move-result v3

    if-nez v3, :cond_e

    .line 1439
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iget v4, v3, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    and-int/lit8 v4, v4, -0x9

    iput v4, v3, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    .line 1440
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iput-object v2, v3, Lcom/android/server/wm/WindowAnimator;->mLastWindowFreezeSource:Ljava/lang/Object;

    .line 1448
    :cond_3
    :goto_2
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mToken:Lcom/android/server/wm/WindowToken;

    iput-boolean v10, v3, Lcom/android/server/wm/WindowToken;->hasVisible:Z

    goto :goto_0

    .line 1347
    :cond_4
    sget-boolean v3, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v3, :cond_5

    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-interface {v3, v4}, Lcom/android/server/wm/IWmSmartShowFuncs;->isHiddenRequestedLw(Lcom/android/server/wm/WindowState;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1348
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->hide()V

    goto :goto_1

    .line 1349
    :cond_5
    iget-boolean v3, v2, Lcom/android/server/wm/WindowState;->mAttachedHidden:Z

    if-nez v3, :cond_6

    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isOnScreen()Z

    move-result v3

    if-nez v3, :cond_8

    .line 1350
    :cond_6
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->hide()V

    .line 1351
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    invoke-virtual {v3, v2}, Lcom/android/server/wm/WindowAnimator;->hideWallpapersLocked(Lcom/android/server/wm/WindowState;)V

    .line 1359
    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isDrawnLw()Z

    move-result v3

    if-nez v3, :cond_7

    .line 1360
    const/4 v0, 0x1

    goto :goto_1

    .line 1361
    :cond_7
    iget-boolean v3, v2, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    if-eqz v3, :cond_2

    .line 1362
    iput-boolean v9, v2, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    goto :goto_1

    .line 1366
    :cond_8
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastLayer:I

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    if-ne v3, v4, :cond_9

    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastAlpha:F

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_9

    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDsDx:F

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_9

    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDtDx:F

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_9

    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDsDy:F

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_9

    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDtDy:F

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_9

    iget v3, v2, Lcom/android/server/wm/WindowState;->mLastHScale:F

    iget v4, v2, Lcom/android/server/wm/WindowState;->mHScale:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_9

    iget v3, v2, Lcom/android/server/wm/WindowState;->mLastVScale:F

    iget v4, v2, Lcom/android/server/wm/WindowState;->mVScale:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_9

    iget-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z

    if-eqz v3, :cond_d

    .line 1375
    :cond_9
    const/4 v0, 0x1

    .line 1376
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastAlpha:F

    .line 1377
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastLayer:I

    .line 1378
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDsDx:F

    .line 1379
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDtDx:F

    .line 1380
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDsDy:F

    .line 1381
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastDtDy:F

    .line 1382
    iget v3, v2, Lcom/android/server/wm/WindowState;->mHScale:F

    iput v3, v2, Lcom/android/server/wm/WindowState;->mLastHScale:F

    .line 1383
    iget v3, v2, Lcom/android/server/wm/WindowState;->mVScale:F

    iput v3, v2, Lcom/android/server/wm/WindowState;->mLastVScale:F

    .line 1390
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v3, :cond_2

    .line 1392
    :try_start_0
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceAlpha:F

    .line 1393
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mShownAlpha:F

    invoke-virtual {v3, v4}, Landroid/view/SurfaceControl;->setAlpha(F)V

    .line 1394
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceLayer:I

    .line 1395
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    invoke-virtual {v3, v4}, Landroid/view/SurfaceControl;->setLayer(I)V

    .line 1396
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDx:F

    iget v5, v2, Lcom/android/server/wm/WindowState;->mHScale:F

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDx:F

    iget v6, v2, Lcom/android/server/wm/WindowState;->mVScale:F

    mul-float/2addr v5, v6

    iget v6, p0, Lcom/android/server/wm/WindowStateAnimator;->mDsDy:F

    iget v7, v2, Lcom/android/server/wm/WindowState;->mHScale:F

    mul-float/2addr v6, v7

    iget v7, p0, Lcom/android/server/wm/WindowStateAnimator;->mDtDy:F

    iget v8, v2, Lcom/android/server/wm/WindowState;->mVScale:F

    mul-float/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/view/SurfaceControl;->setMatrix(FFFF)V

    .line 1400
    iget-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z

    if-eqz v3, :cond_b

    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_b

    .line 1405
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->showSurfaceRobustlyLocked()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 1406
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z

    .line 1407
    iget-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mIsWallpaper:Z

    if-eqz v3, :cond_a

    .line 1408
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const/4 v4, 0x1

    invoke-virtual {v3, v2, v4}, Lcom/android/server/wm/WindowManagerService;->dispatchWallpaperVisibility(Lcom/android/server/wm/WindowState;Z)V

    .line 1413
    :cond_a
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->getDisplayId()I

    move-result v4

    const/16 v5, 0x8

    invoke-virtual {v3, v4, v5}, Lcom/android/server/wm/WindowAnimator;->setPendingLayoutChanges(II)V

    .line 1419
    :cond_b
    :goto_3
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v3, :cond_2

    .line 1420
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mToken:Lcom/android/server/wm/WindowToken;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/android/server/wm/WindowToken;->hasVisible:Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 1422
    :catch_0
    move-exception v1

    .line 1423
    .local v1, "e":Ljava/lang/RuntimeException;
    const-string v3, "WindowStateAnimator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error updating surface in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1424
    if-nez p1, :cond_2

    .line 1425
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v4, "update"

    invoke-virtual {v3, p0, v4, v10}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowStateAnimator;Ljava/lang/String;Z)Z

    goto/16 :goto_1

    .line 1416
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :cond_c
    const/4 v3, 0x0

    :try_start_1
    iput-boolean v3, v2, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 1433
    :cond_d
    const/4 v0, 0x1

    goto/16 :goto_1

    .line 1444
    :cond_e
    iput-boolean v9, v2, Lcom/android/server/wm/WindowState;->mOrientationChanging:Z

    goto/16 :goto_2
.end method

.method public setAnimation(Landroid/view/animation/Animation;)V
    .locals 3
    .param p1, "anim"    # Landroid/view/animation/Animation;

    .prologue
    const/4 v0, 0x0

    .line 188
    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    .line 189
    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    .line 190
    iput-object p1, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    .line 191
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x2710

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->restrictDuration(J)V

    .line 192
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v1, v1, Lcom/android/server/wm/WindowManagerService;->mWindowAnimationScale:F

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->scaleCurrentDuration(F)V

    .line 194
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v0}, Landroid/view/animation/Transformation;->clear()V

    .line 195
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    iget-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastHidden:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/animation/Transformation;->setAlpha(F)V

    .line 196
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    .line 197
    return-void

    .line 195
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_0
.end method

.method setSurfaceBoundariesLocked(Z)V
    .locals 15
    .param p1, "recoveringMemory"    # Z

    .prologue
    .line 1200
    iget-object v9, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    .line 1202
    .local v9, "w":Lcom/android/server/wm/WindowState;
    iget-object v11, v9, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v11, v11, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v11, v11, 0x4000

    if-eqz v11, :cond_b

    .line 1205
    iget v10, v9, Lcom/android/server/wm/WindowState;->mRequestedWidth:I

    .line 1206
    .local v10, "width":I
    iget v3, v9, Lcom/android/server/wm/WindowState;->mRequestedHeight:I

    .line 1212
    .local v3, "height":I
    :goto_0
    const/4 v11, 0x1

    if-ge v10, v11, :cond_0

    .line 1213
    const/4 v10, 0x1

    .line 1215
    :cond_0
    const/4 v11, 0x1

    if-ge v3, v11, :cond_1

    .line 1216
    const/4 v3, 0x1

    .line 1218
    :cond_1
    iget v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceW:F

    int-to-float v12, v10

    cmpl-float v11, v11, v12

    if-nez v11, :cond_2

    iget v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceH:F

    int-to-float v12, v3

    cmpl-float v11, v11, v12

    if-eqz v11, :cond_c

    :cond_2
    const/4 v7, 0x1

    .line 1219
    .local v7, "surfaceResized":Z
    :goto_1
    if-eqz v7, :cond_3

    .line 1220
    int-to-float v11, v10

    iput v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceW:F

    .line 1221
    int-to-float v11, v3

    iput v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceH:F

    .line 1225
    :cond_3
    const/4 v5, 0x0

    .line 1226
    .local v5, "needClip":Z
    sget-boolean v11, Landroid/util/PowerMoConfig;->WITHOUT_SMART_DISPLAY:Z

    if-nez v11, :cond_4

    .line 1227
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v11}, Lcom/android/server/wm/WindowState;->isClipNeeded()Z

    move-result v5

    .line 1230
    :cond_4
    const/4 v6, 0x0

    .line 1231
    .local v6, "shouldUpdateClip":Z
    invoke-virtual {v9}, Lcom/android/server/wm/WindowState;->getStack()Lcom/android/server/wm/TaskStack;

    move-result-object v11

    iget-object v11, v11, Lcom/android/server/wm/TaskStack;->mStackBox:Lcom/android/server/wm/StackBox;

    iget-object v0, v11, Lcom/android/server/wm/StackBox;->mBounds:Landroid/graphics/Rect;

    .line 1232
    .local v0, "bounds":Landroid/graphics/Rect;
    iget-boolean v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceNeedClip:Z

    if-ne v11, v5, :cond_5

    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastBounds:Landroid/graphics/Rect;

    invoke-virtual {v11, v0}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_7

    .line 1233
    :cond_5
    const/4 v6, 0x1

    .line 1234
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastBounds:Landroid/graphics/Rect;

    invoke-virtual {v11, v0}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_6

    iget-boolean v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceNeedClip:Z

    if-nez v11, :cond_6

    iget-boolean v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceNeedClip:Z

    if-ne v11, v5, :cond_6

    .line 1235
    const/4 v6, 0x0

    .line 1237
    :cond_6
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mLastBounds:Landroid/graphics/Rect;

    invoke-virtual {v11, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 1238
    iput-boolean v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceNeedClip:Z

    .line 1242
    :cond_7
    iget-object v11, v9, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    iget v4, v11, Landroid/graphics/RectF;->left:F

    .line 1243
    .local v4, "left":F
    iget-object v11, v9, Lcom/android/server/wm/WindowState;->mShownFrame:Landroid/graphics/RectF;

    iget v8, v11, Landroid/graphics/RectF;->top:F

    .line 1245
    .local v8, "top":F
    iget v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceX:F

    cmpl-float v11, v11, v4

    if-nez v11, :cond_8

    iget v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceY:F

    cmpl-float v11, v11, v8

    if-eqz v11, :cond_9

    .line 1249
    :cond_8
    :try_start_0
    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceX:F

    .line 1250
    iput v8, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceY:F

    .line 1251
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v11, v4, v8}, Landroid/view/SurfaceControl;->setPosition(FF)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1262
    :cond_9
    :goto_2
    if-eqz v7, :cond_10

    .line 1266
    const/4 v11, 0x1

    :try_start_1
    iput-boolean v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceResized:Z

    .line 1268
    sget-boolean v11, Landroid/util/PowerMoConfig;->WITHOUT_SMART_DISPLAY:Z

    if-eqz v11, :cond_d

    .line 1269
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v11, v10, v3}, Landroid/view/SurfaceControl;->setSize(II)V

    .line 1282
    :goto_3
    iget-object v11, v9, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {v11}, Lcom/android/server/wm/DisplayContent;->getDisplayId()I

    move-result v1

    .line 1283
    .local v1, "displayId":I
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    const/4 v12, 0x4

    invoke-virtual {v11, v1, v12}, Lcom/android/server/wm/WindowAnimator;->setPendingLayoutChanges(II)V

    .line 1285
    iget-object v11, v9, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v11, v11, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit8 v11, v11, 0x2

    if-eqz v11, :cond_a

    .line 1286
    invoke-virtual {v9}, Lcom/android/server/wm/WindowState;->getStack()Lcom/android/server/wm/TaskStack;

    move-result-object v11

    invoke-virtual {v11, p0}, Lcom/android/server/wm/TaskStack;->startDimmingIfNeeded(Lcom/android/server/wm/WindowStateAnimator;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1323
    .end local v1    # "displayId":I
    :cond_a
    :goto_4
    invoke-virtual/range {p0 .. p1}, Lcom/android/server/wm/WindowStateAnimator;->updateSurfaceWindowCrop(Z)V

    .line 1324
    return-void

    .line 1208
    .end local v0    # "bounds":Landroid/graphics/Rect;
    .end local v3    # "height":I
    .end local v4    # "left":F
    .end local v5    # "needClip":Z
    .end local v6    # "shouldUpdateClip":Z
    .end local v7    # "surfaceResized":Z
    .end local v8    # "top":F
    .end local v10    # "width":I
    :cond_b
    iget-object v11, v9, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v10

    .line 1209
    .restart local v10    # "width":I
    iget-object v11, v9, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v3

    .restart local v3    # "height":I
    goto/16 :goto_0

    .line 1218
    :cond_c
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 1252
    .restart local v0    # "bounds":Landroid/graphics/Rect;
    .restart local v4    # "left":F
    .restart local v5    # "needClip":Z
    .restart local v6    # "shouldUpdateClip":Z
    .restart local v7    # "surfaceResized":Z
    .restart local v8    # "top":F
    :catch_0
    move-exception v2

    .line 1253
    .local v2, "e":Ljava/lang/RuntimeException;
    const-string v11, "WindowStateAnimator"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error positioning surface of "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " pos=("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ","

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ")"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1256
    if-nez p1, :cond_9

    .line 1257
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v12, "position"

    const/4 v13, 0x1

    invoke-virtual {v11, p0, v12, v13}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowStateAnimator;Ljava/lang/String;Z)Z

    goto :goto_2

    .line 1271
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :cond_d
    if-eqz v6, :cond_f

    .line 1272
    if-eqz v5, :cond_e

    .line 1273
    :try_start_2
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    const/high16 v12, 0x40000000    # 2.0f

    iget v13, v0, Landroid/graphics/Rect;->right:I

    shl-int/lit8 v13, v13, 0x10

    add-int/2addr v12, v13

    add-int/2addr v12, v10

    const/high16 v13, 0x40000000    # 2.0f

    iget v14, v0, Landroid/graphics/Rect;->bottom:I

    shl-int/lit8 v14, v14, 0x10

    add-int/2addr v13, v14

    add-int/2addr v13, v3

    invoke-virtual {v11, v12, v13}, Landroid/view/SurfaceControl;->setSize(II)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_3

    .line 1288
    :catch_1
    move-exception v2

    .line 1292
    .restart local v2    # "e":Ljava/lang/RuntimeException;
    const-string v11, "WindowStateAnimator"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error resizing surface of "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " size=("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "x"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ")"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1294
    if-nez p1, :cond_a

    .line 1295
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v12, "size"

    const/4 v13, 0x1

    invoke-virtual {v11, p0, v12, v13}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowStateAnimator;Ljava/lang/String;Z)Z

    goto/16 :goto_4

    .line 1275
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :cond_e
    :try_start_3
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    const/high16 v12, 0x40000000    # 2.0f

    add-int/2addr v12, v10

    const/high16 v13, 0x40000000    # 2.0f

    add-int/2addr v13, v3

    invoke-virtual {v11, v12, v13}, Landroid/view/SurfaceControl;->setSize(II)V

    goto/16 :goto_3

    .line 1278
    :cond_f
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v11, v10, v3}, Landroid/view/SurfaceControl;->setSize(II)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_3

    .line 1300
    :cond_10
    sget-boolean v11, Landroid/util/PowerMoConfig;->WITHOUT_SMART_DISPLAY:Z

    if-nez v11, :cond_a

    .line 1302
    if-eqz v6, :cond_a

    .line 1303
    if-eqz v5, :cond_11

    .line 1304
    :try_start_4
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    const/high16 v12, 0x40000000    # 2.0f

    iget v13, v0, Landroid/graphics/Rect;->right:I

    shl-int/lit8 v13, v13, 0x10

    add-int/2addr v12, v13

    const/high16 v13, 0x40000000    # 2.0f

    iget v14, v0, Landroid/graphics/Rect;->bottom:I

    shl-int/lit8 v14, v14, 0x10

    add-int/2addr v13, v14

    invoke-virtual {v11, v12, v13}, Landroid/view/SurfaceControl;->setSize(II)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_4

    .line 1309
    :catch_2
    move-exception v2

    .line 1313
    .restart local v2    # "e":Ljava/lang/RuntimeException;
    const-string v11, "WindowStateAnimator"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error clip surface of "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " size=("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "x"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ")"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " with clipping: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1315
    if-nez p1, :cond_a

    .line 1316
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v12, "size"

    const/4 v13, 0x1

    invoke-virtual {v11, p0, v12, v13}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowStateAnimator;Ljava/lang/String;Z)Z

    goto/16 :goto_4

    .line 1306
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :cond_11
    :try_start_5
    iget-object v11, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    const/high16 v12, 0x40000000    # 2.0f

    const/high16 v13, 0x40000000    # 2.0f

    invoke-virtual {v11, v12, v13}, Landroid/view/SurfaceControl;->setSize(II)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_4
.end method

.method setTransparentRegionHintLocked(Landroid/graphics/Region;)V
    .locals 2
    .param p1, "region"    # Landroid/graphics/Region;

    .prologue
    .line 1453
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-nez v0, :cond_0

    .line 1454
    const-string v0, "WindowStateAnimator"

    const-string v1, "setTransparentRegionHint: null mSurface after mHasSurface true"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1474
    :goto_0
    return-void

    .line 1459
    :cond_0
    invoke-static {}, Landroid/view/SurfaceControl;->openTransaction()V

    .line 1462
    :try_start_0
    sget-boolean v0, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v0, :cond_1

    .line 1463
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mWmsFuncs:Lcom/android/server/wm/IWmSmartShowFuncs;

    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-interface {v0, p1, v1}, Lcom/android/server/wm/IWmSmartShowFuncs;->adjustTransparentRegion(Landroid/graphics/Region;Ljava/lang/Object;)V

    .line 1468
    :cond_1
    iget-object v0, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v0, p1}, Landroid/view/SurfaceControl;->setTransparentRegionHint(Landroid/graphics/Region;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1470
    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    throw v0
.end method

.method setWallpaperOffset(Landroid/graphics/RectF;)V
    .locals 6
    .param p1, "shownFrame"    # Landroid/graphics/RectF;

    .prologue
    .line 1477
    iget v3, p1, Landroid/graphics/RectF;->left:F

    float-to-int v1, v3

    .line 1478
    .local v1, "left":I
    iget v3, p1, Landroid/graphics/RectF;->top:F

    float-to-int v2, v3

    .line 1479
    .local v2, "top":I
    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceX:F

    int-to-float v4, v1

    cmpl-float v3, v3, v4

    if-nez v3, :cond_0

    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceY:F

    int-to-float v4, v2

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_1

    :cond_0
    int-to-float v3, v1

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceX:F

    int-to-float v3, v2

    iput v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceY:F

    iget-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    if-eqz v3, :cond_2

    iget v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAttrType:I

    const/16 v4, 0x7dd

    if-eq v3, v4, :cond_2

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-static {}, Landroid/view/SurfaceControl;->openTransaction()V

    :try_start_0
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    add-int/2addr v4, v1

    int-to-float v4, v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v5, v5, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    add-int/2addr v5, v2

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/view/SurfaceControl;->setPosition(FF)V

    .line 1496
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/server/wm/WindowStateAnimator;->updateSurfaceWindowCrop(Z)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1501
    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    goto :goto_0

    .line 1497
    :catch_0
    move-exception v0

    .line 1498
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_1
    const-string v3, "WindowStateAnimator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error positioning surface of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " pos=("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1501
    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v3

    invoke-static {}, Landroid/view/SurfaceControl;->closeTransaction()V

    throw v3
.end method

.method showSurfaceRobustlyLocked()Z
    .locals 6

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1618
    :try_start_0
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v3, :cond_0

    .line 1619
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceShown:Z

    .line 1620
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v3}, Landroid/view/SurfaceControl;->show()V

    .line 1621
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v3, v3, Lcom/android/server/wm/WindowState;->mTurnOnScreen:Z

    if-eqz v3, :cond_0

    .line 1624
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lcom/android/server/wm/WindowState;->mTurnOnScreen:Z

    .line 1625
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iget v4, v3, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I

    or-int/lit8 v4, v4, 0x10

    iput v4, v3, Lcom/android/server/wm/WindowAnimator;->mBulkUpdateParams:I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1635
    :cond_0
    :goto_0
    return v1

    .line 1629
    :catch_0
    move-exception v0

    .line 1630
    .local v0, "e":Ljava/lang/RuntimeException;
    const-string v3, "WindowStateAnimator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failure showing surface "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1633
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v4, "show"

    invoke-virtual {v3, p0, v4, v1}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowStateAnimator;Ljava/lang/String;Z)Z

    move v1, v2

    .line 1635
    goto :goto_0
.end method

.method stepAnimationLocked(J)Z
    .locals 10
    .param p1, "currentTime"    # J

    .prologue
    const/4 v9, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 254
    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    iput-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWasAnimating:Z

    .line 255
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->okToDisplay()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 258
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowState;->isDrawnLw()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_1

    .line 259
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasTransformation:Z

    .line 260
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    .line 261
    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    if-nez v4, :cond_0

    .line 268
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v5, v5, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    iget-object v6, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v6, v6, Lcom/android/server/wm/WindowState;->mFrame:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    iget v7, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimDw:I

    iget v8, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimDh:I

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 270
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {v4}, Lcom/android/server/wm/DisplayContent;->getDisplayInfo()Landroid/view/DisplayInfo;

    move-result-object v1

    .line 271
    .local v1, "displayInfo":Landroid/view/DisplayInfo;
    iget v4, v1, Landroid/view/DisplayInfo;->appWidth:I

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimDw:I

    .line 272
    iget v4, v1, Landroid/view/DisplayInfo;->appHeight:I

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimDh:I

    .line 273
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4, p1, p2}, Landroid/view/animation/Animation;->setStartTime(J)V

    .line 274
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    .line 275
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    .line 277
    .end local v1    # "displayInfo":Landroid/view/DisplayInfo;
    :cond_0
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_1

    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    if-eqz v4, :cond_1

    .line 278
    invoke-direct {p0, p1, p2}, Lcom/android/server/wm/WindowStateAnimator;->stepAnimation(J)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 388
    :goto_0
    return v2

    .line 287
    :cond_1
    iput-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    .line 288
    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimationIsEntrance:Z

    if-eqz v4, :cond_3

    :cond_2
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAppAnimator:Lcom/android/server/wm/AppWindowAnimator;

    iget-object v4, v4, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_3

    .line 297
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    .line 298
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasTransformation:Z

    .line 299
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v2}, Landroid/view/animation/Transformation;->clear()V

    move v2, v3

    .line 300
    goto :goto_0

    .line 301
    :cond_3
    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasTransformation:Z

    if-eqz v4, :cond_5

    .line 304
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    .line 314
    :cond_4
    :goto_1
    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    if-nez v4, :cond_7

    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    if-nez v4, :cond_7

    move v2, v3

    .line 315
    goto :goto_0

    .line 305
    :cond_5
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->isAnimating()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 306
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    goto :goto_1

    .line 308
    :cond_6
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_4

    .line 311
    iput-boolean v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    goto :goto_1

    .line 324
    :cond_7
    iput-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimating:Z

    .line 325
    iput-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mLocalAnimating:Z

    .line 326
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v4, :cond_8

    .line 327
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4}, Landroid/view/animation/Animation;->cancel()V

    .line 328
    iput-object v9, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimation:Landroid/view/animation/Animation;

    .line 330
    :cond_8
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iget-object v4, v4, Lcom/android/server/wm/WindowAnimator;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    if-ne v4, v5, :cond_9

    .line 331
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iput-object v9, v4, Lcom/android/server/wm/WindowAnimator;->mWindowDetachedWallpaper:Lcom/android/server/wm/WindowState;

    .line 333
    :cond_9
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget v4, v4, Lcom/android/server/wm/WindowState;->mLayer:I

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    .line 334
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowState;->mIsImWindow:Z

    if-eqz v4, :cond_f

    .line 335
    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v5, v5, Lcom/android/server/wm/WindowManagerService;->mInputMethodAnimLayerAdjustment:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    .line 341
    :cond_a
    :goto_2
    iput-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasTransformation:Z

    .line 342
    iput-boolean v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mHasLocalTransformation:Z

    .line 343
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v5, v5, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    if-eq v4, v5, :cond_c

    .line 348
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v5, v5, Lcom/android/server/wm/WindowState;->mPolicyVisibilityAfterAnim:Z

    iput-boolean v5, v4, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    .line 349
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    iput-boolean v2, v4, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    .line 350
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-nez v4, :cond_c

    .line 351
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    if-ne v4, v5, :cond_b

    .line 354
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iput-boolean v2, v4, Lcom/android/server/wm/WindowManagerService;->mFocusMayChange:Z

    .line 359
    :cond_b
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowManagerService;->enableScreenIfNeededLocked()V

    .line 362
    :cond_c
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->clear()V

    .line 363
    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mDrawState:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_10

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v4, v4, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v5, 0x3

    if-ne v4, v5, :cond_10

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v4, :cond_10

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-boolean v4, v4, Lcom/android/server/wm/AppWindowToken;->firstWindowDrawn:Z

    if-eqz v4, :cond_10

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v4, v4, Lcom/android/server/wm/AppWindowToken;->startingData:Lcom/android/server/wm/StartingData;

    if-eqz v4, :cond_10

    .line 370
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mFinishedStarting:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 371
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    const/4 v4, 0x7

    invoke-virtual {v2, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 378
    :cond_d
    :goto_3
    invoke-virtual {p0}, Lcom/android/server/wm/WindowStateAnimator;->finishExit()V

    .line 379
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {v2}, Lcom/android/server/wm/DisplayContent;->getDisplayId()I

    move-result v0

    .line 380
    .local v0, "displayId":I
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    const/16 v4, 0x8

    invoke-virtual {v2, v0, v4}, Lcom/android/server/wm/WindowAnimator;->setPendingLayoutChanges(II)V

    .line 381
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v4, "WindowStateAnimator"

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    invoke-virtual {v5, v0}, Lcom/android/server/wm/WindowAnimator;->getPendingLayoutChanges(I)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Lcom/android/server/wm/WindowManagerService;->debugLayoutRepeats(Ljava/lang/String;I)V

    .line 384
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    if-eqz v2, :cond_e

    .line 385
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    invoke-virtual {v2}, Lcom/android/server/wm/AppWindowToken;->updateReportedVisibilityLocked()V

    :cond_e
    move v2, v3

    .line 388
    goto/16 :goto_0

    .line 336
    .end local v0    # "displayId":I
    :cond_f
    iget-boolean v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mIsWallpaper:Z

    if-eqz v4, :cond_a

    .line 337
    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    iget-object v5, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v5, v5, Lcom/android/server/wm/WindowManagerService;->mWallpaperAnimLayerAdjustment:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimLayer:I

    goto/16 :goto_2

    .line 372
    :cond_10
    iget v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mAttrType:I

    const/16 v5, 0x7d0

    if-ne v4, v5, :cond_d

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-boolean v4, v4, Lcom/android/server/wm/WindowState;->mPolicyVisibility:Z

    if-eqz v4, :cond_d

    .line 375
    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v4, v4, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    iput-boolean v2, v4, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    goto :goto_3
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1783
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "WindowStateAnimator{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1784
    .local v0, "sb":Ljava/lang/StringBuffer;
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1785
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1786
    iget-object v1, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    iget-object v1, v1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v1}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuffer;

    .line 1787
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1788
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method updateSurfaceWindowCrop(Z)V
    .locals 9
    .param p1, "recoveringMemory"    # Z

    .prologue
    const/4 v6, 0x0

    .line 1147
    iget-object v2, p0, Lcom/android/server/wm/WindowStateAnimator;->mWin:Lcom/android/server/wm/WindowState;

    .line 1148
    .local v2, "w":Lcom/android/server/wm/WindowState;
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {v3}, Lcom/android/server/wm/DisplayContent;->getDisplayInfo()Landroid/view/DisplayInfo;

    move-result-object v0

    .line 1151
    .local v0, "displayInfo":Landroid/view/DisplayInfo;
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v3, v3, 0x4000

    if-eqz v3, :cond_1

    .line 1154
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget v4, v2, Lcom/android/server/wm/WindowState;->mRequestedWidth:I

    iget v5, v2, Lcom/android/server/wm/WindowState;->mRequestedHeight:I

    invoke-virtual {v3, v6, v6, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 1183
    :goto_0
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mLastSystemDecorRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1184
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mLastSystemDecorRect:Landroid/graphics/Rect;

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 1188
    :try_start_0
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/view/SurfaceControl;->setWindowCrop(Landroid/graphics/Rect;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1197
    :cond_0
    :goto_1
    return-void

    .line 1155
    :cond_1
    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isDefaultDisplay()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1158
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    iget-object v5, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-virtual {v3, v6, v6, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 1159
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    neg-int v4, v4

    iget-object v5, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    neg-int v5, v5

    iget v6, v0, Landroid/view/DisplayInfo;->logicalWidth:I

    iget-object v7, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    sub-int/2addr v6, v7

    iget v7, v0, Landroid/view/DisplayInfo;->logicalHeight:I

    iget-object v8, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->top:I

    sub-int/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Rect;->intersect(IIII)Z

    goto :goto_0

    .line 1162
    :cond_2
    iget v3, v2, Lcom/android/server/wm/WindowState;->mLayer:I

    iget-object v4, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget v4, v4, Lcom/android/server/wm/WindowManagerService;->mSystemDecorLayer:I

    if-lt v3, v4, :cond_4

    .line 1167
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mAnimator:Lcom/android/server/wm/WindowAnimator;

    iget-object v3, v3, Lcom/android/server/wm/WindowAnimator;->mUniverseBackground:Lcom/android/server/wm/WindowStateAnimator;

    if-nez v3, :cond_3

    .line 1168
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    iget-object v5, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-virtual {v3, v6, v6, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 1171
    :cond_3
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mScreenRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v3}, Lcom/android/server/wm/WindowStateAnimator;->applyDecorRect(Landroid/graphics/Rect;)V

    goto :goto_0

    .line 1173
    :cond_4
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v4, 0x7e9

    if-eq v3, v4, :cond_5

    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mDecorFrame:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1176
    :cond_5
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    iget-object v5, v2, Lcom/android/server/wm/WindowState;->mCompatFrame:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-virtual {v3, v6, v6, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    goto/16 :goto_0

    .line 1180
    :cond_6
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mDecorFrame:Landroid/graphics/Rect;

    invoke-virtual {p0, v3}, Lcom/android/server/wm/WindowStateAnimator;->applyDecorRect(Landroid/graphics/Rect;)V

    goto/16 :goto_0

    .line 1189
    :catch_0
    move-exception v1

    .line 1190
    .local v1, "e":Ljava/lang/RuntimeException;
    const-string v3, "WindowStateAnimator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error setting crop surface of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " crop="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lcom/android/server/wm/WindowState;->mSystemDecorRect:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1192
    if-nez p1, :cond_0

    .line 1193
    iget-object v3, p0, Lcom/android/server/wm/WindowStateAnimator;->mService:Lcom/android/server/wm/WindowManagerService;

    const-string v4, "crop"

    const/4 v5, 0x1

    invoke-virtual {v3, p0, v4, v5}, Lcom/android/server/wm/WindowManagerService;->reclaimSomeSurfaceMemoryLocked(Lcom/android/server/wm/WindowStateAnimator;Ljava/lang/String;Z)Z

    goto/16 :goto_1
.end method
