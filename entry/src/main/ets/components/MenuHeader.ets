import { MemoMenuItem, DirectionType, } from '../model/MemoMenuItem'
import { mViewModel } from '../model/viewmodel/mViewModel'
import { ObservedArray } from '../model/observedArray'


// 不能使用builder，需要使用Component以能用ObjectLink接收数据
@Component
struct headerItem {
  @ObjectLink item: MemoMenuItem

  build() {
    Row() {
      Image(this.item.currentImageSrc)
        .width(22)
        .height(22)
    }
    .justifyContent(FlexAlign.Center)
    .align(Alignment.Center)
    .width(36)
    .height(36)
    .borderRadius(18)
    .backgroundColor($r('app.color.search_gray'))
    .opacity(this.item.isActive ? 1 : 0.3)
    .onClick(() => {
      if (this.item.isActive && this.item.onClick) {
        this.item.onClick()
      }
    })
  }
}

@Component
export struct MenuHeader {
  @ObjectLink headerData: ObservedArray<MemoMenuItem>
  @Consume memoViewModel: mViewModel | undefined

  @Builder
  leftContent() {
    Row({ space: 10 }) {
      ForEach(this.headerData, (item: MemoMenuItem) => {
        if (item.direction === DirectionType.left) {
          headerItem({ item: item })
        }
      })
    }
  }

  @Builder
  rightContent() {
    Row({ space: 10 }) {
      ForEach(this.headerData, (item: MemoMenuItem) => {
        if (item.direction === DirectionType.right) {
          headerItem({ item: item })
        }
      })
    }
  }

  build() {
    Row() {
      this.leftContent()
      this.rightContent()
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .height(50)
    .align(Alignment.Center)
  }
}