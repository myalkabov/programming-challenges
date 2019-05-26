public class NQueens {

    private static int     found = 0;
    private static int[][] board;
    private static int[]   row, col;
    private static int[]   diagL, diagR;

    public static boolean isValid(int r, int c, int n) {
        if (row[r] == 0 && col[c] == 0) 
            if (diagR[r+c] == 0 && diagL[r-c+n-1] == 0)
                return true;
        return false;
    }

    public static void putQueen(int r, int c, int n) {
        board[r][c]    = 1;
        row[r]         = 1;
        col[c]         = 1;
        diagR[r+c]     = 1;
        diagL[r-c+n-1] = 1;
    }

    public static void removeQueen(int r, int c, int n) {
        board[r][c]    = 0;
        row[r]         = 0;
        col[c]         = 0;
        diagR[r+c]     = 0;
        diagL[r-c+n-1] = 0;
    }

    public static void showBoard(int n) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++)
                System.out.print(board[i][j] + " ");

            System.out.println();
        }
        System.out.println();
    }

    public static void solve(int r, int n) {
        if (r == n) { // Base Case
            found++;
            System.out.println(found);
            showBoard(n);
        } else {
            for (int i = 0; i < n; i++)
                if (isValid(r, i, n)) {
                    putQueen(r, i, n);
                    solve(r + 1, n);      // Recursive Case
                    removeQueen(r, i, n); // Backtracking Case
                }
        }
    }

    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        board = new int[n][n];
        row   = new int[n];
        col   = new int[n];
        diagR = new int[2*n-1];
        diagL = new int[2*n-1];

        solve(0, n);
    }
}