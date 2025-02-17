import { MenuHeaderType, menuHeaderData, DirectionType } from '../../constant/MenuHeaderData'

@Component
export struct MenuHeader {
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
      // TODO
    })

  }

  @Builder
  leftContent() {
    Row({ space: 10 }) {
      ForEach(menuHeaderData, (item: MenuHeaderType) => {
        if (item.direction === DirectionType.left) {
          this.headerItem(item)
        }
      })
    }
  }

  @Builder
  rightContent() {
    Row({ space: 10 }) {
      ForEach(menuHeaderData, (item: MenuHeaderType) => {
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