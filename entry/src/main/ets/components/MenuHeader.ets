import { MenuHeaderType, DirectionType, HeaderListType } from '../constant/MenuHeaderData'
import { mViewModel } from '../model/viewmodel/mViewModel'

@Component
export struct MenuHeader {
  headerData: MenuHeaderType[] | undefined
  memoViewModel: mViewModel | undefined

  @Builder
  headerItem(item: MenuHeaderType) {
    Row() {
      Image(item.defaultImageSrc)
        .width(22)
        .height(22)
    }
    .justifyContent(FlexAlign.Center)
    .align(Alignment.Center)
    .width(36)
    .height(36)
    .borderRadius(18)
    .backgroundColor($r('app.color.search_gray'))
    .onClick(() => {
      // 如果点击加号，新建一个备忘录
      if (item.id === HeaderListType.NEWFILE) {
        this.memoViewModel?.newMemo()
      }
    })

  }

  @Builder
  leftContent() {
    Row({ space: 10 }) {
      ForEach(this.headerData, (item: MenuHeaderType) => {
        if (item.direction === DirectionType.left) {
          this.headerItem(item)
        }
      })
    }
  }

  @Builder
  rightContent() {
    Row({ space: 10 }) {
      ForEach(this.headerData, (item: MenuHeaderType) => {
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