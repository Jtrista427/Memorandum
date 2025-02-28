import { HeaderListType } from '../constant/MenuHeaderData'
import { MemoMenuItem, DirectionType, } from '../model/MemoMenuItem'
import { mViewModel } from '../model/viewmodel/mViewModel'

@Component
export struct MenuHeader {
  headerData: MemoMenuItem[] | undefined
  @Consume memoViewModel: mViewModel | undefined

  @Builder
  headerItem(item: MemoMenuItem) {
    Row() {
      Image(item.currentImageSrc)
        .width(22)
        .height(22)
    }
    .justifyContent(FlexAlign.Center)
    .align(Alignment.Center)
    .width(36)
    .height(36)
    .borderRadius(18)
    .backgroundColor($r('app.color.search_gray'))
    .opacity(item.isActive ? 1 : 0.3)
    .onClick(() => {
      if (item.isActive && item.onClick) {
        item.onClick()
      }
    })
  }

  @Builder
  leftContent() {
    Row({ space: 10 }) {
      ForEach(this.headerData, (item: MemoMenuItem) => {
        if (item.direction === DirectionType.left) {
          this.headerItem(item)
        }
      })
    }
  }

  @Builder
  rightContent() {
    Row({ space: 10 }) {
      ForEach(this.headerData, (item: MemoMenuItem) => {
        if (item.direction === DirectionType.right) {
          this.headerItem(item)
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