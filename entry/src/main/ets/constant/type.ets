export interface FileType {
  id: number
  title: string | Resource
  content: string
  time: string
  typeColor: string | Resource | Color
  folderName: string | Resource
}