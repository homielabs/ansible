# Swap

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Allocate swap

Stolen from [aeolyus/homelab](https://github.com/aeolyus/homelab/tree/master/swap).

### Dependencies

None

### Variables

| Variable   | Description        | Default                                     | Type |
| ---------- | ------------------ | ------------------------------------------- | ---- |
| swap_file  | swap file location | `/swapfile`                                 | str  |
| swap_size  | swap size          | 2x machine RAM if RAM < 2G else machine RAM | str  |
| swappiness | swappiness         | "1"                                         | str  |

### Notes

None
